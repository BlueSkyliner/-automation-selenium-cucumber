package com.IndieAn.GoFundIndie.Resolvers.Mutations;

import com.IndieAn.GoFundIndie.Domain.Entity.Board;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.BoardReportRepository;
import com.IndieAn.GoFundIndie.Repository.BoardRepository;
import com.IndieAn.GoFundIndie.Resolvers.DTO.BoardReport.CreateBoardReportDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.GqlResponseCodeDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.GqlResponseCodeIdDTO;
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
public class BoardReportMutation {
    private final BoardReportRepository boardReportRepository;
    private final BoardRepository boardRepository;

    private final GqlUserValidService gqlUserValidService;

    public GqlResponseCodeDTO ReportBoard(CreateBoardReportDTO dto, DataFetchingEnvironment env) {
        try {
            // request body wrong : 4006
            if(dto == null) return GqlResponseCodeDTO.bad(4006);

            int code = gqlUserValidService.envValidCheck(env);

            if(code == 0) {
                User user = gqlUserValidService.findUs