package com.maxlaptsev.shop.serviceInter;

import com.maxlaptsev.shop.model.Order;

import java.util.List;

public interface OrdersService {

    List<Order> findAll();

    Order findById(Integer id);

    Order getOne(Integer id);

    void save(Order orders);

    List<Order> findByUserId(Integer id);

}
