package com.quanlychiteunhom.backend.security.services;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.quanlychiteunhom.backend.repositories.AccountRepo;
import com.quanlychiteunhom.backend.security.dto.SecurityUser;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserDetailService implements UserDetailsService {

    private final AccountRepo userRepository;

    @Override
    public UserDetails loadUserByUsername(String phonenumber) {
        var user  = userRepository.findByPhonenumber(phonenumber);
        return user.map(SecurityUser::new)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
    }

}
