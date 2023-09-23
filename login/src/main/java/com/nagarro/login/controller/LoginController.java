/**
 * 
 */
package com.nagarro.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nagarro.login.dto.AuthRequest;
import com.nagarro.login.pojo.User;
import com.nagarro.login.service.UserService;

/**
 * @author kritikasingh02
 *
 */
@RestController
@RequestMapping("/user")
public class LoginController {

	@Autowired
	private UserService service;

	@Autowired
	private AuthenticationManager authenticationManager;
	
	private Logger log = LoggerFactory.getLogger(LoginController.class);

	@PostMapping("/signup")
	public ResponseEntity<String> register(@RequestBody User user) {
		String loginUserEmail = service.register(user);
		if (loginUserEmail != null) {
			log.info("sign up successfull");
			return new ResponseEntity<String>(loginUserEmail + " sign Up successful.", HttpStatus.OK);
		}
		log.info("sign up fail because of same email or other issues");
		return new ResponseEntity<String>("Sign Up fail.", HttpStatus.BAD_REQUEST);
	}

	@PostMapping("/token")
	public ResponseEntity<String> getToken(@RequestBody AuthRequest request) {
		org.springframework.security.core.Authentication authenticate = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
		if(authenticate.isAuthenticated()) {
			String token = service.generateToken(request.getEmail());
			log.info("authentication successfull and token generated");
			return ResponseEntity.ok(token);
		}else {
			log.info("authentication fail because of invalid credencials");
			return new ResponseEntity<String>("authentication fail",HttpStatus.BAD_REQUEST);
		}
		
		
	}

	@GetMapping("/validate")
	public ResponseEntity<String> validateToken(@RequestParam("token") String token) {
		try {
			service.validateToken(token);
			log.info("Login successfull due to valid token");
			return new ResponseEntity<String>("Valid Token", HttpStatus.OK);
		} catch (Exception e) {
			log.info("Login fail due invalid token");
			return new ResponseEntity<String>("Invalid Token", HttpStatus.BAD_REQUEST);
		}
	}

}
