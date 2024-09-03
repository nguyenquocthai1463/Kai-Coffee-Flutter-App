package com.quanlychiteunhom.backend.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.quanlychiteunhom.backend.dto.RegisterRequest;
import com.quanlychiteunhom.backend.entities.Account;
import com.quanlychiteunhom.backend.repositories.AccountRepo;

@Service
public class AuthService {

    @Autowired
    private AccountRepo accountRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Account register(RegisterRequest registerRequest) {
        if(accountRepo.existsByEmail(registerRequest.getPhonenumber())) {
            throw new RuntimeException("Số điện thoại đã tồn tại");
        }
        Account account = new Account();
        account.setPhonenumber(registerRequest.getPhonenumber());
        account.setPassword(passwordEncoder.encode(registerRequest.getPassword()));

        return accountRepo.save(account);
    }

}
