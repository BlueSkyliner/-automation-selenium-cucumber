package com.IndieAn.GoFundIndie.Domain.Entity;

import javax.persistence.*;

@Entity
public class Casting {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column
    private String name;

    @Column(columnDefinition = "TINYINT")
    private int position;

    @Column(length = 500)
    private String image;

    @ManyToOne(targetEntity = Board.class)
    @JoinColumn(name = "board_id", nullable = false)
    private Board boardId;

    public Casting() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name