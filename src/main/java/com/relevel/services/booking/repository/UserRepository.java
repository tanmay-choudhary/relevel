package com.relevel.services.booking.repository;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.relevel.services.booking.model.User;


@Repository
public interface UserRepository extends CrudRepository<User,String>{

}
