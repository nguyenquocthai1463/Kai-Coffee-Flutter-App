package com.quanlychiteunhom.backend.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.quanlychiteunhom.backend.entities.Account;

@Repository
public interface AccountRepo extends JpaRepository<Account, Integer>{

    Optional<Account> findByPhonenumber(String phonenumber);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);

}
