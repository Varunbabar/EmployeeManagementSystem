package com.MainApp.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table
@Data
public class User {

	@Id
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private String email;
	@Column
	private boolean status;
	@Column
	private String verificationCode;
}
