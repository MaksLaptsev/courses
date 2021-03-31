package com.maxlaptsev.shop.model;

import javax.persistence.*;
import java.util.List;
@Entity
@Table(catalog = "DB", schema = "SHOP", name = "BASKET")
public class Basket {
    @Id
    @GeneratedValue
    private int id;

    @Column(name = "TOTALPRICE")
    private double totalPrice;

    @OneToOne(mappedBy = "basket")
    private User user;

    @ManyToMany (cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinTable(catalog = "DB", schema = "SHOP", name = "BASKET_BOOK",
            joinColumns = @JoinColumn(name = "BASKET_ID"),
            inverseJoinColumns = @JoinColumn(name = "BOOK_ID"))
    private List<Book> books;

    public Basket() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
