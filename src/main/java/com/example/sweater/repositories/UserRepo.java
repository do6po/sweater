package com.example.sweater.repositories;

import com.example.sweater.entities.User;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

    @Override
    @EntityGraph(attributePaths = {"roles"})
    List<User> findAll();
}
