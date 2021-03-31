package com.maxlaptsev.shop.serviceInter;


import com.maxlaptsev.shop.model.Book;

import java.util.List;

public interface BookService {
    List<Book> findAll();

    Book findById(Integer id);

    Book getOne(Integer id);

    void save(Book book);

    List<Book> findBooksByGenre(String genre);
}
