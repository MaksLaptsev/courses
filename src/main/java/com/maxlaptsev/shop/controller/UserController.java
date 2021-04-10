package com.maxlaptsev.shop.controller;

import com.maxlaptsev.shop.model.User;
import com.maxlaptsev.shop.model.UserInfo;
import com.maxlaptsev.shop.service.UserInfoImp;
import com.maxlaptsev.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    UserInfoImp userInfoImp;

    @GetMapping("/getActiveUserInfo")
    public ModelAndView getActiveUserInfo(){
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.getUserByContextHolder();
        modelAndView.setViewName("userInfo");
        modelAndView.addObject("userLogin",user.getUsername());
        modelAndView.addObject("userInfo",userInfoImp.findById(user.getUserInfo().getId()));
        return modelAndView;
    }

    @GetMapping("/editingUserInfo")
    public ModelAndView editingUserInfoGet(){
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.getUserByContextHolder();
        UserInfo userInfo = userInfoImp.findById(user.getUserInfo().getId());
        modelAndView.setViewName("editingUserInfo");
        modelAndView.addObject("userInfoForm",userInfo);
        return modelAndView;
    }

    @PostMapping("/editingUserInfo")
    public ModelAndView editingUserInfoPost(@Valid @ModelAttribute("userInfoForm")UserInfo userInfoForm, BindingResult bindingResult,Model model){
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.getUserByContextHolder();
        if (bindingResult.hasErrors()){
            modelAndView.setViewName("editingUserInfo");
            modelAndView.addObject("userInfoForm",userInfoForm);
            return modelAndView;
        }else {
            userInfoImp.save(userInfoForm);
            modelAndView.setViewName("userInfo");
            modelAndView.addObject("userLogin",user.getUsername());
            modelAndView.addObject("userInfo",userInfoImp.findById(userInfoForm.getId()));
            return modelAndView;
        }
    }

    @GetMapping("/cancell")
    public ModelAndView getActiveUserInfoCancell(){
        ModelAndView modelAndView = new ModelAndView();
        User user = userService.getUserByContextHolder();
        modelAndView.setViewName("userInfo");
        modelAndView.addObject("userInfo",userInfoImp.findById(user.getUserInfo().getId()));
        return modelAndView;
    }

}
