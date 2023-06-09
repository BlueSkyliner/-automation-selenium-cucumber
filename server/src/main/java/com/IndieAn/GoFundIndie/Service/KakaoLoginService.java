
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

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // POST 요청을 위해 기본값이 false인 setDoOutput을 true로 변경한다.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=1738f9aae84207c21785a55a0cf78180");
            sb.append("&redirect_uri=" + KKO_REDIRECT_URL);
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();

            // 결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();


            HashMap<String, Object> userInfo = getUserInfo(access_Token);
            System.out.println("login Controller : " + userInfo);

            // DB에 해당 유저정보가 있는지 확인한다.
            User user = userRepository.FindUserByEmail((String)userInfo.get("email"));

            // 유저정보가 없다면, DB > User table에 저장을 한다.
            if(user == null) {
                UserSignUpDTO userSignUpDTO = new UserSignUpDTO();
                userSignUpDTO.setEmail((String)userInfo.get("email"));
                userSignUpDTO.setPassword("asdlkjasldkjawldj");
                userSignUpDTO.setNickname((String)userInfo.get("nickname"));
                userSignUpDTO.setProfilePic((String)userInfo.get("profile"));
                userSignUpDTO.setAdAgree(false);
                userRepository.CreateUser(userSignUpDTO);
            }

            body.put("code", 2000);
            data.put("accessToken", access_Token);
            body.put("data", data);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ResponseEntity.ok().body(body);
    }

    // 회원정보 이메일, 닉네임 받기
    public HashMap<String, Object> getUserInfo (String access_Token) {
        // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap 타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");

            // 요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            // 파싱을 통해서 email과 nickname을 정보로 넘겨준다.
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            String profile = properties.getAsJsonObject().get("profile_image").getAsString();

            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            userInfo.put("profile", profile);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }

    // 카카오 로그아웃 서비스
    public ResponseEntity<?> Logout(String accesstoken) {
        body = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v1/user/logout";
        try {
            // 해당 url에 액세스 토큰을 통해서 로그아웃 POST 요청을 보낸다.
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accesstoken);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String result = "";
            String line = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
            body.put("code", 2000);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ResponseEntity.ok().body(body);
    }
}