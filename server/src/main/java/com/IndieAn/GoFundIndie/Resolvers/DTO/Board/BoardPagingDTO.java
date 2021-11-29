package com.IndieAn.GoFundIndie.Resolvers.DTO.Board;

import lombok.Builder;
import org.springframework.util.Assert;

import java.util.List;

public class BoardPagingDTO {
    private Integer countBoards;
    private Integer countPages;
    private Integer boardsP