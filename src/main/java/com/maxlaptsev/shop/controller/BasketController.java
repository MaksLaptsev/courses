package com.maxlaptsev.shop.controller;

import com.maxlaptsev.shop.model.Basket;
import com.maxlaptsev.shop.model.Book;
import com.maxlaptsev.shop.model.User;
import com.maxlaptsev.shop.service.BasketServiceImp;
import com.maxlaptsev.shop.service.UserService;
import com.maxlaptsev.shop.service.UtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class BasketController {
    @Autowired
    UserService userService;
    @Autowired
    UtilService utilService;
    @Autowired
    BasketServiceImp basketServiceImp;

    @GetMapping("/userBasket")
    public String getUserBasket(HttpServletRequest request, ModelMap modelMap){
        User user = userService.getUserByContextHolder();
        Basket basket = basketServiceImp.findById(user.getBasket().getId());
        PagedListHolder<Book> pagedListHolder = utilService.createPagedListHolderWithSort(basket.getBooks(),"id",true,true);
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(6);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("userBasket",basket);
        return "userBasket";
    }


    @PostMapping("/userBasket/addToBasket")
    public void addBookToBasket(HttpServletRequest request, HttpServletResponse response){
        Integer idBook = Integer.parseInt(request.getParameter("id"));
        basketServiceImp.addBookToBasket(idBook,userService.getUserByContextHolder().getBasket().getId());
        response.setHeader("Success", "Success");
    }

    @PostMapping("/userBasket/delFromBasket")
    public void  delFromBasket(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer idBook = Integer.parseInt(request.getParameter("id"));
        basketServiceImp.delFromBasket(idBook,userService.getUserByContextHolder().getBasket().getId());
        response.setContentType("text/plain");
        response.getWriter().write("Success");

    }

    @PostMapping("/userBasket/clear")
    public void clearBasket(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = userService.getUserByContextHolder();
        basketServiceImp.clearBasket(user.getId());
        response.setContentType("text/plain");
        response.getWriter().write("Success");
    }



}
