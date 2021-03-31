package com.maxlaptsev.shop.controller;

import com.maxlaptsev.shop.model.Book;
import com.maxlaptsev.shop.model.Order;
import com.maxlaptsev.shop.model.User;
import com.maxlaptsev.shop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    OrdersServiceImp ordersServiceImp;
    @Autowired
    BasketServiceImp basketServiceImp;
    @Autowired
    UserInfoImp userInfoImp;
    @Autowired
    UserService userService;
    @Autowired
    UtilService utilService;
    @Autowired
    BookServiceImp bookServiceImp;

    @PostMapping("/userBasket/createOrder")
    public void createOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("name");
        List<String> check = ordersServiceImp.checkBook(username);
        if(check.size() > 0){
            response.setContentType("text/plain");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(check.toString().replace("[","").replace("]",""));
        }else if(userInfoImp.checkPhoneOrEmail(username)){
            ordersServiceImp.createOrder(username);
            basketServiceImp.clearBasket(username);
            response.setContentType("text/plain");
            response.getWriter().write("Success");
        }else {
            response.setContentType("text/plain");
            response.getWriter().write("");
        }
    }

    @GetMapping("/user/getUserOrders")
    public String getUserOrder(HttpServletRequest request, ModelMap modelMap){
        User user = userService.getUserByContextHolder();
        List<Order> orders = ordersServiceImp.findByUserId(user.getId());
        PagedListHolder<Order> pagedListHolder = new PagedListHolder<>(orders, new MutableSortDefinition("dataTimestamp",true,false));
        pagedListHolder.resort();
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(8);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("userOrders",orders);
        return "userOrders";
    }

    @GetMapping("/user/order/listBook")
    public void getBooksFromOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer orderId = Integer.parseInt(request.getParameter("id"));
        List<Book> books  = bookServiceImp.findByOrderId(orderId);
        request.setAttribute("items",books);
        request.getRequestDispatcher("/WEB-INF/pages/testTable.jsp").forward(request, response);
    }
}
