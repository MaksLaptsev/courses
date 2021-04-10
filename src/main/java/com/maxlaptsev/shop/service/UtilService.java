package com.maxlaptsev.shop.service;



import com.maxlaptsev.shop.model.Author;
import com.maxlaptsev.shop.model.Book;
import com.maxlaptsev.shop.model.Order;
import com.maxlaptsev.shop.model.User;
import org.springframework.beans.support.MutableSortDefinition;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class UtilService {

    public String checkLanguage(Cookie[] cookies){
        for (Cookie coo:cookies) {
            if (coo.getValue().length() < 3){
                return coo.getValue();
            }
        }
        return "ru";
    }

    public int intPage(HttpServletRequest request, String p, int val){

        String s = request.getCookies().toString();

        return ServletRequestUtils.getIntParameter(request,p,val);
    }

    public PagedListHolder<Book> createPagedListHolderWithSort(List<Book> items, String sortBy, boolean ignoreCase, boolean ascending) {
        MutableSortDefinition sortDefinition = new MutableSortDefinition(sortBy, ignoreCase, ascending);
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<>(items, sortDefinition);
        pagedListHolder.resort();
        return pagedListHolder;
    }

    public PagedListHolder<Author> createPagedListHolderWithSortAuthor(List<Author> items, String sortBy, boolean ignoreCase, boolean ascending) {
        MutableSortDefinition sortDefinition = new MutableSortDefinition(sortBy, ignoreCase, ascending);
        PagedListHolder<Author> pagedListHolder = new PagedListHolder<>(items, sortDefinition);
        pagedListHolder.resort();
        return pagedListHolder;
    }

    public PagedListHolder<Order> createPagedListHolderWithSortOrder(List<Order> items, String sortBy, boolean ignoreCase, boolean ascending) {
        MutableSortDefinition sortDefinition = new MutableSortDefinition(sortBy, ignoreCase, ascending);
        PagedListHolder<Order> pagedListHolder = new PagedListHolder<>(items, sortDefinition);
        pagedListHolder.resort();
        return pagedListHolder;
    }

    public PagedListHolder<User> createPagedListHolderWithSortUser(List<User> items, String sortBy, boolean ignoreCase, boolean ascending) {
        MutableSortDefinition sortDefinition = new MutableSortDefinition(sortBy, ignoreCase, ascending);
        PagedListHolder<User> pagedListHolder = new PagedListHolder<>(items, sortDefinition);
        pagedListHolder.resort();
        return pagedListHolder;
    }

    public String createUrlForPaginBooks(HttpServletRequest request, String sort, String ascending){
        return request.getRequestURL().toString()+"?sort=" + sort+"&ascending="+ascending;
    }

    public String createUrlForPaginBooks(String authorId ,HttpServletRequest request, String sort, String ascending){
        return request.getRequestURL().toString()+"?authorId="+authorId+"&sort=" + sort+"&ascending="+ascending;
    }

    public String localeMessageForBookPage(String s){
        if(s==null){
            return "app.book.default";
        }
        return "app.book."+s;
    }

    public double correctPrice(double price){
        return (double) Math.round(price * 100.00) / 100.00;
    }

    public Map<Integer, Integer> getMapForCheck(List<Book> books){
        Map<Integer, Integer> map = new HashMap<>();
        for (Book b :books) {
            if(map.containsKey(b.getId())){
                map.put(b.getId(), map.get(b.getId()) +1);
            }else {
                map.put(b.getId(),1);
            }
        }
        return map;
    }


}
