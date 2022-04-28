
package com.IndieAn.GoFundIndie.Service;

import com.IndieAn.GoFundIndie.Domain.DTO.*;
import com.IndieAn.GoFundIndie.Domain.Entity.Board;
import com.IndieAn.GoFundIndie.Domain.Entity.Comment;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.CommentRatingRepository;
import com.IndieAn.GoFundIndie.Repository.CommentReportRepository;
import com.IndieAn.GoFundIndie.Repository.CommentRepository;
import com.IndieAn.GoFundIndie.Repository.JPAInterface.CommentJPAInterface;
import com.IndieAn.GoFundIndie.Repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Service
public class CommentService {
    private final CommentRepository commentRepository;
    private final CommentJPAInterface commentJPAInterface;
    private final UserRepository userRepository;
    private final CommentRatingRepository commentRatingRepository;
    private final CommentReportRepository commentReportRepository;
    private final UserService userService;
    private final BoardService boardService;
    private HashMap<String, Object> body;

    @Autowired
    public CommentService(CommentRepository commentRepository, CommentJPAInterface commentJPAInterface,
                          UserRepository userRepository, CommentRatingRepository commentRatingRepository,
                          CommentReportRepository commentReportRepository, UserService userService,
                          BoardService boardService) {
        this.commentRepository = commentRepository;
        this.commentJPAInterface = commentJPAInterface;
        this.userRepository = userRepository;
        this.commentRatingRepository = commentRatingRepository;
        this.commentReportRepository = commentReportRepository;
        this.userService = userService;
        this.boardService = boardService;
    }

    // Comment를 생성하는 기능을 하는 서비스 기능
    public ResponseEntity<?> WriteCommentData(Map<String, String> requestHeader, CommentInputDTO commentInputDTO) {
        body = new HashMap<>();
        // 헤더에 accesstoken이 없으면 4000 응답을 한다.
        if(requestHeader.get("accesstoken") == null) {
            body.put("code", 4000);
            return ResponseEntity.badRequest().body(body);
        }

        // 헤더에 존재하는 토큰을 가지고 유효성 검증을 한다.
        Map<String, Object> checkToken = userService.CheckToken(requestHeader.get("accesstoken"));

        // 토큰이 유효하다면 작성 기능을 수행한다.