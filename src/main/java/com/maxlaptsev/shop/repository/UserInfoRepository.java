package com.maxlaptsev.shop.repository;

import com.maxlaptsev.shop.model.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserInfoRepository extends JpaRepository<UserInfo,Integer> {
    @Override
    List<UserInfo> findAll();

    @Override
    <S extends UserInfo> S saveAndFlush(S s);

    @Override
    UserInfo getOne(Integer integer);

    UserInfo findByUser_Username(String username);

    @Override
    Optional<UserInfo> findById(Integer integer);
}
