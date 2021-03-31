package com.maxlaptsev.shop.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
@Table(catalog = "DB", schema = "SHOP", name = "NOB")
public class QuantityBook {
    @Id
    @GeneratedValue
    private int id;
    @NotNull(message = "{app.valid.book.name}")
    @Column(name = "NOBA")
    private int quantity;

    @OneToOne(mappedBy = "quantityBook")
    private Book book;

    public QuantityBook() {
    }
    public QuantityBook(Integer id, int quantity) {
        this.id = id;
        this.quantity = quantity;
    }

    public QuantityBook(int quantity) {
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Override
    public String toString() {
        return "NumberOfBooks{" +
                "quantity=" + quantity +
                '}';
    }
}
