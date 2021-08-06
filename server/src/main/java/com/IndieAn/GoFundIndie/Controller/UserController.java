package com.IndieAn.GoFundIndie.Controller;

import com.IndieAn.GoFundIndie.Domain.DTO.UserModifyDTO;
import com.IndieAn.GoFundIndie.Domain.DTO.UserSIgnInDTO;
import com.IndieAn.GoFundIndie.Domain.DTO.UserSignUpDTO;
import com.IndieAn.GoFundIndie.Domain.Entity.RefreshToken;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@RestController
public class UserController {
    private final UserService userService;
    // accessToken 유효 시간
    private final static Integer ACCESS_TIME = 30;
    // refreshToken 유효 시간
    private final static Integer REFRESH_TIME = 30 * 24;
    private HashMap<String, Object> body = new HashMap<>();
    private HashMap<String, Object> data = new HashMap<>();

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(value = "/check")
    public ResponseEntity<?> CheckDuplicate(@RequestParam(name = "type") String type, @RequestParam(name = "query") String query) {
        // email이나 nickname의 중복체크를 위한 api
        try {
            body.clear();
            // type이 email일 경우
            if(type.equals("email")) {
                User user = userService.FindUserUseEmail(query);
                // user가 null이 아니라면 4002 응답을 한다.
                if(user != null) {
                    body.put("code", 4002);
                    return ResponseEntity.badRequest().body(body);
                }
            }
            // type이 닉네임일 경우
  