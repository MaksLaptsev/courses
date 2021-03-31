package com.maxlaptsev.shop.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.*;

@Entity
@Table(catalog = "DB", schema = "SHOP", name = "USER")
public class User implements UserDetails {
    @Id
    @GeneratedValue
    private int id;
    @NotEmpty(message = "{app.valid.user.userName}")
    @Size(min = 3, max = 10, message = "{app.valid.user.sizeUserName}")
    @Column(name = "USERNAME")
    private String username;
    @NotEmpty(message = "{app.valid.user.pass}")
    @Size(min = 4, max = 100, message = "{app.valid.user.sizePass}")
    @Column(name = "PASSWORD")
    private String password;
    @Transient
    private String passwordConfirm;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.PERSIST)
    @JoinTable(catalog = "DB", schema = "SHOP", name = "USER_ROLE",
        joinColumns = @JoinColumn(name = "USER_ID"),
        inverseJoinColumns = @JoinColumn(name = "ROLE_ID"))
    private Role role;

    @OneToOne(cascade = CascadeType.ALL)
    private Basket basket;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(catalog = "DB", schema = "SHOP", name = "USER_ORDER",
        joinColumns = @JoinColumn(name = "USER_ID"),
        inverseJoinColumns = @JoinColumn(name = "ORDER_ID"))
    private List<Order> orders;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "USERINFO_ID")
    private UserInfo userInfo;

    public User() {
        basket = new Basket();
        userInfo = new UserInfo();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Basket getBasket() {
        return basket;
    }

    public void setBasket(Basket basket) {
        this.basket = basket;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public void addOrder(Order order){
        if(orders!=null){
            orders.add(order);
        }else {
            orders = new ArrayList<>();
            orders.add(order);
        }
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singletonList(role);
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
