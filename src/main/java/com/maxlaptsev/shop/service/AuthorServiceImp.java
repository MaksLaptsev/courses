package com.maxlaptsev.shop.service;

import com.maxlaptsev.shop.model.Author;
import com.maxlaptsev.shop.repository.AuthorRepository;
import com.maxlaptsev.shop.serviceInter.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class AuthorServiceImp implements AuthorService {
    @Autowired
    AuthorRepository authorRepository;

    @Override
    public List<Author> findAll() {
        return authorRepository.findAll();
    }

    @Override
    public Author findById(Integer id) {
        Optional<Author> authorFromDB = authorRepository.findById(id);
        return authorFromDB.orElse(new Author());
    }

    @Override
    public Author getOne(Integer id) {
        return null;
    }

    @Override
    public void save(Author author) {
        authorRepository.saveAndFlush(author);
    }

    public List<Author> search(String keyword){
        Set<Author> authors = new HashSet<>();
        authors.addAll(authorRepository.findByNameContainingIgnoreCase(keyword));
        authors.addAll(authorRepository.findByLastNameContainingIgnoreCase(keyword));
        return new ArrayList<>(authors);
    }

    @Override
    public Author findByName(String name) {
        Author author = authorRepository.findByName(name);
        if(author == null){
            author = authorRepository.findByLastName(name);
            if(author == null){
                return new Author();
            }
        }
        return author;
    }
}
