package com.maxlaptsev.shop.repository;

import com.maxlaptsev.shop.model.Author;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface AuthorRepository extends JpaRepository<Author, Integer> {

    @Override
    List<Author> findAll();

    @Override
    Optional<Author> findById(Integer integer);

    @Override
    Author getOne(Integer integer);

    @Override
    <S extends Author> S saveAndFlush(S s);

    Author findByName(String name);

    Author findByLastName(String lastname);

    List<Author> findByNameContainingIgnoreCase(String name);

    List<Author> findByLastNameContainingIgnoreCase(String name);
}
