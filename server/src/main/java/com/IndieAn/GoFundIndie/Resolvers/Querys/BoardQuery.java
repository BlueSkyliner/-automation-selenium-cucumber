package com.IndieAn.GoFundIndie.Resolvers.Querys;

import com.IndieAn.GoFundIndie.Common.SearchTypes;
import com.IndieAn.GoFundIndie.Domain.Entity.Board;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.*;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Board.*;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Comment.CommentGraphQLDTO;
import com.IndieAn.GoFundIndie.Service.GqlUserValidService;
import com.IndieAn.GoFundIndie.Service.UserService;
import graphql.kickstart.servlet.context.GraphQLServletContext;
import graphql.schema.DataFetchingEnvironment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class BoardQuery {
    private final BoardRepository boardRepository;
    private final CommentRepository commentRepository;
    private final CastingRepository castingRepository;
    private final GenreRepository genreRepository;
    private final ImageRepository imageRepository;
    private final BoardLikeRepository boardLikeRepository;
    private final CommentRatingRepository commentRatingRepository;

    private final GqlUserValidService gqlUserValidService;

    public WrappingViewBoardDTO FindBoardId(Long id, DataFetchingEnvironment env) {
        try {
            Board board = boardRepository.findBoardId(id);
            if(board == null) return WrappingViewBoardDTO.builder().code(4401).build();

            boolean envCheck = false;
            User user = null;

            if(gqlUserValidService.envValidCheck(env) == 0){
                user = gqlUserValidService.findUser(env);
                if(user != null){
                    envCheck = true;
                }
            }

            List<CommentGraphQLDTO> commentList = commentRepository.findCommentByBoard(id, null);

            ViewBoardDTO dto = ViewBoardDTO.from(board);
            dto.setCasting(castingRepository.findCastingByBoard(id));
            dto.setGenre(genreRepository.findGenreByBoard(id));
            dto.setStill(imageRepository.findStillByBoard(id));

            if(commentList.size() > 0) {
                List<CommentGraphQLDTO> commentTopFive = new ArrayList<>();

                int listRange = 5;
                if(commentList.size() < listRange) listRange = commentList.size();

                for(int i = 0 ; i < listRange ; i++) {
                    commentTopFive.add(commentList.get(i));
                }

                int a = 0;

                // TODO Board 에 Comment rating 값도 저장 탐색 안해도 되게
                for(CommentGraphQLDTO el : commentList) {
                    a = a + el.getRating();
                }

                dto.setAverageRating(Math.round((a / commentList.size()) * 10) / 10);

                if(envCheck) {
                    long userId = user.getId();
                    commentTopFive = commentTopFive.stream().map(el -> {
                        el.setRatingChecked(
                                commentRatingRepository.commentRatedCheck(userId, el.getId()));
                        return el;
                    }).collect(Collectors.toList());
                }

                dto.setComment(commentTopFive);
            } else {
                dto.setComment(commentList);
                dto.setAverageRating(0);
            }

            if(envCheck) {
                dto.setLiked(boardLikeRepository
                        .isLikedBoard(user,board));
            } else {
                dto.setLiked(false);
            }

            return WrappingViewBoardDTO.builder()
                    .code(2000)
                    .data(dto)
                    .build();
        } catch (NullPointerException e) {
            return WrappingViewBoardDTO.builder()
                    .code(4401)
                    .build();
        }
    }

    public WrappingAdminViewBoardDTO FindBoardIdAdmin(Long id, DataFetchingEnvironment env) {
        try {
            int code = gqlUserValidService.envValidCheck(env);

            if(code != 0) {
                return WrappingAdminViewBoardDTO.builder().code(code).build();
            } else {
                User user = gqlUserValidService.findUser(env);

                if(user == null) return WrappingAdminViewBoardDTO.builder().code(4400).build();
                else if(!user.isAdminRole()) {
                    return WrappingAdminViewBoardDTO.builder().code(4300).build();
                }

                AdminViewBoardDTO dto = AdminViewBoardDTO.from(boardRepository.findBoardId(id));
                dto.setCasting(castingRepository.findCastingByBoard(id));
                dto.setComment(commentRepository.findCommentByBoard(id,5));
                dto.setGenre(genreRepository.findGenreByBoard(id));
                dto.setStill(imageRepository.findStillByBoard(id));

                return WrappingAdminViewBoardDTO.builder()
                        .code(2000)
                        .data(dto)
                        .build();
            }
        } catch (NullPointerException e) {
            return WrappingAdminViewBoardDTO.builder().code(4000).build();
        }
    }

    public WrappingBoardGraphQLsDTO FindBoards(SearchTypes type, int limit, DataFetchingEnvironment env) {
        if(type == null){
            return WrappingBoardGraphQLsDTO.builder()
                    .code(2000)
                    .data(boardRepository.findBoards(true, limit))
                    .build();
        }
        try {
            switch (type) {
                //   - My = 내가 찜한 영화
                case SEARCH_TYPES_MY:
                    try {
                        int code = gqlUserValidService.envValidCheck(env);

                        if(code != 0) {
                            return WrappingBoardGraphQLsDTO.builder().code(code).build();
                        } else {
                            User user = gqlUserValidService.findUser(env);
                            if(user == null) return WrappingBoardGraphQLsDTO.builder().code(4400).build();

               