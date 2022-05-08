
package com.IndieAn.GoFundIndie.Service;

import com.IndieAn.GoFundIndie.Domain.DTO.UserModifyDTO;
import com.IndieAn.GoFundIndie.Domain.DTO.UserSIgnInDTO;
import com.IndieAn.GoFundIndie.Domain.DTO.UserSignUpDTO;
import com.IndieAn.GoFundIndie.Domain.Entity.RefreshToken;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.UserRepository;
import io.jsonwebtoken.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.time.Duration;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
    private final UserRepository userRepository;
    @Value("#{info['gofundindie.signkey']}")
    private String SIGN_KEY;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // 유저 정보를 받아 회원가입을 진행하는 서비스 기능
    public User CreateUserData(UserSignUpDTO userSignUpDTO) {
        // DB > User table에 유저정보를 저장한다.
        // 같은 email이 존재하면 null을 리턴
        if(userRepository.FindUserByEmail(userSignUpDTO.getEmail()) != null) return null;
        return userRepository.CreateUser(userSignUpDTO);
    }

    // 유저 정보를 확인하고 해당 유저의 정보를 수정하는 서비스 기능
    public User ModifyUserData(UserModifyDTO userModifyDTO, String email) {
        User user = userRepository.FindUserByEmail(email);
        if(user == null) return null;
        return userRepository.ModifyUser(userModifyDTO, user.getId());
    }

    // 유저 email을 통해 DB에 해당 email을 가진 엔티티를 삭제하는 서비스 기능
    public User DeleteUserData(String email) {