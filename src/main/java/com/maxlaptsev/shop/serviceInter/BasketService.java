package com.maxlaptsev.shop.serviceInter;

import com.maxlaptsev.shop.model.Basket;

import java.util.List;

public interface BasketService {
    List<Basket> findAll();

    Basket findById(Integer id);

    Basket getOne(Integer id);

    void save(Basket basket);
}
