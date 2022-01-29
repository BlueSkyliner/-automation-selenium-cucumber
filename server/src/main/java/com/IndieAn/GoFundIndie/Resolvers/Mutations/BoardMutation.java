package com.IndieAn.GoFundIndie.Resolvers.Mutations;

import com.IndieAn.GoFundIndie.Domain.Entity.Board;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.BoardLikeRepository;
import com.IndieAn.GoFundIndie.Repository.BoardRepository;
import com.IndieAn.GoFundIndie.Repository.UserRepository;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Board.*;
import com.IndieAn.GoFundIndie.Resolvers.DTO.GqlResponseCodeDTO;
import com.IndieAn.GoFundIndie.Service.BoardService;
import com.IndieAn.GoFundIndie.Service.GqlUserValidService;
import com.IndieAn.GoFundIndie.Service.UserService;
import graphql.schema.DataFetchingEnvironment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class BoardMutation {
    private final BoardRepository boardRepository;
    private final UserRepository userRepository;
    private final BoardLikeRepository boardLikeRepository;

    private final BoardService boardService;
    private final UserService userService;
    private final GqlUserValidService gqlUserValidService;

    public WrappingCreateTempBoardDTO CreateTempBoard(DataFetchingEnvironment env) {
        try {
            int code = gqlUserValidService.envValidCheck(env);

            if(code == 0) {
                User user = gqlUserValidService.findUser(env);
                if(user == null) return WrappingCreateTempBoardDTO.builder().code(4400).build();

                return WrappingCreateTempBoardDTO.builder().code(2000)
                        .data(CreateTempBoardDTO.builder()
                                .id(boardRepository.RegisterTempBoard(user))
                                .build())
                        .build();
            } else
                return WrappingCreateTempBoardDTO.builder().code(code).build();
        } catch (NullPointerException e) {
            return WrappingCreateTempBoardDTO.builder().code(4000).build();
        }
    }

    public WrappingCreateTempBoardDTO CompleteBoard(CreateBoardCompleteDTO dto, DataFetching