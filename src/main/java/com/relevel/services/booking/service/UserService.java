package com.relevel.services.booking.service;


import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.relevel.services.booking.dto.UserDto;
import com.relevel.services.booking.model.User;
import com.relevel.services.booking.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired 
	UserRepository userRepo;
	
	public boolean saveUser(UserDto userDto) {
		if(validateUser(userDto)) {
			User user = new User();
			user.setCity(userDto.getCity());
			user.setEmail(userDto.getEmail());
			user.setName(userDto.getName());
			user.setPassword(userDto.getPassword());
			user.setPhone(userDto.getPhone());
			user.setUserId(userDto.getUserId());
			userRepo.save(user);
			return true;
		}
		return false;
	}
//	authenticaeUser
	public boolean authenticaeUser(UserDto userDto) {
		Iterable<User> temp1 = userRepo.findAll();
	    List<User> result = new ArrayList<User>();
    	temp1.forEach(result::add);
    	for(User user: result) {
    		if(user.getUserId().equals(userDto.getUserId())&&user.getPassword().equals(userDto.getPassword())) {
    			return true;
    		}
    	}
		return false;
	}
	public boolean validateUser(UserDto userDto) {
		if(!isValidEmail(userDto.getEmail())) {
			return false;
		}else if(!checkVal(userDto.getCity())||userDto.getCity().length()>45) {
			return false;
		}else if(!checkVal(userDto.getName())||userDto.getName().length()>20) {
			return false;
		}else if(!checkVal(userDto.getPassword())||userDto.getPassword().length()<5) {
			return false;
		}else if(!checkVal(userDto.getUserId())||userDto.getUserId().length()>4) {
			return false;
		}else if(!checkVal(userDto.getPhone())||userDto.getPhone().length()!=10) {
			return false;
		}
		return true;
	}
	public boolean checkVal(String val) {
		if(val==null||val.isEmpty()) {
			return false;
		}
		return true;
	}
    public static boolean isValidEmail(String email){
	        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
	                            "[a-zA-Z0-9_+&*-]+)*@" +
	                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
	                            "A-Z]{2,7}$";
	                              
	        Pattern pat = Pattern.compile(emailRegex);
	        if (email == null)
	            return false;
	        return pat.matcher(email).matches();
	 }
}

