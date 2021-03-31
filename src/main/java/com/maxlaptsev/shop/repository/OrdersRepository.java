package com.maxlaptsev.shop.repository;

import com.maxlaptsev.shop.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface OrdersRepository extends JpaRepository<Order, Integer> {
    @Override
    List<Order> findAll();

    @Override
    <S extends Order> S saveAndFlush(S s);

    @Override
    Order getOne(Integer integer);

    @Override
    Optional<Order> findById(Integer integer);

    @Override
    default <S extends Order> S save(S s) {
        return null;
    }

    List<Order> findByUserId(Integer id);

}

