package com.maxlaptsev.shop.model;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Objects;

@Entity
@Table(catalog = "DB", schema = "SHOP", name = "BOOK")
public class Book {
    @NotBlank(message = "{app.valid.book.name}")
    @Column(name = "NAME")
    private String name;
    @NotNull(message = "{app.valid.book.name}")
    @Column
    private int pages;
    @Id
    @GeneratedValue
    private int id;
    @NotBlank(message = "{app.valid.book.name}")
    @Column(name = "PUBLISH")
    private String publisher;
    @NotBlank(message = "{app.valid.book.name}")
    @Column(name = "LANGUAGE")
    private String language;
    @DecimalMin(value = "0.00", message = "{app.valid.book.name}")
    @Column(name = "PRICE")
    private double price;
    @Column(name = "URLIMG")
    private String urlImg;
    @Column(name = "DESCRIPTION")
    private String description;



    public Book() {
        quantityBook = new QuantityBook();
    }

    public Book(String name) {
        this.name = name;
    }

    public Book(int pages, String name, String publisher, String language, double price) {
        this.pages = pages;
        this.name = name;
        this.publisher = publisher;
        this.language = language;
        this.price = price;
    }

    @ManyToMany(cascade = CascadeType.PERSIST,fetch = FetchType.LAZY)
    @JoinTable(catalog = "DB", schema = "SHOP", name = "BOOK_AUTHOR",
            joinColumns =  @JoinColumn(name = "BOOK_ID"),
            inverseJoinColumns = @JoinColumn(name = "AUTHOR_ID"))
    @NotEmpty(message = "{app.valid.book.author}")
    private List<Author> authors;

    @ManyToMany (fetch = FetchType.LAZY)
    private List<Basket> baskets;

    @ManyToMany(fetch = FetchType.LAZY)
    private List<Order> orders;


    @Enumerated(EnumType.STRING)
    @ElementCollection(targetClass = GenreEnum.class)
    @JoinTable(catalog = "DB", schema = "SHOP", name = "BOOK_GENRE")
    @NotEmpty(message = "{app.valid.book.genre}")
    private List<GenreEnum> genre;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "NOB_ID")
    private QuantityBook quantityBook;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public List<Author> getAuthors() {
        return authors;
    }

    public Author getAuthor(int index){
        return authors.get(index);
    }

    public void setAuthors(List<Author> authors) {
        this.authors = authors;
    }

    public List<Basket> getBaskets() {
        return baskets;
    }

    public void setBaskets(List<Basket> baskets) {
        this.baskets = baskets;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public List<GenreEnum> getGenre() {
        return genre;
    }

    public void setGenre(List<GenreEnum> genre) {
        this.genre = genre;
    }

    public QuantityBook getQuantityBook() {
        return quantityBook;
    }

    public void setQuantityBook(QuantityBook quantityBook) {
        this.quantityBook = quantityBook;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String authorToString(){
        StringBuilder s = new StringBuilder();
        for (int i = 0; i < authors.size(); i++) {
            s.append(authors.get(i).getName()).append(" ").append(authors.get(i).getLastName());
            if(i!=authors.size()-1){
                s.append(", ");
            }else{
                s.append(".");
            }
        }
        return s.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Book book = (Book) o;
        return id == book.id &&
                Objects.equals(name, book.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, id);
    }

    @Override
    public String toString() {
        return "Book{" +
                "name='" + name + '\'' +
                ", pages=" + pages +
                ", id=" + id +
                ", publisher='" + publisher + '\'' +
                ", language='" + language + '\'' +
                ", price=" + price +
                ", authors=" + authors +
                ", genre=" + genre +
                ", numberOfBooks=" + quantityBook +
                '}';
    }
}
