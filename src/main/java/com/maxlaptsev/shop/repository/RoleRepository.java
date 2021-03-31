package com.maxlaptsev.shop.repository;

import com.maxlaptsev.shop.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Integer> {
    Optional<Role> findById(Integer id);

    List<Role> findAll();
}
