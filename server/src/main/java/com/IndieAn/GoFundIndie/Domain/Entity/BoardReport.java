package com.IndieAn.GoFundIndie.Domain.Entity;

import lombok.Builder;
import org.springframework.util.Assert;

import javax.persistence.*;

@Entity
public class BoardReport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id", nullable = false)
    private User userId;

    @ManyToOne(targetEntity = Board.class)
    @JoinCol