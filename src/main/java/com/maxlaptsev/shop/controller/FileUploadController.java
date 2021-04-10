package com.maxlaptsev.shop.controller;

import com.maxlaptsev.shop.service.UtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Objects;

@Controller
public class FileUploadController {
    @Autowired
    UtilService utilService;

    @PostMapping("/admin/upload")
    public @ResponseBody String handleFileUpload(
            @RequestParam("file") MultipartFile file, HttpServletRequest request){
        String path = new File("").getAbsolutePath()+"/src/main/webapp/resources/static/images";
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(path, Objects.requireNonNull(file.getOriginalFilename()))));
                stream.write(bytes);
                stream.close();
                if(utilService.checkLanguage(request.getCookies()).equals("ru")){
                    return "Вы удачно загрузили " + file.getOriginalFilename();
                }else {
                    return "You have successfully downloaded " + file.getOriginalFilename();
                }

            } catch (Exception e) {
                if(utilService.checkLanguage(request.getCookies()).equals("ru")){
                    return "Вам не удалось загрузить " +file.getOriginalFilename()+ " => " + e.getMessage();
                }else {
                    return "You were unable to download " +file.getOriginalFilename()+ " => " + e.getMessage();
                }

            }
        } else {
            if(utilService.checkLanguage(request.getCookies()).equals("ru")){
                return "Вам не удалось загрузить " + file.getOriginalFilename() + " потому что файл пустой.";
            }else {
                return "You were unable to download " + file.getOriginalFilename() + " because the file is empty.";
            }

        }
    }

    @PostMapping("/admin/upload/bio")
    public @ResponseBody String handleFileUploadBio(
            @RequestParam("file") MultipartFile file, HttpServletRequest request){
        String path = new File("").getAbsolutePath()+"/src/main/webapp/resources/static/text";
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(path, Objects.requireNonNull(file.getOriginalFilename()))));
                stream.write(bytes);
                stream.close();
                if(utilService.checkLanguage(request.getCookies()).equals("ru")){
                    return "Вы удачно загрузили " + file.getOriginalFilename();
                }else {
                    return "You have successfully downloaded " + file.getOriginalFilename();
                }

            } catch (Exception e) {
                if(utilService.checkLanguage(request.getCookies()).equals("ru")){
                    return "Вам не удалось загрузить " +file.getOriginalFilename()+ " => " + e.getMessage();
                }else {
                    return "You were unable to download " +file.getOriginalFilename()+ " => " + e.getMessage();
                }

            }
        } else {
            if(utilService.checkLanguage(request.getCookies()).equals("ru")){
                return "Вам не удалось загрузить " + file.getOriginalFilename() + " потому что файл пустой.";
            }else {
                return "You were unable to download " + file.getOriginalFilename() + " because the file is empty.";
            }

        }
    }
}
