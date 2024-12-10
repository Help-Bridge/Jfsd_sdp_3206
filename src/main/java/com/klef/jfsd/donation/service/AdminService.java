package com.klef.jfsd.donation.service;

import java.util.List;

import com.klef.jfsd.donation.model.*;

public interface AdminService 
{
	public Admin checkadminlogin(String uname, String pwd);
	
	public String DonorRegistration(Donor d);
	public List<Donor> ViewAllDonors();
	public String updatedonorstatus(String status, int did);
	public String deletedonor(int did);
	
	public String RecipientRegistration(Recipient r);
	public List<Recipient> viewAllRecipients();
	public String updaterecipientstatus(String status, int rid);
	public String deleterecipient(int rid);
	
    public String LogisticRegistration(Logistic lc);
    public List<Logistic> viewAllLogistics();
    public String updatelogisticstatus(String status, int lcId);
    public String deletelogistic(int lcId);
    
    
    public boolean changeAdminPassword(String username, String oldPassword, String newPassword);
    
    
    
    //motify
    boolean deleteDonorById(int id);
    
    boolean deleteRecipientById(int id);
    
    
	
}
