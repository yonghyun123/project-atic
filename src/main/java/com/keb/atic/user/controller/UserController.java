package com.keb.atic.user.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.keb.atic.user.domain.User;
import com.keb.atic.user.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * create : post
 * read : get
 * update : put
 * delete : delete
 */

@Log4j
@RestController
@RequestMapping("/users/*")
@AllArgsConstructor
public class UserController {
	private UserService service;
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<User> get(@PathVariable("id") String id) throws Exception {
		return service.readUser(id) != null ? new ResponseEntity<User>(service.readUser(id), HttpStatus.OK)
				: new ResponseEntity<User>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
}
