package com.MainApp.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String>{

	Optional<User> findByUsernameAndPassword(String username, String password);
	
	Optional<User> findByVerificationCode(String code);

}
