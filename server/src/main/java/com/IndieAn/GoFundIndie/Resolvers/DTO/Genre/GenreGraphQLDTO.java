package com.IndieAn.GoFundIndie.Resolvers.DTO.Genre;

import com.IndieAn.GoFundIndie.Domain.Entity.Genre;
import lombok.AllArgsConstructor;
import lombok.Builder;

@Builder
@AllArgsConstructor
public class GenreGraphQLDTO {
    private long id;
    private String name;

    public GenreGraphQLDTO() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getId() {
     