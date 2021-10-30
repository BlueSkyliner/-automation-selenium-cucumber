
package com.IndieAn.GoFundIndie.Repository;

import com.IndieAn.GoFundIndie.Common.SearchTypes;
import com.IndieAn.GoFundIndie.Domain.Entity.*;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Board.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Repository
@Transactional
@RequiredArgsConstructor
public class BoardRepository extends EntityManagerExtend{
    private final EntityManager entityManager;

    private final String SELECT_BoardGraphQLDTO = "SELECT new com.IndieAn.GoFundIndie.Resolvers.DTO.Board.BoardGraphQLDTO" +
                                                  "(b.id, b.isApprove, b.title, b.posterImg, b.infoCountry, b.infoCreatedYear, b.infoCreatedDate, b.infoTime, b.infoLimit) ";

    public Board findBoardId(Long id) {
        if(id == null) return null;
        try {
            return entityManager.find(Board.class, id);
        } catch (NullPointerException e) {
            return null;
        }
    }

    public List<BoardGraphQLDTO> findBoards(boolean isApprove, int limit) {
        return entityManager.createQuery(
            SELECT_BoardGraphQLDTO +
                    "FROM Board b " +
                    "WHERE b.isApprove=" + isApprove + " " +
                    "ORDER BY b.commentAmount DESC", BoardGraphQLDTO.class)
                .setMaxResults(limit)
                .getResultList();
    }

    public List<BoardGraphQLDTO> findAllBoards(int limit) {
        return entityManager.createQuery(
            SELECT_BoardGraphQLDTO +
                    "FROM Board b " +
                    "ORDER BY b.id DESC", BoardGraphQLDTO.class)
                .setMaxResults(limit)
                .getResultList();
    }

    public List<BoardGraphQLDTO> findBoardsLike(User user, int limit) {
        return entityManager.createQuery(
            SELECT_BoardGraphQLDTO +
                    "FROM BoardLike l " +
                    "JOIN l.boardId b " +
                    "ON l.userId = " + user.getId() + " " +
                    "WHERE b.isApprove = true " +
                    "ORDER BY l.createdAt DESC", BoardGraphQLDTO.class)
                .setMaxResults(limit)
                .getResultList();
    }

    public List<LikeBoardGraphQLDTO> findBoardsMyLike(User user, int limit) {
        return entityManager.createQuery(
            "SELECT new com.IndieAn.GoFundIndie.Resolvers.DTO.Board.LikeBoardGraphQLDTO" +
                    "(b, b.isApprove, b.title, b.posterImg, b.infoCountry, b.infoCreatedYear, b.infoCreatedDate, b.infoTime, b.infoLimit, b.infoStory) " +
                    "FROM BoardLike l " +
                    "JOIN l.boardId b " +
                    "ON l.userId = " + user.getId() + " " +
                    "WHERE b.isApprove = true " +
                    "ORDER BY l.createdAt DESC", LikeBoardGraphQLDTO.class)
                .setMaxResults(limit)
                .getResultList();
    }

    public List<BoardGraphQLDTO> findBoardsDonation(User user, int limit) {
        return entityManager.createQuery(
                        SELECT_BoardGraphQLDTO +
                                "FROM Comment c " +
                                "JOIN c.boardId b " +
                                "ON c.userId = " + user.getId() + " " +
                                "WHERE c.donation > 0 " +
                                "ORDER BY c.createdAt DESC", BoardGraphQLDTO.class)
                .setMaxResults(limit)
                .getResultList();
    }

    public List<DonationBoardGraphQLDTO> findBoardsMyDonation(User user, int limit) {
        return entityManager.createQuery(
            "SELECT new com.IndieAn.GoFundIndie.Resolvers.DTO.Board.DonationBoardGraphQLDTO" +
                    "(b.id, b.isApprove, b.title, b.posterImg, b.infoCreatedYear, b.infoCreatedDate, c.donation, c.createdAt) " +
                    "FROM Comment c " +
                    "JOIN c.boardId b " +
                    "ON c.userId = " + user.getId() + " " +
                    "WHERE c.donation > 0 " +
                    "ORDER BY c.createdAt DESC", DonationBoardGraphQLDTO.class)
                .setMaxResults(limit)
                .getResultList();