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
            else {
                User user = userService.CheckUserByNickname(query);
                // user가 null이 아니라면 4013 응답을 한다.
                if(user != null) {
                    body.put("code", 4013);
                    return ResponseEntity.badRequest().body(body);
                }
            }
            // null이라면 없는 것이므로 2000 응답을 한다.
            body.put("code", 2000);
            return ResponseEntity.ok().body(body);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("err");
        }
    }

    @PostMapping(value = "/signup")
    public ResponseEntity<?> UserSignUp(@RequestBody UserSignUpDTO  userSignUpDTO) {
        try {
            body.clear();
            // DB에 해당 email이 존재하는지 확인한다. 반환 값이 null이라면 이미 존재하는 email이다.
            User user = userService.CreateUserData(userSignUpDTO);

            if(user == null) {
                body.put("code", 4002);
                return ResponseEntity.badRequest().body(body);
            }

            body.put("code", 2000);
            return ResponseEntity.status(201).body(body);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("err");
        }
    }

    @PostMapping(value = "/signin")
    public ResponseEntity<?> UserLogin(@RequestBody UserSIgnInDTO userSIgnInDTO) {
        try {
            body.clear();
            data.clear();
            // id와 password 를 기준으로 DB에 일치하는 유저 데이터를 불러온다.
            // 유저 데이터에 email을 토큰에 담아 accesstoken과 refreshToken을 생성한다.
            // accessToken은 클라이언트에서 관리할 수 있게 body에, refreshToken은 쿠키에 담겨 전달한다.
            User user = userService.FindUser(userSIgnInDTO);

            // 해당 이메일이 없다면 code 4003 응답
            if(userService.FindUserUseEmail(userSIgnInDTO.getEm