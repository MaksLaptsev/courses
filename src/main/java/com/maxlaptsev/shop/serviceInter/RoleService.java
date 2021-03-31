package com.maxlaptsev.shop.serviceInter;

import com.maxlaptsev.shop.model.Role;

import java.util.Optional;

public interface RoleService {
    Optional<Role> getRoleById(Integer id);
}
