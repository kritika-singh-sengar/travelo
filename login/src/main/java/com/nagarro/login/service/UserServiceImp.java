/**
 * 
 */
package com.nagarro.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nagarro.login.constant.Constants;
import com.nagarro.login.dao.UserDao;
import com.nagarro.login.pojo.User;
import com.nagarro.login.util.JwtUtil;

/**
 * @author kritikasingh02
 *
 */
@Service
public class UserServiceImp implements UserService{
	
	@Autowired
	private UserDao dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private JwtUtil jwtUtil;

	@Override
	public String register(User user) {
		if(!dao.existsById(user.getId()) && !dao.existsByEmail(user.getEmail())) {
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			dao.save(user);
			return user.getEmail();
		}
		return null;
	}

	@Override
	public String generateToken(String email) {
		return jwtUtil.generateToken(email);
	}

	@Override
	public void validateToken(String token) {
		jwtUtil.validateToken(token);
		
	}

}
