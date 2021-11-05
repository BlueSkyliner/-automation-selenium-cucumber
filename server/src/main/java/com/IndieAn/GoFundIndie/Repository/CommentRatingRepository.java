package com.IndieAn.GoFundIndie.Repository;

import com.IndieAn.GoFundIndie.Domain.Entity.Comment;
import com.IndieAn.GoFundIndie.Domain.Entity.CommentRating;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class CommentRatingRepository extends EntityManagerExtend{
    private final EntityManager entityManager;

    @Autowired
    public CommentRatingRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public CommentRating FindRatingByUserA