package com.maxlaptsev.shop.repository;

import com.maxlaptsev.shop.model.Basket;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BasketRepository extends JpaRepository<Basket, Integer> {
    @Override
    Optional<Basket> findById(Integer integer);

    @Override
    Basket getOne(Integer integer);

    @Override
    <S extends Basket> S saveAndFlush(S s);

    Basket findBasketByUserId(Integer integer);

    @Override
    default <S extends Basket> S save(S s) {
        return null;
    }
}
