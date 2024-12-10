package com.klef.jfsd.donation.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "donor_table")
public class Donor 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="d_id")
	private int id;
	@Column(name = "d_name",length = 50,nullable = false)
	private String name;
	@Column(name="d_gender",length = 20,nullable = false)
	private String gender;
	@Column(name="d_email",length = 50,nullable = false,unique = true)
	private String email;
	@Column(name="d_dob",nullable = false,length = 20)
	private String dateofbirth;
	@Column(name="d_contact",nullable = false,unique = true,length = 20)
	private String contact;
	@Column(name="d_address",nullable = false,length = 50)
	private String address;
	@Column(name="d_pwd",nullable = false,length = 20)
	private String password;
	@Column(name="d_status",nullable = false,length = 20)
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
