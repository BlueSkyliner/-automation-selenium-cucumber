package com.IndieAn.GoFundIndie.Resolvers.DTO.Board;

import lombok.Builder;
import org.springframework.util.Assert;
import java.util.List;

public class WrappingDonationBoardGraphQLDTO {
    private int code;

    private List<DonationBoardGraphQLDTO> data; // nullable

    public WrappingDonationBoardGraphQLDTO() {}