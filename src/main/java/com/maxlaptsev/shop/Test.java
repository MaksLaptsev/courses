package com.maxlaptsev.shop;

import com.maxlaptsev.shop.model.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

public class Test {


    public static void main(String[] args) throws IOException {
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

//        //SCIENCE
//        Book book1 = new Book(520,"Sapiens. Краткая история человечества", "Синдбад","Русский",37.24);
//        //SCIENCE
//        Book book2 = new Book(496,"Homo Deus. Краткая история будущего", "Синдбад", "Русский", 37.24);
//        //Детектив
//        Book book3 = new Book(352,"Смерть на Ниле","Эксмо","Русский",18.34);
//        //ТриллерДетектив
//        Book book4 = new Book(512,"Семь смертей Эвелины Хардкасл", "Азбука", "Русский", 25.63);
//        //ADVENTURE
//        Book book5 = new Book(768,"Ведьмак. Крещение огнём. Башня ласточки", "АСТ", "Русский", 21.37);
//        //наука
//        Book book6 = new Book(544,"Ведьмак. Владычица озера","АСТ","Русский",19.64);
//
//
//        //Sapiens. Краткая история человечества
//        Author author1 = new Author("Юваль","Харари");
//        //Смерть на Ниле
//        Author author2 = new Author("Агата","Кристи");
//        //Семь смертей Эвелины Хардкасл
//        Author author3 = new Author("Стюарт","Тёртон");
//        //Ведьмак. Крещение огнём. Башня ласточки
//        Author author4 = new Author("Анджей","Сапковский");
//        //Искусство войны
//        Author author5 = new Author("Сунь","Цзы");
//        //Краткие ответы на большие вопросы
//        Author author6 = new Author("Стивен","Хокинг");
//
//        book1.setAuthors(Arrays.asList(author1));
//        book2.setAuthors(Arrays.asList(author1));
//        book3.setAuthors(Arrays.asList(author2));
//        book4.setAuthors(Arrays.asList(author3));
//        book5.setAuthors(Arrays.asList(author4));
//        book6.setAuthors(Arrays.asList(author4));
//
//        book1.setQuantityBook(new QuantityBook(54));
//        book2.setQuantityBook(new QuantityBook(74));
//        book3.setQuantityBook(new QuantityBook(33));
//        book4.setQuantityBook(new QuantityBook(21));
//        book5.setQuantityBook(new QuantityBook(62));
//        book6.setQuantityBook(new QuantityBook(29));
//
//        book1.setUrlImg("resources/static/images/sapiens.jpg");
//        book2.setUrlImg("resources/static/images/homoDeus.jpg");
//        book3.setUrlImg("resources/static/images/deathOfNeel.jpg");
//        book4.setUrlImg("resources/static/images/sevenDeath.jpg");
//        book5.setUrlImg("resources/static/images/swallowTower.jpg");
//        book6.setUrlImg("resources/static/images/ladyLake.jpg");
//
//
//
//
//
//        book1.setGenre(Arrays.asList(GenreEnum.SCIENCE));
//        book2.setGenre(Arrays.asList(GenreEnum.SCIENCE));
//        book3.setGenre(Arrays.asList(GenreEnum.DETECTIVE));
//        book4.setGenre(Arrays.asList(GenreEnum.THRILLER,GenreEnum.DETECTIVE));
//        book5.setGenre(Arrays.asList(GenreEnum.ADVENTURE));
//        book6.setGenre(Arrays.asList(GenreEnum.ADVENTURE));
//
//        User user = session.get(User.class,167);
//        Basket basket = user.getBasket();
//        basket.addBookInCart(session.get(Book.class,91));
//        basket.addBookInCart(session.get(Book.class,88));
//        basket.addBookInCart(session.get(Book.class,94));
//        basket.addBookInCart(session.get(Book.class,264));
//        basket.addBookInCart(session.get(Book.class,100));
//        basket.addBookInCart(session.get(Book.class,273));


//        Order order = new Order();
//        order.setStatus(1);
//        order.setDateStringWithFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(order.getDataTimestamp()));
//

        User user =  session.get(User.class,1903);
        session.delete(user);
        transaction.commit();

//
//        session.save(order);
//        transaction.commit();
//        session.close();







    }
}
