package com.maxlaptsev.shop.service;

import com.maxlaptsev.shop.model.Role;
import com.maxlaptsev.shop.repository.RoleRepository;
import com.maxlaptsev.shop.serviceInter.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RoleServiceImp implements RoleService {
    @Autowired
    RoleRepository roleRepository;

    @Override
    public Optional<Role> getRoleById(Integer id) {
        return roleRepository.findById(id);
    }

    public List<Role> findAll(){
       return roleRepository.findAll();
    }
}
