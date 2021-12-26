package com.IndieAn.GoFundIndie.Resolvers.DTO.BoardReport;

import lombok.Builder;

public class WrappingBoardReportGraphQLDTO {
    private int code;
    private BoardReportGraphQLDTO data;

    @Builder
    public WrappingBoardReportGraphQLDTO(int code, BoardReportGraphQLDT