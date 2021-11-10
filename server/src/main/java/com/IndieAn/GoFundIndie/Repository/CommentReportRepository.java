package com.IndieAn.GoFundIndie.Repository;

import com.IndieAn.GoFundIndie.Domain.Entity.Comment;
import com.IndieAn.GoFundIndie.Domain.Entity.CommentReport;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;

@Slf4j
@Transactional
@Repository
public class CommentReportRepository extends EntityManagerExtend{
    private final EntityManager entityManager;

    @Autowired
    public CommentReportRepository(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    // id를 통해서 comment report 정보를 찾아낸다.
    public CommentReport FindById(long reportId) {
        return entityManag