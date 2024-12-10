package com.klef.jfsd.donation.service;

import com.klef.jfsd.donation.model.Recipient;

public interface RecipientService 
{
	public String RecipientRegistration(Recipient r);
	public Recipient checkerecipientlogin(String remail, String rpwd);
	public Recipient displayRecipientByID(int rid);
	public String UpdateRecipientProfile(Recipient recipient);

}
