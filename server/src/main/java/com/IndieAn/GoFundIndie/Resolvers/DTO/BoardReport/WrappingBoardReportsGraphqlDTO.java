package com.IndieAn.GoFundIndie.Resolvers.DTO.BoardReport;

import lombok.Builder;

import java.util.List;

public class WrappingBoardReportsGraphqlDTO {
    private int code;
    private List<BoardReportGraphQLDTO> data;

    @Builder
    public WrappingBoardReportsGraphqlDTO(int code, List<BoardReportGraphQLDTO> data) {
        this.code = code;
    