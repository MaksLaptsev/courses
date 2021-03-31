package com.maxlaptsev.shop.repository;

import com.maxlaptsev.shop.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User,Integer> {
    @Override
    List<User> findAll();

    @Override
    <S extends User> S saveAndFlush(S s);

    @Override
    User getOne(Integer integer);

    @Override
    Optional<User> findById(Integer integer);

    User findByUsername(String username);




}
