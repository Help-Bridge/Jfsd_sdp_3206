package com.klef.jfsd.donation.service; 
 
import java.util.List; 

 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.klef.jfsd.donation.model.Admin;
import com.klef.jfsd.donation.model.Donor;
import com.klef.jfsd.donation.model.Logistic;
import com.klef.jfsd.donation.model.Recipient;
import com.klef.jfsd.donation.repository.AdminRepository;
import com.klef.jfsd.donation.repository.DonorRepository;
import com.klef.jfsd.donation.repository.LogisticRepository;
import com.klef.jfsd.donation.repository.RecipientRepository;
 
 
@Service 
public class AdminServiceImpl implements AdminService 
{ 
	
 @Autowired 
private DonorRepository donorRepository;	
	
 @Autowired 
 private AdminRepository adminRepository; 
 
 @Autowired
 private RecipientRepository recipientRepository;

 @Autowired
 private LogisticRepository logisticRepository;
 
 @Override 
 public Admin checkadminlogin(String uname, String pwd) 
 { 
   
  return adminRepository.checkadminlogin(uname, pwd); 
 }


@Override
public String DonorRegistration(Donor d) 
{
	donorRepository.save(d);
	return "Donor Registered Successfully";
} 
 
@Override 
public List<Donor> ViewAllDonors()  
{ 
 return donorRepository.findAll(); 
} 
@Override
public String updatedonorstatus(String status, int did)
{
	donorRepository.updatedonorstatus(status, did);
	return "Donor Status Updated Successfully";
}

@Override
public String deletedonor(int did) 
{
	 donorRepository.deleteById(did); 
	 return "Donor Deleted Successfully";
	
}
 







@Override
public String RecipientRegistration(Recipient r)
{
	recipientRepository.save(r);
	return "Recipient Registered Successfully";
}

@Override
public List<Recipient> viewAllRecipients()
{
	return recipientRepository.findAll();
}

@Override
public String deleterecipient(int rid) 
{
	recipientRepository.deleteById(rid);
	return "Recipient Deleted Successfully";
}

@Override
public String updaterecipientstatus(String status, int rid)
{
	recipientRepository.updaterecipientstatus(status, rid);
	return "Recipient Status Updated Successfully";
}





@Override
public String LogisticRegistration(Logistic lc)
{
    logisticRepository.save(lc);
    return "Logistic Registered Successfully";
}

@Override
public List<Logistic> viewAllLogistics()
{
    return logisticRepository.findAll();
}

@Override
public String updatelogisticstatus(String status, int lcId)
{
    logisticRepository.updateLogisticStatus(status, lcId);
    return "Logistic Status Updated Successfully";
}

@Override
public String deletelogistic(int lcId) 
{
    logisticRepository.deleteById(lcId);
    return "Logistic Deleted Successfully";
}




@Override
public boolean changeAdminPassword(String username, String oldPassword, String newPassword) {
    Admin admin = adminRepository.checkadminlogin(username, oldPassword); // Validate old password

    if (admin != null) {
        admin.setPassword(newPassword); // Update password
        adminRepository.save(admin); // Save changes
        return true;
    }
    return false;
}


public boolean deleteDonorById(int id) {
    try {
        donorRepository.deleteById(id); // Adjust based on your persistence setup
        return true;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}


@Override
public boolean deleteRecipientById(int id) {
    try {
        recipientRepository.deleteById(id);
        return true;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

}
	
  
