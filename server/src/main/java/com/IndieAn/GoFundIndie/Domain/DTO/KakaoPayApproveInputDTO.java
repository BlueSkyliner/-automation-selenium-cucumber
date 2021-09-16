package com.IndieAn.GoFundIndie.Domain.DTO;

import lombok.Data;

@Data
public class KakaoPayApproveInputDTO {
    private String pg_token;
    private long boardId;
    private String next_redirect_pc_url;

    public String getNext_redirect_pc_url() {
        return next_redirect_pc_url;
    }

    public long