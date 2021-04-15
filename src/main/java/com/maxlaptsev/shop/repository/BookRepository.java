package com.maxlaptsev.shop.repository;

import com.maxlaptsev.shop.model.Book;
import com.maxlaptsev.shop.model.GenreEnum;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BookRepository extends JpaRepository<Book,Integer> {
    @Override
    Optional<Book> findById(Integer integer);

    @Override
    List<Book> findAll();

    @Override
    <S extends Book> S saveAndFlush(S s);

    List<Book> findTop6ByOrderByIdDesc();

    Book findBookByName(String bookName);

    List<Book> findBooksByGenreIn(List<GenreEnum> genre);

    List<Book> findByNameContainingIgnoreCase(String name);


}
