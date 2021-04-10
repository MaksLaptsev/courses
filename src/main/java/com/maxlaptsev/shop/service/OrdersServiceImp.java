package com.maxlaptsev.shop.service;

import com.maxlaptsev.shop.model.Order;
import com.maxlaptsev.shop.model.User;
import com.maxlaptsev.shop.repository.OrdersRepository;
import com.maxlaptsev.shop.serviceInter.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@Transactional
public class OrdersServiceImp implements OrdersService {
    @Autowired
    OrdersRepository ordersRepository;
    @Autowired
    UserService userService;
    @Autowired
    UtilService utilService;
    @Autowired
    BookServiceImp bookServiceImp;

    @Override
    public List<Order> findAll() {
        return ordersRepository.findAll();
    }

    @Override
    public Order findById(Integer id) {
        Optional<Order> ordersFromDB = ordersRepository.findById(id);
        return ordersFromDB.orElse(new Order());
    }

    @Override
    public Order getOne(Integer id) {
        return null;
    }


    public List<String> checkBook(Integer id){
        User user = userService.findUserById(id);
        List<String> check = new ArrayList<>();
        Map<Integer, Integer> map = utilService.getMapForCheck(user.getBasket().getBooks());

        for (Map.Entry<Integer,Integer> entry: map.entrySet()) {
            if(bookServiceImp.findById(entry.getKey()).getQuantityBook().getQuantity() < entry.getValue()){
                check.add(bookServiceImp.findById(entry.getKey()).getName());
            }
        }
        return  check;
    }

    public void createOrder(Integer userId){
        User user = userService.findUserById(userId);
        Order order = new Order();
        order.setBooks(user.getBasket().getBooks());
        bookServiceImp.correctQuantity(user.getBasket().getBooks());
        order.setTotalPrice(user.getBasket().getTotalPrice());
        order.setStatus("processing");
        order.setUserId(user.getId());
        order.setDateStringWithFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(order.getDataTimestamp()));
        user.addOrder(order);
        userService.saveOrUpdate(user);
    }

    @Override
    public void save(Order order) {
        ordersRepository.saveAndFlush(order);
    }

    @Override
    public List<Order> findByUserId(Integer id) {
        return ordersRepository.findByUserId(id);
    }
}
