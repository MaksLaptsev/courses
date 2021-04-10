package com.maxlaptsev.shop.model;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

@Entity
@Table(catalog = "DB", schema = "SHOP", name = "USERINFO")
public class UserInfo {
    @Id
    @GeneratedValue
    private int id;

    @Column(name = "NAME")
    private String name;
    @Column(name = "LASTNAME")
    private String lastName;
//    @Pattern(regexp="^(\\+375|80)(29|25|44|33)(\\d{3})(\\d{2})(\\d{2})$",
//            message="{app.valid.userInfo.phone}")
    @Pattern(regexp = "^((\\+375|80)(29|25|44|33)(\\d{3})(\\d{2})(\\d{2})|(\\s*))$",
            message="{app.valid.userInfo.phone}")
    @Column(name = "PHONENUMBER")
    private String phoneNumber;
    @Email(message = "{app.valid.userInfo.mail}")
    @Column(name = "EMAIL")
    private String email;

    @OneToOne(mappedBy = "userInfo")
    private User user;

    public UserInfo() {
    }

    public UserInfo(String name, String lastName, String phoneNumber, String email) {
        this.name = name;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.email = email;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
