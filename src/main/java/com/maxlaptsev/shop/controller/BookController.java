package com.maxlaptsev.shop.controller;

import com.maxlaptsev.shop.model.Book;
import com.maxlaptsev.shop.service.BookServiceImp;
import com.maxlaptsev.shop.service.UtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    BookServiceImp bookServiceImp;

    @Autowired
    UtilService utilService;


    @GetMapping("/start")
    public ModelAndView startBooks(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("start");
        modelAndView.addObject("books",bookServiceImp.findBookStart());
        return modelAndView;
    }

    @GetMapping("/getBookByName/")
    public String getBookByName(@RequestParam String sort,@RequestParam String ascending,
                                      HttpServletRequest request, ModelMap modelMap, @RequestParam("search") String name){
        String url = utilService.createUrlForPaginBooks(request,sort, ascending);
        List<Book> books = bookServiceImp.search(name);
        PagedListHolder<Book> pagedListHolder = utilService.createPagedListHolderWithSort(books,sort,true,Boolean.parseBoolean(ascending));
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(6);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString()+"?search="+name);
        modelMap.put("head",utilService.localeMessageForBookPage("searchBook"));
        return "searchBook";
    }

    @GetMapping("/getbookById/{id}")
    public ModelAndView getBookById(@PathVariable Integer id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("bookInfo");
        modelAndView.addObject("getbook", bookServiceImp.findById(id));
        return modelAndView;
    }

    @GetMapping("/admin/addBook")
    public String addBook(Model model){
        model.addAttribute("bookForm", new Book());
        return "/admin/addBook";
    }

    @PostMapping("/admin/addBook")
    public String saveBook(@ModelAttribute("bookForm")Book bookForm, Model model){
        bookServiceImp.save(bookForm);
        return "redirect:/";
    }

    @GetMapping("/getAllBooks/{genre}")
    public String booksByGenrePaginated(@RequestParam String sort,@RequestParam String ascending, @PathVariable String genre,
                                        HttpServletRequest request, ModelMap modelMap){
        String url = utilService.createUrlForPaginBooks(request,sort,ascending);
        List<Book> books = bookServiceImp.findBooksByGenre(genre);
        PagedListHolder<Book> pagedListHolder = utilService.createPagedListHolderWithSort(books,sort,true,Boolean.parseBoolean(ascending));
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(6);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString());
        modelMap.put("head",utilService.localeMessageForBookPage(genre));
        return "getAllBooks";

    }

    @GetMapping("/getAllBooks")
    public String  paginatedBooks(@RequestParam String sort,@RequestParam String ascending,
            HttpServletRequest request, ModelMap modelMap){
        String url = utilService.createUrlForPaginBooks(request,sort, ascending);
        List<Book> books = bookServiceImp.findAll();
        PagedListHolder<Book> pagedListHolder = utilService.createPagedListHolderWithSort(books,sort,true,Boolean.parseBoolean(ascending));
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(6);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString());
        modelMap.put("head",utilService.localeMessageForBookPage("default"));
        return "getAllBooks";
    }

}
