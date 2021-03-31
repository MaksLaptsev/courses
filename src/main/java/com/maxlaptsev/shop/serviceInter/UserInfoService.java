package com.maxlaptsev.shop.serviceInter;

import com.maxlaptsev.shop.model.UserInfo;

import java.util.List;

public interface UserInfoService {
    List<UserInfo> findAll();

    UserInfo findById(Integer id);

    UserInfo getOne(Integer id);

    void save(UserInfo userInfo);
}
