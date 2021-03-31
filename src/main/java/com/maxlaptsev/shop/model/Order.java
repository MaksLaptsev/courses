package com.maxlaptsev.shop.model;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
@Entity
@Table(catalog = "DB", schema = "SHOP", name = "ORDERS")
public class Order {
    @Id
    @GeneratedValue
    private int id;
    @Column(name = "STATUS")
    private String status;
    @Column(name = "DATE")
    private Timestamp dataTimestamp;
    @Column(name = "DATESTRINGWITHFORMAT")
    private String dateStringWithFormat;
    @Column(name = "ID_USER")
    private int userId;
    @Column(name = "TOTALPRICE")
    private double totalPrice;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(catalog = "DB", schema = "SHOP", name = "ORDER_ITEM",
            joinColumns = @JoinColumn(name = "ORDER_ID"),
            inverseJoinColumns = @JoinColumn(name = "BOOK_ID"))
    private List<Book> books;

    @ManyToOne
    private User user;


    public Order() {
        dataTimestamp = new Timestamp(new Date().getTime());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getDataTimestamp() {
        return dataTimestamp;
    }

    public void setDataTimestamp(Timestamp dataTimestamp) {
        this.dataTimestamp = dataTimestamp;
    }

    public String getDateStringWithFormat() {
        return dateStringWithFormat;
    }

    public void setDateStringWithFormat(String dateStringWithFormat) {
        this.dateStringWithFormat = dateStringWithFormat;
    }

    public int getUserId() {
        return userId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
