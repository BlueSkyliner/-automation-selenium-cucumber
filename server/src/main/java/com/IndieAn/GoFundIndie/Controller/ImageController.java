package com.IndieAn.GoFundIndie.Controller;

import com.IndieAn.GoFundIndie.Common.ImagePathTypes;
import com.IndieAn.GoFundIndie.Domain.Entity.User;
import com.IndieAn.GoFundIndie.Repository.ImageRepository;
import com.IndieAn.GoFundIndie.Service.ImageService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequiredArgsConstructor
public class ImageController {
    private final ImageService imageService;
    private final EntityManager entityManager;

    private final HashMap<String, Object> body = new HashMap<>();

    @PostMapping(value = {"/image/{path}/{path_id}", "/image/{path}"})
    public ResponseEntity<?> UploadImage(@RequestHeader Map<String, String> header,
                                         @PathVariable(value = "path") String path,
                                         @PathVariable(value = "path_id", required = false) Long pathId,
                                         @RequestPart(value = "upload",required = false) MultipartFile image ) {
        //image dir result
        try {
            ImagePathTypes type = ImagePathTypes.findImagePathType(path);
            log.info(type.toString());
            