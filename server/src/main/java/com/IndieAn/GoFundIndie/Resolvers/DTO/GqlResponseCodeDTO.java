package com.IndieAn.GoFundIndie.Resolvers.DTO;

import lombok.Builder;

public class GqlResponseCodeDTO {
    private int code;

    public GqlResponseCodeDTO() {}

    @Builder
    public GqlResponseCodeDTO(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public static GqlResponseC