package com.IndieAn.GoFundIndie.Resolvers.Mutations;

import com.IndieAn.GoFundIndie.Domain.Entity.Board;
import com.IndieAn.GoFundIndie.Domain.Entity.Genre;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.BoardGenreRepository;
import com.IndieAn.GoFundIndie.Resolvers.DTO.BoardGenre.LinkBoardGenreDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.BoardGenre.WrappingLinkBoardGenreDTO;
import com.IndieAn.GoFundIndie.Service.BoardService;
import com.IndieAn.GoFundIndie.Service.GenreService;
import com.IndieAn.GoFundIndie.Service.GqlUserValidService;
import com.IndieAn.GoFundIndie.Service.UserService;
import graphql.kickstart.servlet.context.GraphQLServletContext;
import graphql.schema.DataFetchingEnvironment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class BoardGenreMutation {
    private final BoardGenreRepository boardGenreRepository;

    private final UserService userService;
    private final BoardService boardService;
    private final GenreService genreService;
    private final GqlUserValidService gqlUserValidService;

    public WrappingLinkBoardGenreDTO LinkBoardGenre(Long boardId, Long genreId, boolean CreateOrDisLink, DataFetchingEnvironment env) {
        if(boardId == null || genreId == null)
            // Path null : 4009
            return WrappingL