package com.relevel.services.booking.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.relevel.services.booking.dto.UserDto;
import com.relevel.services.booking.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userServ;
	
	@RequestMapping(value = "/user/registration", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody UserDto userDto) {
		if (userServ.saveUser(userDto)) {
			String resp = "User is registered successfully";
			return ResponseEntity.status(HttpStatus.CREATED).body(resp);
		}
		return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid Input");
	}

	@RequestMapping(value = "/user/login", method = RequestMethod.POST)
	public ResponseEntity<String> login(@RequestBody UserDto userDto) {
		if (userServ.authenticaeUser(userDto)) {
			String resp = "authorized";
			return ResponseEntity.status(HttpStatus.OK).body(resp);
		}
		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("unauthorized");
	}
}
