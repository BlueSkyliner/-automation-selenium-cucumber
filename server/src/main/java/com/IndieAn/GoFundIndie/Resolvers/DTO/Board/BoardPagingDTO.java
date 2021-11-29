package com.IndieAn.GoFundIndie.Resolvers.DTO.Board;

import lombok.Builder;
import org.springframework.util.Assert;

import java.util.List;

public class BoardPagingDTO {
    private Integer countBoards;
    private Integer countPages;
    private Integer boardsPerPage;
    private Integer currentPage;
    private List<BoardGraphQLDTO> content;

    public BoardPagingDTO() {}

    @Builder
    public BoardPagingDTO(Integer countBoards, Integer countPages, Integer boardsPerPage, Integer currentPage, List<BoardGraphQLDTO> content) {
        Assert.notNull(countBoards, "countBoards not null");
        Assert.notNull(countPages, "countPages not null");
        Assert.notNull(b