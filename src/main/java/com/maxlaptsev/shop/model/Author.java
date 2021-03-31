package com.maxlaptsev.shop.model;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;
@Entity
@Table(catalog = "DB", schema = "SHOP", name = "AUTHOR")
public class Author {
    @Id
    @GeneratedValue
    private int id;
    @NotBlank(message = "{app.valid.book.name}")
    @Column(name = "NAME")
    private String name;
    @NotBlank(message = "{app.valid.book.name}")
    @Column(name = "LASTNAME")
    private String lastName;
    @NotBlank(message = "{app.valid.book.name}")
    @Column(name = "BIO")
    private String bio;
    @Column(name = "URLIMG")
    private String urlImg;

    public Author() {
    }

    public Author(String name, String lastName) {
        this.name = name;
        this.lastName = lastName;
    }

    public Author(String name, String lastName, String bio, String urlImg) {
        this.name = name;
        this.lastName = lastName;
        this.bio = bio;
        this.urlImg = urlImg;
    }

    @ManyToMany(mappedBy = "authors")
    private List<Book> books;

    public String getNameAndLastName(){
        return name+" "+lastName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    @Override
    public String toString() {
        return name + " "+lastName;
    }
}
