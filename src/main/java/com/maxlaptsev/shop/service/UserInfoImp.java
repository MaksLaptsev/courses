package com.maxlaptsev.shop.service;

import com.maxlaptsev.shop.model.UserInfo;
import com.maxlaptsev.shop.repository.UserInfoRepository;
import com.maxlaptsev.shop.serviceInter.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class UserInfoImp implements UserInfoService {
    @Autowired
    UserInfoRepository userInfoRepository;

    @Override
    public List<UserInfo> findAll() {
        return userInfoRepository.findAll();
    }

    @Override
    public UserInfo findById(Integer id) {
        Optional<UserInfo> userInfoFromDB= userInfoRepository.findById(id);
        return userInfoFromDB.orElse(new UserInfo());
    }

    @Override
    public UserInfo getOne(Integer id) {
        return null;
    }

    public boolean checkPhoneOrEmail(String username){
        UserInfo info = userInfoRepository.findByUser_Username(username);
        return ((info.getEmail() != null || info.getPhoneNumber() != null) && info.getName() != null) &&
                ((!info.getEmail().equals("") || !info.getPhoneNumber().equals("")) && !info.getName().equals(""));
    }

    @Override
    public void save(UserInfo userInfo) {
        userInfoRepository.saveAndFlush(userInfo);
    }
}
