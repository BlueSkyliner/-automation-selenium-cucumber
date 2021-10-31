package com.IndieAn.GoFundIndie.Repository;

import com.IndieAn.GoFundIndie.Domain.Entity.Board;
import com.IndieAn.GoFundIndie.Domain.Entity.Casting;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Casting.CastingGraphQLDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Casting.CreateCastingCompleteDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Casting.PutCastingDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Comment.CommentGraphQLDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.concurrent.atomic.At