package com.IndieAn.GoFundIndie.Domain.Entity;

import javax.persistence.*;

@Entity
public class RefreshToken {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String refreshToken;

    public RefreshToken() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
  