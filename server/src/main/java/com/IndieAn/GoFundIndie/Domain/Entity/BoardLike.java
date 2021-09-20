package com.IndieAn.GoFundIndie.Domain.Entity;

import javax.persistence.*;
import java.util.Date;

@Entity
public class BoardLike {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id", nullable = false)
    priva