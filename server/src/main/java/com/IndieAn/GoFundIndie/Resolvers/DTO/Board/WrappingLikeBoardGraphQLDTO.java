package com.IndieAn.GoFundIndie.Resolvers.DTO.Board;

import lombok.Builder;

import java.util.List;

public class WrappingLikeBoardGraphQLDTO {
    private int code;
    private List<LikeBoardGraphQLDTO> data;

    public WrappingLikeBoardGraphQLDTO() {}

    @Builder
    public WrappingLikeBoardGraphQLDTO(int code, List<LikeBoardGraphQLDTO> data) {
        this.code = code;
        this.data = data;
    }

    public in