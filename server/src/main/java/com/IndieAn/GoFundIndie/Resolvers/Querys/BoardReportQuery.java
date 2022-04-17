package com.IndieAn.GoFundIndie.Resolvers.Querys;

import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.BoardReportRepository;
import com.IndieAn.GoFundIndie.Resolvers.DTO.BoardReport.WrappingBoardReportGraphQLDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.BoardReport.WrappingBoardReportsGraphqlDTO;
import com.IndieAn.GoFundIndie.Service.GqlUserValidService;
import graphql.schema.DataFetchingEnvironment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class BoardReportQuery {
    private final BoardReportRepository boardReportRepository;

    private final GqlUserValidService gqlUserValidService;

    public WrappingBoardReportGraphQLDTO FindBoardReport(Long id, DataFetchingEnvironment env) {
        try {
            if(id == null) return WrappingBoardReportGraphQLDTO.bad(4009);

            int code = gqlUserValidService.envValid