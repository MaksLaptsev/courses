package com.maxlaptsev.shop.service;

import com.maxlaptsev.shop.model.Basket;
import com.maxlaptsev.shop.model.Book;
import com.maxlaptsev.shop.repository.BasketRepository;
import com.maxlaptsev.shop.serviceInter.BasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class BasketServiceImp implements BasketService {
    @Autowired
    BasketRepository basketRepository;
    @Autowired
    BookServiceImp bookServiceImp;
    @Autowired
    UserService userService;
    @Autowired
    UtilService utilService;

    @Override
    public List<Basket> findAll() {
        return basketRepository.findAll();
    }

    @Override
    public Basket findById(Integer id) {
        Optional<Basket> basketFromBD = basketRepository.findById(id);
        return  basketFromBD.orElse(new Basket());
    }

    @Override
    public Basket getOne(Integer id) {
        return null;
    }

    @Override
    public void save(Basket basket) {
        basketRepository.saveAndFlush(basket);
    }

    public Basket findBasketByUserId(Integer integer){
        return basketRepository.findBasketByUserId(integer);
    }

    public void addBookToBasket(Integer idBook, Integer idBasket){
        Basket basket =  basketRepository.findById(idBasket).orElse(new Basket());
        Book book =bookServiceImp.findById(idBook);
        if(basket.getBooks()!= null){
            basket.getBooks().add(book);
            basket.setTotalPrice(utilService.correctPrice(basket.getTotalPrice()+book.getPrice()));
        }else{
            basket.setBooks(Collections.singletonList(book));
            basket.setTotalPrice(utilService.correctPrice(book.getPrice()));
        }
        basketRepository.save(basket);
    }

    public void delFromBasket(Integer idBook, Integer idBasket){
        Basket basket = basketRepository.findById(idBasket).orElse(new Basket());
        Book book = bookServiceImp.findById(idBook);
        basket.getBooks().remove(book);
        basket.setTotalPrice(utilService.correctPrice(basket.getTotalPrice()-book.getPrice()));
        basketRepository.save(basket);
    }

    public void clearBasket(String userName){
        Basket basket = userService.getUserByUsername(userName).getBasket();
        basket.getBooks().clear();
        basket.setTotalPrice(0.00);
        basketRepository.save(basket);
    }
}
