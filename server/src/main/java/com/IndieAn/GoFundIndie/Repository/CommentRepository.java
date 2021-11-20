package com.IndieAn.GoFundIndie.Repository;

import com.IndieAn.GoFundIndie.Domain.DTO.CommentInputDTO;
import com.IndieAn.GoFundIndie.Domain.DTO.CommentModifyDTO;
import com.IndieAn.GoFundIndie.Domain.Entity.Board;
import com.IndieAn.GoFundIndie.Domain.Entity.Comment;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Comment.CommentGraphQLDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class CommentRepository extends EntityManagerExtend{
    private final EntityManager entityManager;

    @Autowired
    public CommentRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    // DB Comment 테이블의 모든 comment 정보를 리턴한다.
    public List<Comment> FindCommentList() {
        return entityManager.createQuery("SELECT c FROM Comment as c", Comment.class).getResultList();
    }

    // Id를 통해서 Comment를 찾는 기능
    public Comment FindCommentById(long commentId) {
        return entityManager.find(Comment.class, commentId);
//        return entityManager.createQuery("SELECT c FROM Comment as c where c.id = '"+ commentId +"'", Comment.class).getResultList().get(0);
    }

    // DB Comment 테이블에 매개변수 commentInputDTO의 데이터를 사용하여 Comment 정보를 저장한다.
    public void AddComment(CommentInputDTO commentInputDTO, User user) {
        Comment comment = new Comment();
        Board board = entityManager.find(Board.class, commentInputDTO.getBoardId());

        comment.setRating(commentInputDTO.getRating());
        comment.setUserId(user);
        comment.setBoardId(board);
        if(commentInputDTO.getDonation() > 0) comment.setDonation(commentInputDTO.getDonation());
        comment.setBody(commentInputDTO.getCommentBody());
        comment.setCreatedAt(new Date());
        comment.setSpoiler(commentInputDTO.isSpoiler());

        board.setCommentAmount(board.getCommentAmount() + 1);

        entityManager.persist(comment);
        entityManager.persist(board);

        end(entityManager);
    }

    // DB Comment 테이블에 매개변수 commentId를 사용하여 Comment 정보를 수정한다.
    public void ModifyComment(CommentModifyDTO commentModifyDTO, long commentId) {
        Comment modifyComment = entityManager.find(Comment.class, commentId)