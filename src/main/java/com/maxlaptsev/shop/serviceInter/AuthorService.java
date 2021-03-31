package com.maxlaptsev.shop.serviceInter;

import com.maxlaptsev.shop.model.Author;

import java.util.List;

public interface AuthorService {

    List<Author> findAll();

    Author findById(Integer id);

    Author getOne(Integer id);

    void save(Author author);

    Author findByName(String name);

    public List<Author> search(String keyword);
}
