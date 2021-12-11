package com.IndieAn.GoFundIndie.Resolvers.DTO.Board;

import lombok.Builder;

public class WrappingBoardPagingDTO {
    private int code;
    private BoardPagingDTO data;

    public WrappingBoardPagingDTO() {}

    @Builder
    public WrappingBoardPagingDTO(int code, BoardPagingDTO data) {
        this.code = code;
        