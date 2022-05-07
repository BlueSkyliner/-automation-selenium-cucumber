
package com.IndieAn.GoFundIndie.Service;

import com.IndieAn.GoFundIndie.Domain.Entity.Board;
import com.IndieAn.GoFundIndie.Domain.Entity.Casting;
import com.IndieAn.GoFundIndie.Domain.Entity.Still;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.BoardRepository;
import com.IndieAn.GoFundIndie.Repository.CastingRepository;
import com.IndieAn.GoFundIndie.Repository.ImageRepository;
import com.IndieAn.GoFundIndie.Repository.UserRepository;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

@Slf4j
@Service
@RequiredArgsConstructor
public class ImageService {
    private final CastingRepository castingRepository;
    private final UserRepository userRepository;
    private final BoardRepository boardRepository;
    private final ImageRepository imageRepository;

    private final UserService userService;

    private final AmazonS3Client amazonS3Client;
    private final AmazonS3 amazonS3;

    private final HashMap<String, Object> body = new HashMap<>();

    private String result;
    private String dir;

    @Value("#{info['gofundindie.s3.bucket']}")
    private String bucket;

    @Value("#{info['dir.movie']}")
    private String DIR_MOVIE;

    @Value("#{info['dir.movie.poster']}")
    private String DIR_MOVIE_POSTER;

    @Value("#{info['dir.user']}")
    private String DIR_USER;

    @Value("#{info['dir.user.profile']}")
    private String DIR_USER_PROFILE;

    /**
     * MultipartFile 에서 File 로 변환 <br>
     * convert multipart file -> file <br>
     *
     */
    private Optional<File> convert(MultipartFile file) throws IOException {
        File convertFile = new File(file.getOriginalFilename());
        if(convertFile.createNewFile()) {
            try (FileOutputStream fos = new FileOutputStream(convertFile)) {
                fos.write(file.getBytes());
            }
            return Optional.of(convertFile);
        }
        return Optional.empty();
    }

    /** 변환된 파일 업로드 후 이미지 저장 주소 리턴 <br>
     * s3 file upload & url return <br>
     * <p>
     *     파일 변환 문제 - IllegalArgumentException <br>
     *     <br>
     * </p>
     */
    private String upload(File file, String dirName, String oriFileName) {
        String fileName = dirName + "/" + oriFileName;
        try {
            amazonS3Client.putObject(new PutObjectRequest(bucket, fileName, file)
                    .withCannedAcl(CannedAccessControlList.PublicRead));
            removeNewFile(file);
        } catch (IllegalArgumentException e) {
            log.error("upload IllegalArgumentException");
            return "IllegalArgumentException";
        }
        return amazonS3Client.getUrl(bucket, fileName).toString();
    }

    /**
     * 업로드 후 남은 파일 삭제<br>
     * local file delete<br>
     */
    private void removeNewFile(File targetFile) {
        if(!targetFile.delete()) {
            log.error("Local File Can not be Deleted");
        }
    }

    /**
     * <p> S3 파일 업로드 준비 <br>
     * S3 uploadStandBy
     * </p>
     * <br>
     * <p>
     *     용량 초과시 - IOException<br>
     *     파일 자체 문제 - MultipartException<br>
     *     파일 이름 없음 - NullPointerException<br>
     *     <br>
     * </p>
     */
    private String uploadStandBy(MultipartFile multipartFile, String dirName, String oriFileName) {
        try{
            File file = convert(multipartFile)
                       .orElseThrow(() -> new IllegalArgumentException("file convert fail"));
            return upload(file, dirName, oriFileName);
        } catch (IOException e) {
            log.error("uploadStanBy IOException");
            return "IOException";
        } catch (MultipartException e) {
            log.error("uploadStanBy MultipartException");
            return "MultipartException";
        } catch (NullPointerException e) {
            log.error("uploadStanBy NullPointerException");
            return "NullPointerException";
        }
    }

    /**
     * <p> S3 파일 삭제 <br>
     * S3 file delete
     * </p>
     * <p>
     * key 값을 받아서 S3 안 이미지 삭제 <br>
     * <br>
     * key 값 예시 <br>
     * <br>
     *   /user/2/user-profile.png
     * </p>
     *  <br>
     */
    private void delete(String key) {
        try {
            DeleteObjectRequest dor = new DeleteObjectRequest(bucket, key);
            this.amazonS3.deleteObject(dor);
        } catch (AmazonServiceException e) {
            log.error("S3 File Can not be Deleted");
        }
    }

    /**
     * <p>
     * One-line ResponseEntity Result
     * </p>
     */
    private ResponseEntity<?> singlePut(int status, String key, Object value) {
        body.clear();
        body.put(key,value);
        return ResponseEntity.status(status).body(body);
    }