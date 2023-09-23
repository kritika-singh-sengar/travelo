package com.nagarro.login.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.nagarro.login.config.CustomUserDetails;
import com.nagarro.login.dao.UserDao;
import com.nagarro.login.pojo.User;

@Component
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserDao dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<User> user = dao.findByEmail(username);
		return user.map(CustomUserDetails::new).orElseThrow(()-> new UsernameNotFoundException("User not found with name:"+username));
	}

}
