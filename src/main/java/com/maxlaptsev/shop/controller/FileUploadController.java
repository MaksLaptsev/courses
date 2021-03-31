package com.maxlaptsev.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Objects;

@Controller
public class FileUploadController {

    @PostMapping("/admin/upload")
    public @ResponseBody String handleFileUpload(
                            @RequestParam("file") MultipartFile file){
        String path = new File("").getAbsolutePath()+"/src/main/webapp/resources/static/images";
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(path, Objects.requireNonNull(file.getOriginalFilename()))));
                stream.write(bytes);
                stream.close();
                return "Вы удачно загрузили " + file.getOriginalFilename();
            } catch (Exception e) {
                return "Вам не удалось загрузить " +file.getOriginalFilename()+ " => " + e.getMessage();
            }
        } else {
            return "Вам не удалось загрузить " + file.getOriginalFilename() + " потому что файл пустой.";
        }
    }

    @PostMapping("/admin/upload/bio")
    public @ResponseBody String handleFileUploadBio(
            @RequestParam("file") MultipartFile file){
        String path = new File("").getAbsolutePath()+"/src/main/webapp/resources/static/text";
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(path, Objects.requireNonNull(file.getOriginalFilename()))));
                stream.write(bytes);
                stream.close();
                return "Вы удачно загрузили " + file.getOriginalFilename();
            } catch (Exception e) {
                return "Вам не удалось загрузить " +file.getOriginalFilename()+ " => " + e.getMessage();
            }
        } else {
            return "Вам не удалось загрузить " + file.getOriginalFilename() + " потому что файл пустой.";
        }
    }
}
