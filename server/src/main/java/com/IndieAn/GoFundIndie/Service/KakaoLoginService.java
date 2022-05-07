
package com.IndieAn.GoFundIndie.Service;

import com.IndieAn.GoFundIndie.Domain.DTO.UserSignUpDTO;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.UserRepository;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

@Slf4j
@Service
public class KakaoLoginService {
    private final UserRepository userRepository;
    private HashMap<String, Object> body;
    private HashMap<String, Object> data;

    @Value("#{info['gofund.kko.redirecturl']}")
    private String KKO_REDIRECT_URL;

    @Autowired
    public KakaoLoginService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Kakao Login과 함께 Access Token 받기
    public ResponseEntity<?> getAccessToken(String code) {
        body = new HashMap<>();
        data = new HashMap<>();
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";