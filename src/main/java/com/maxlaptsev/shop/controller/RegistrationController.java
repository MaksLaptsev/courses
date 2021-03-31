package com.maxlaptsev.shop.controller;

import com.maxlaptsev.shop.model.User;
import com.maxlaptsev.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class RegistrationController {
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@Valid @ModelAttribute("userForm")User userForm, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()){
            return "registration";
        }

        if (!userForm.getPassword().equals(userForm.getPasswordConfirm())){
            model.addAttribute("error", "errorPass");
            return "registration";
        }

        if (!userService.saveUser(userForm)){
            model.addAttribute("error", "errorUser");
            return "registration";
        }

        return "redirect:/";
    }
}
