package com.maxlaptsev.shop.controller;

import com.maxlaptsev.shop.model.*;
import com.maxlaptsev.shop.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

@Controller
public class AdminController {
    @Autowired
    BookServiceImp bookServiceImp;
    @Autowired
    UtilService utilService;
    @Autowired
    AuthorServiceImp authorServiceImp;
    @Autowired
    UserService userService;
    @Autowired
    OrdersServiceImp ordersServiceImp;
    @Autowired
    RoleServiceImp roleServiceImp;

    @GetMapping("/admin")
    public String admin(HttpServletRequest request, ModelMap modelMap){
        modelMap.put("head","");
        return "admin";
    }

    @GetMapping("/admin/list/books")
    public String adminListBooks(@RequestParam String sort, @RequestParam String ascending, HttpServletRequest request, ModelMap modelMap){

        String url = utilService.createUrlForPaginBooks(request,sort, ascending);
        PagedListHolder<Book> pagedListHolder = utilService.createPagedListHolderWithSort(bookServiceImp.findAll(),sort,true,Boolean.parseBoolean(ascending));
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(8);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString());
        modelMap.put("head","List books");
        modelMap.addAttribute("bookForm",new Book());

        return "listBooks";
    }

    @GetMapping("/admin/list/authors")
    public String adminListAuthors(@RequestParam String sort, @RequestParam String ascending, HttpServletRequest request, ModelMap modelMap){

        String url = utilService.createUrlForPaginBooks(request,sort, ascending);
        PagedListHolder<Author> pagedListHolder = utilService.createPagedListHolderWithSortAuthor(authorServiceImp.findAll(),sort,true,Boolean.parseBoolean(ascending));
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(8);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString());
        modelMap.put("head","List authors");
        modelMap.addAttribute("authorForm",new Author());

        return "listAuthors";
    }

    @GetMapping("/admin/list/book")
    public void editBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookServiceImp.findById(bookId);
        request.setAttribute("genre", GenreEnum.values());
        request.setAttribute("authors", authorServiceImp.findAll());
        request.setAttribute("bookForm",book);
        request.getRequestDispatcher("/WEB-INF/pages/editBook.jsp").forward(request, response);

    }

    @PostMapping("/admin/list/book")
    public String editSaveBook(@Valid @ModelAttribute("bookForm")  Book book, BindingResult bindingResult, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(bindingResult.hasErrors()){
            request.setAttribute("genre", GenreEnum.values());
            request.setAttribute("authors", authorServiceImp.findAll());
            return "editBook";
        }else{
            Book bookFromDB = bookServiceImp.findById(book.getId());
            bookServiceImp.save(book);
            request.setAttribute("genre", GenreEnum.values());
            request.setAttribute("authors", authorServiceImp.findAll());
            return "editBook";
        }
    }

    @GetMapping("/admin/add/book")
    public void addBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("bookForm",new Book());
        request.setAttribute("authors", authorServiceImp.findAll());
        request.setAttribute("genre", GenreEnum.values());
        request.getRequestDispatcher("/WEB-INF/pages/addBook.jsp").forward(request, response);
    }

    @PostMapping("/admin/add/book")
    public String addBookSave(@Valid @ModelAttribute("bookForm") Book book,BindingResult bindingResult,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (bindingResult.hasErrors()){
            request.setAttribute("authors", authorServiceImp.findAll());
            request.setAttribute("genre", GenreEnum.values());
            return "addBook";
        }else {
            bookServiceImp.save(book);
            return "editBook";
        }
    }

    @GetMapping("/admin/list/author")
    public void editAuthor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer authorId = Integer.parseInt(request.getParameter("id"));
        Author author = authorServiceImp.findById(authorId);
        request.setAttribute("authorForm",author);
        request.getRequestDispatcher("/WEB-INF/pages/editAuthor.jsp").forward(request, response);
    }

    @PostMapping("/admin/list/author")
    public String editSaveAuthor(@Valid @ModelAttribute("authorForm") Author author,BindingResult bindingResult,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Author editAuthor = authorServiceImp.findById(author.getId());
        if(bindingResult.hasErrors()){
            request.setAttribute("authorForm",author);
            return "editAuthor";
        }else {
            editAuthor.setLastName(author.getLastName());
            editAuthor.setName(author.getName());
            editAuthor.setBio(author.getBio());
            editAuthor.setUrlImg(author.getUrlImg());
            authorServiceImp.save(editAuthor);
            return "redirect:/admin/list/author?id="+editAuthor.getId();
        }
    }

    @GetMapping("/admin/add/author")
    public void addAuthor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("authorForm",new Author());
        request.setAttribute("success"," ");
        request.getRequestDispatcher("/WEB-INF/pages/addAuthor.jsp").forward(request, response);
    }


    @PostMapping("/admin/add/author")
    public String addAuthorSave(@Valid @ModelAttribute("authorForm") Author author,BindingResult bindingResult,HttpServletRequest request, HttpServletResponse response){
        if (bindingResult.hasErrors()){
            request.setAttribute("authorForm",author);
            return "addAuthor";
        }else {
            authorServiceImp.save(author);
            request.setAttribute("success","Автор добавлен");
            return "redirect:/admin/add/author";
        }
    }

    @GetMapping("/admin/list/users")
    public String getAllUsers(@RequestParam String sort, @RequestParam String ascending, HttpServletRequest request, ModelMap modelMap){
        String url = utilService.createUrlForPaginBooks(request,sort, ascending);
        PagedListHolder<User> pagedListHolder = utilService.createPagedListHolderWithSortUser(userService.allUsers(),sort,true,Boolean.parseBoolean(ascending));
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(8);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString());
        modelMap.put("head","List users");
        return "listUsers";
    }


    @GetMapping("/admin/list/user")
    public void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = Integer.parseInt(request.getParameter("id"));
        User user = userService.findUserById(userId);
        request.setAttribute("userForm",user);
        request.setAttribute("roles",roleServiceImp.findAll());
        request.getRequestDispatcher("/WEB-INF/pages/editUser.jsp").forward(request, response);
    }

    @PostMapping("/admin/list/user")
    public String editUserSave(@ModelAttribute("userForm") User user,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User userEdit = userService.getUser(user.getId());
        userEdit.setRole(user.getRole());
        userService.saveOrUpdate(userEdit);
        return "redirect:/admin/list/user?id="+userEdit.getId();
    }


    @PostMapping("/admin/user/order/status")
    public void getUserOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer orderId = Integer.parseInt(request.getParameter("id"));
        String value = request.getParameter("value");
        Order order = ordersServiceImp.findById(orderId);
        if(value.equals("canceled")){
            bookServiceImp.returnBookFromOrder(order.getBooks());
        }
        order.setStatus(value);
        ordersServiceImp.save(order);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("Статус у заказа с id: "+orderId+" изменени на "+value);
    }

    @GetMapping("/admin/list/orders")
    public String adminListOrders(@RequestParam String sort, @RequestParam String ascending, HttpServletRequest request, ModelMap modelMap){
        String url = utilService.createUrlForPaginBooks(request,sort, ascending);
        PagedListHolder<Order> pagedListHolder = utilService.createPagedListHolderWithSortOrder(ordersServiceImp.findAll(),sort,true,Boolean.parseBoolean(ascending));
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(8);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString());
        modelMap.put("head","List orders");
        return "listOrders";
    }

    @GetMapping("/admin/user/order/books")
    public void getBooksByOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer orderId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("books",ordersServiceImp.findById(orderId).getBooks());
        request.setAttribute("pagedListHolder",new PagedListHolder<>());
        request.setAttribute("strUrl","url");
        request.setAttribute("clearUrl","clearUrl");
        request.setAttribute("head","clearUrl");
        request.getRequestDispatcher("/WEB-INF/pages/testEditBook.jsp").forward(request, response);
    }


}
