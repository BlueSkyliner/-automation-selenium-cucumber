package com.IndieAn.GoFundIndie.Domain.Entity;

import javax.persistence.*;

@Entity
public class Still {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false, length = 500)
    private String image;

    @ManyToOne(targetEntity = Board.class)
    @JoinColumn(name = "board_id", nullable = false)
    private Board boardId;

    public Still() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
    