package com.klef.jfsd.donation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.donation.model.Donor;
import com.klef.jfsd.donation.repository.DonorRepository;

@Service
public class DonorServiceImpl implements DonorService 
{
    @Autowired
	private DonorRepository donorRepository;
	@Override
	public String DonorRegistration(Donor d) 
	{
		donorRepository.save(d);
		return "Donor Registered Successfully";
	}

	@Override
	public Donor checkdonorlogin(String email, String password) 
	{
		return donorRepository.checkdonorlogin(email,password);
	}

	@Override
	public Donor displayDonorByID(int did)
	{
		return donorRepository.findById(did).get();
	}

	@Override
	public String UpdateDonorProfile(Donor d)
	{
		Donor donor =donorRepository.findById(d.getId()).get();
		donor.setAddress(d.getAddress());
		donor.setContact(d.getContact());
		donor.setDateofbirth(d.getDateofbirth());
		donor.setEmail(d.getEmail());
		donor.setGender(d.getGender());
		donor.setName(d.getName());
		donor.setPassword(d.getPassword());
		donorRepository.save(donor);
		return "Donor Updated Successfully";
	}

	
	

}
