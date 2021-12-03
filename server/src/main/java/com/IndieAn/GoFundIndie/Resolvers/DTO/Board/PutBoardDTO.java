package com.IndieAn.GoFundIndie.Resolvers.DTO.Board;

import lombok.Builder;
import org.springframework.util.Assert;

@Builder
public class PutBoardDTO {
    private long boardId;

    private String title;
    private String infoCountry;
    private String infoCreatedYear;
    private int infoTime;
    private String infoStory;
    private String producer;
    private String distri