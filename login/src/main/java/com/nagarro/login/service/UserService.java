/**
 * 
 */
package com.nagarro.login.service;

import java.util.List;

import com.nagarro.login.pojo.User;

/**
 * @author kritikasingh02
 *
 */
public interface UserService {

	//public String login(String email, String password);
	public String register(User user);
	//public String logout(String email);
	public String generateToken(String email);
	public void validateToken(String token);
	
}
