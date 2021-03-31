package com.maxlaptsev.shop.model;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.List;
@Entity
@Table(catalog = "DB", schema = "SHOP", name = "ROLE")
public class Role implements GrantedAuthority {
    @Id
    @GeneratedValue
    private int id;
    @Column(name = "NAME")
    private String name;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<User> users;

    public Role() {
    }

    public Role(String name) {
        this.name = name;
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

    @Override
    public String getAuthority() {
        return getName();
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return name;
    }
}
