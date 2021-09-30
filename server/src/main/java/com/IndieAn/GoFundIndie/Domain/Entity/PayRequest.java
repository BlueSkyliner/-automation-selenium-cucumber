
package com.IndieAn.GoFundIndie.Domain.Entity;

import javax.persistence.*;

@Entity
public class PayRequest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false)
    private String email;