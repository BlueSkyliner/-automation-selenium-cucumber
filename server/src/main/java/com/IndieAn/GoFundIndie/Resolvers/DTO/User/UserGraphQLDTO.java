package com.IndieAn.GoFundIndie.Resolvers.DTO.User;

import com.IndieAn.GoFundIndie.Domain.Entity.User;
import lombok.*;

@Getter
@Setter
public class UserGraphQLDTO {
    private long id;
    private boolean adminRole; //default exist
    private boolean banned; //default exist
    private String email; //non-null
    private String password; //non-null
    private String profilePicture;
    private String nickname; //non-null
    private String createdAt; // default exist
   