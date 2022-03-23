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

    public WrappingV