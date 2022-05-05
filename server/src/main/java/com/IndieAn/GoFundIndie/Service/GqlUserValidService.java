package com.IndieAn.GoFundIndie.Service;

import com.IndieAn.GoFundIndie.Domain.Entity.User;
import graphql.kickstart.servlet.context.GraphQLServletContext;
import graphql.schema.DataFetchingEnvironment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Slf4j
@Service
@RequiredArgsConstructor
public class GqlUserValidService {
    private final UserService userService;

    public int envValidCheck(DataFetchingEnvironment env) {
        if(env == null) {
            return 4000;
        }

        