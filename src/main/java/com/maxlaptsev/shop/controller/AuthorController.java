package com.maxlaptsev.shop.controller;

import com.maxlaptsev.shop.model.Author;
import com.maxlaptsev.shop.model.Book;
import com.maxlaptsev.shop.service.AuthorServiceImp;
import com.maxlaptsev.shop.service.BookServiceImp;
import com.maxlaptsev.shop.service.UtilService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AuthorController {
    @Autowired
    AuthorServiceImp authorServiceImp;
    @Autowired
    UtilService utilService;
    @Autowired
    BookServiceImp bookServiceImp;

    @GetMapping("/getAllAuthors")
    public String getAllAuthors(@RequestParam String sort, @RequestParam String ascending,
                                HttpServletRequest request, ModelMap modelMap){
        String url = utilService.createUrlForPaginBooks(request,sort, ascending);
        List<Author> authors = authorServiceImp.findAll();
        PagedListHolder<Author> pagedListHolder = new PagedListHolder<>(authors, new MutableSortDefinition(sort, true, Boolean.parseBoolean(ascending)));
        pagedListHolder.resort();
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(6);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString());
        return "getAllAuthors";
    }

    @GetMapping("/getAuthorById/{id}")
    public ModelAndView getAuthorById(@PathVariable Integer id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("authorInfo");
        modelAndView.addObject("getauthor", authorServiceImp.findById(id));
        return modelAndView;
    }

    @GetMapping("/getAuthorByName/")
    public String getAuthorByName(@RequestParam String sort, @RequestParam String ascending,
                                        HttpServletRequest request, ModelMap modelMap, @RequestParam("search") String name){
        String url = utilService.createUrlForPaginBooks(request,sort,ascending);
        List<Author> authors = authorServiceImp.search(name);
        PagedListHolder<Author> pagedListHolder = utilService.createPagedListHolderWithSortAuthor(authors,sort,true,Boolean.parseBoolean(ascending));
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(6);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString()+"?search="+name);
        modelMap.put("head", utilService.localeMessageForBookPage("searchAuthor"));
        return "searchAuthor";
    }

    @GetMapping("/admin/addAuthor")
    public String addAuthor(Model model){
        model.addAttribute("authorForm", new Author());
        return "/admin/addAuthor";
    }


    @PostMapping("/admin/addAuthor")
    public String saveAuthor(@ModelAttribute("authorForm")Author authorForm){
        authorServiceImp.save(authorForm);
        return "redirect:/";
    }

    @GetMapping("/books")
    public String authorBooks(@RequestParam String sort, @RequestParam String ascending, @RequestParam String authorId,
                              HttpServletRequest request, ModelMap modelMap){

        String url = utilService.createUrlForPaginBooks(authorId,request,sort,ascending);
        List<Book> books = authorServiceImp.findById(Integer.parseInt(authorId)).getBooks();
        PagedListHolder<Book> pagedListHolder = utilService.createPagedListHolderWithSort(books,sort,true,Boolean.parseBoolean(ascending));
        pagedListHolder.setPage(utilService.intPage(request,"p",0));
        pagedListHolder.setPageSize(6);
        modelMap.put("pagedListHolder",pagedListHolder);
        modelMap.put("strUrl",url);
        modelMap.put("clearUrl", request.getRequestURL().toString()+"?authorId="+authorId);
        modelMap.put("authorName", authorServiceImp.findById(Integer.parseInt(authorId)).toString());
        return "authorBooks";
    }
}
