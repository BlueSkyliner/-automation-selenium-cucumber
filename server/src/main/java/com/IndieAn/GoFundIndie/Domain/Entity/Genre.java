package com.IndieAn.GoFundIndie.Domain.Entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Genre {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String name;

    @OneToMany(mappedBy = "genreId", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<BoardGenre> boardGenres = new ArrayList<>();

    public Genre() {}

    public List<BoardGenre>