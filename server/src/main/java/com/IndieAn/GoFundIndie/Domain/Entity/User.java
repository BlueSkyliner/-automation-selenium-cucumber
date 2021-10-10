package com.IndieAn.GoFundIndie.Domain.Entity;

import com.IndieAn.GoFundIndie.Resolvers.DTO.User.UserGraphQLDTO;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "admin_role", columnDefinition = "boolean default false")
    private boolean adminRole;

    @Column(columnDefinition = "boolean default false")
    private boolean banned;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(name = "profile_picture")
    private String profilePicture;

    @Column(nullable = false)
    private String nickname;

    @Column(name = "created_at", columnDefinition = "datetime default now()")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @Column(name = "total_donation", columnDefinition = "integer default 0")
    private int totalDonation;

    @Column(name = "ad_agree", columnDefinition = "boolean default true")
    private boolean adAgree;

    @OneToMany(mappedBy = "userId", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<CommentReport> commentReports = new ArrayList<>();

    @OneToMany(mappedBy = "userId", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<BoardLike> boardLikes = new ArrayList<>();

    @OneToMany(mappedBy = "userId", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<BoardReport> boardReports = new ArrayList<>();

    @OneToMany(mappedBy = "userId", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<CommentRating> commentRatings = new ArrayList<>();

    @OneToMany(mappedBy = "userId", cascade = CascadeType.REMOVE, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();

    @OneT