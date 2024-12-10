package com.klef.jfsd.donation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.donation.model.Recipient;
import com.klef.jfsd.donation.repository.RecipientRepository;

@Service
public class RecipientServiceImpl implements RecipientService
{
	@Autowired
	private RecipientRepository recipientRepository;

	@Override
	public String RecipientRegistration(Recipient r)
	{
		recipientRepository.save(r);
		return "Recipient Registered Successfully";
	}

	@Override
	public Recipient checkerecipientlogin(String remail, String rpwd) 
	{
		return recipientRepository.checkrecipientlogin(remail, rpwd);
	}

	@Override
	public Recipient displayRecipientByID(int rid)
	{
		return recipientRepository.findById(rid).get();
	}

	@Override
	public String UpdateRecipientProfile(Recipient recipient)
	{
		Recipient r = recipientRepository.findById(recipient.getId()).get();
		
		r.setContact(recipient.getContact());
		r.setDateofbirth(recipient.getDateofbirth());
		r.setGender(recipient.getGender());
		r.setLocation(recipient.getLocation());
		r.setName(recipient.getName());
		r.setPassword(recipient.getPassword());
		
		recipientRepository.save(r);
		
		
		return "Recipient Updated Successfully";
	}
	
	
	

}
