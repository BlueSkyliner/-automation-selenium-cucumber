package com.IndieAn.GoFundIndie.Service;

import com.IndieAn.GoFundIndie.Domain.Entity.CommentRating;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.CommentRatingRepository;
import com.IndieAn.GoFundIndie.Repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class CommentRatingService {
    private final CommentRatingRepository commentRatingRepository;
    private final CommentRepository commentRepository;
    private HashMap<String, Object> body = new HashMap<>();

    @Autowired
    public CommentRatingService(CommentRatingRepository commentRatingRepository, CommentRepository commentRepository) {
        this.commentRatingRepository = commentRatingRepository;
        this.commentRepository = commentRepository;
    }

    public HashMap<String, Object> addRati