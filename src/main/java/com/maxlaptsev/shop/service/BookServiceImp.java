package com.maxlaptsev.shop.service;

import com.maxlaptsev.shop.model.Book;
import com.maxlaptsev.shop.model.GenreEnum;
import com.maxlaptsev.shop.repository.BookRepository;
import com.maxlaptsev.shop.serviceInter.BookService;
import com.maxlaptsev.shop.serviceInter.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class BookServiceImp implements BookService {
    @Autowired
    BookRepository bookRepository;
    @Autowired
    OrdersService ordersService;

    @Override
    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    @Override
    public Book findById(Integer id) {
        Optional<Book> bookFromDB = bookRepository.findById(id);
        return bookFromDB.orElse(new Book());
    }

    @Override
    public Book getOne(Integer id) {
        return null;
    }

    @Override
    public void save(Book book) {
        bookRepository.saveAndFlush(book);
    }

    public Book getByName(String name){
     Book book = bookRepository.findBookByName(name);
     if(book == null){
         return new Book();
     }
     return book;
    }

    @Override
    public List<Book> findBooksByGenre(String genre) {
        List<GenreEnum> enums = new ArrayList<>();
        enums.add(GenreEnum.valueOf(genre));
        return bookRepository.findBooksByGenreIn(enums);
    }

    public void correctQuantity(List<Book> books){
        for (Book b:books) {
            b.getQuantityBook().setQuantity(b.getQuantityBook().getQuantity()-1);
        }
    }

    public List<Book> findBookStart(){
        List<Book> result = new ArrayList<>();
        List<Book> books = bookRepository.findTop6ByOrderByIdDesc();
        int i = 0;
        for (Book b :books) {
            result.add(b);
            if(result.size() >= 6){
                break;
            }
        }
        return result;
    }

    public void returnBookFromOrder(List<Book> booksFromOrder){
        for (Book book : booksFromOrder) {
            Book fromDB = bookRepository.findById(book.getId()).orElse(new Book());
            fromDB.getQuantityBook().setQuantity(fromDB.getQuantityBook().getQuantity()+1);
            bookRepository.saveAndFlush(fromDB);
        }
    }

    public List<Book> search(String keyword){
        return bookRepository.findByNameContainingIgnoreCase(keyword);
    }

    public List<Book> findByOrderId(Integer id){
        return ordersService.findById(id).getBooks();
    }
}
