package com.IndieAn.GoFundIndie.Resolvers.DTO.BoardGenre;

import lombok.Builder;

@Builder
public class WrappingLinkBoardGenreDTO {
    private int code;
    private LinkBoardGenreDTO data;

    public Wrap