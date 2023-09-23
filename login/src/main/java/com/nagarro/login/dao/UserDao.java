/**
 * 
 */
package com.nagarro.login.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nagarro.login.pojo.User;

/**
 * @author kritikasingh02
 *
 */
@Repository
public interface UserDao extends JpaRepository<User, Integer>{
	
	public Optional<User> findByEmail(String email);
	public Boolean existsByEmail(String email);

}
