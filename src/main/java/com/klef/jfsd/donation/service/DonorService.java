package com.klef.jfsd.donation.service;

import java.util.List;

import com.klef.jfsd.donation.model.Donor;

//import com.razorpay.Order;

public interface DonorService 
{
	public String DonorRegistration(Donor d);
	public Donor checkdonorlogin(String email,String password);
	public Donor displayDonorByID(int did);
	public String UpdateDonorProfile(Donor d);
	

}
