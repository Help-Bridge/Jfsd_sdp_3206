 package com.klef.jfsd.donation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.donation.model.Admin;
import com.klef.jfsd.donation.model.Donor;
import com.klef.jfsd.donation.model.Logistic;
import com.klef.jfsd.donation.model.Recipient;
import com.klef.jfsd.donation.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController
{
	 @Autowired 
	 private AdminService adminService; 
	   
	 
	 @GetMapping("/")
	  public ModelAndView home()
	  {
	    ModelAndView mv= new ModelAndView();
	    mv.setViewName("index");
	    return mv;
	  }
	 
	 @GetMapping("adminhome")
     public ModelAndView adminhome()
        {
          ModelAndView mv = new ModelAndView();
          mv.setViewName("adminhome");
          return mv;
        }
	 
	 @GetMapping("adminlogin") 
	 public ModelAndView adminlogin() 
	 { 
	   ModelAndView mv = new ModelAndView(); 
	   mv.setViewName("adminlogin"); 
	   return mv; 
	 } 
	 
	 
	 @PostMapping("checkadminlogin") 
     //@ResponseBody 
     public ModelAndView checkadminlogin(HttpServletRequest request) 
     { 
      ModelAndView mv = new ModelAndView(); 
       
     String auname = request.getParameter("auname"); 
     String apwd = request.getParameter("apwd"); 
       
     Admin admin = adminService.checkadminlogin(auname, apwd); 
      
     if(admin!=null) 
     { 
      //return "Admin Login Success"; 
      mv.setViewName("adminhome"); 
      
     } 
     else 
     { 
      //return "Admin Login Fail"; 
      mv.setViewName("adminloginfail"); 
      mv.addObject("message","Login Failed"); 
     }     
     return mv;       
     } 
	 
	 @GetMapping("adminlogout") 
     public ModelAndView adminlogout() 
     { 
       ModelAndView mv = new ModelAndView(); 
       mv.setViewName("adminlogin"); 
       return mv; 
     } 
	 
	 @GetMapping("donorreg")
		public ModelAndView donorreg()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("donorreg");
			return mv;
		}
	  
	  @PostMapping("adddonor")
		public ModelAndView adddonor(HttpServletRequest request) {
		    String name = request.getParameter("name");
		    String gender = request.getParameter("gender");
		    String dateofbirth = request.getParameter("dob");
		    String address = request.getParameter("address");
		    String email = request.getParameter("email");
		    String pwd=request.getParameter("pwd");
		    String contact = request.getParameter("contact");
		    String status = "Registered";
		 
		    Donor d = new Donor();
		    d.setName(name);
		    d.setGender(gender);
		    d.setDateofbirth(dateofbirth);
		    d.setAddress(address);
		    d.setEmail(email);
		    d.setPassword(pwd);
		    d.setContact(contact);
		    d.setStatus(status);
		    
		    String msg = adminService.DonorRegistration(d);
		    ModelAndView mv = new ModelAndView("regsuccessofdonor");
		    mv.addObject("message", msg);
		    
		    return mv;
		}
	 
	  
	  @GetMapping("viewalldonors")
	     public ModelAndView viewAllDonors()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Donor> donorlist = adminService.ViewAllDonors();
	       mv.setViewName("viewalldonors");
	       
	       mv.addObject("donorlist",donorlist);
	       System.out.println(donorlist);
//	       long count= adminService.donorcount();
//	       mv.addObject("count", count);
	       return mv;
	     }
	  
	  
	  @GetMapping("updatedonorstatus")
	     public ModelAndView updatedonorstatus()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Donor> donorlist = adminService.ViewAllDonors();
	       mv.setViewName("updatedonorstatus");
	       mv.addObject("donorlist",donorlist);
	       return mv;
	     }
	     
	     @GetMapping("updatestatusofdonor")
	     public String updatestatusofdonor(@RequestParam("id") int did,@RequestParam("status") String status)
	     {
	      adminService.updatedonorstatus(status, did);
	      return "redirect:/updatedonorstatus";
	       
	     }
	  
	  
	  @GetMapping("deletedonor")
	     public ModelAndView deletedonor()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Donor> donorlist = adminService.ViewAllDonors();
	       mv.setViewName("deletedonor");
	       mv.addObject("donorlist",donorlist);
	       return mv;
	     }
	     
	  
	    @GetMapping("/donordelete")
	    public String deleteDonor(@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
	        boolean isDeleted = adminService.deleteDonorById(id); // Assuming deleteDonorById returns boolean
	        if (isDeleted) {
	            redirectAttributes.addFlashAttribute("message", "Donor deleted successfully!");
	        } else {
	            redirectAttributes.addFlashAttribute("error", "Failed to delete donor.");
	        }
	        return "redirect:/deletedonor";
	    }
	  
//	    @GetMapping("donordelete")
//	    public String deleteoperationofdonor(@RequestParam("id") int did)
//	    {
//	    	adminService.deletedonor(did);
//	    	return "redirect:/deletedonor"; // redirected to specific path
//	    }
	     
	    
	    
	    
	    
	    
	    
	    @GetMapping("recipientreg")
	 	public ModelAndView recipientreg()
	 	{
	 		ModelAndView mv = new ModelAndView();
	 		mv.setViewName("recipientreg");
	 		return mv;
	 	}	 	
	 	
	 	@PostMapping("addrecipient")
	 	public ModelAndView addrecipient(HttpServletRequest request)
	 	   {
	 	    String name = request.getParameter("rname");
	 	    String gender = request.getParameter("rgender");
	 	    String dob = request.getParameter("rdob");
	 	    String location = request.getParameter("rlocation");
	 	    String email = request.getParameter("remail");
	 	    String password = request.getParameter("rpwd");
	 	    String contact = request.getParameter("rcontact");
	 	    String status = "Registered";
	 	    
	 	    Recipient recipient = new Recipient();
	 	    recipient.setName(name);
	 	    recipient.setGender(gender);
	 	    recipient.setDateofbirth(dob);
	 	    recipient.setLocation(location);
	 	    recipient.setEmail(email);
	 	    recipient.setPassword(password);
	 	    recipient.setContact(contact);
	 	    recipient.setStatus(status);
	 	      
	 	      String msg = adminService.RecipientRegistration(recipient);
	 	      
	 	      ModelAndView mv = new ModelAndView("regsuccessofrecipient");
	 	      mv.addObject("message", msg);
	 	    
	 	      return mv;

	 	   }  
 	
	 	
	 	@GetMapping("viewallrecipients")
	     public ModelAndView viewallrecipients()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Recipient> recipientlist = adminService.viewAllRecipients();
	       mv.setViewName("viewallrecipients");
	       mv.addObject("recipientlist",recipientlist);
	       
	       return mv;
	     }
	 	
	 	
	 	@GetMapping("updaterecipientstatus")
	     public ModelAndView updaterecipientstatus()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Recipient> recipientlist = adminService.viewAllRecipients();
	       mv.setViewName("updaterecipientstatus");
	       mv.addObject("recipientlist",recipientlist);
	       return mv;
	     }
	     
	     @GetMapping("updatestatus")
	     public String updatestatus(@RequestParam("id") int rid,@RequestParam("status") String status)
	     {
	      adminService.updaterecipientstatus(status, rid);
	      return "redirect:/updaterecipientstatus";
	       
	     }
	     
	 	
	 	@GetMapping("deleterecipient")
	     public ModelAndView deleterecipient()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Recipient> recipientlist = adminService.viewAllRecipients();
	       mv.setViewName("deleterecipient");
	       mv.addObject("recipientlist",recipientlist);
	       return mv;
	     }
	     
	 	@GetMapping("recipientdelete")
	     public String deleteoperationofrecipient(@RequestParam("id") int rid) {
	    	 adminService.deleterecipient(rid);
	    	 return "redirect:/deleterecipient";         
	     }
	     
	  
	  //logistic
	 	@GetMapping("logisticreg")
	    public ModelAndView logisticreg() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("logisticreg");
	        return mv;
	    }

	 	@PostMapping("addlogistic")
	 	public ModelAndView addlogistic(HttpServletRequest request) {
	 	    // Retrieve parameters from the form
	 	    String name = request.getParameter("name");
	 	    String email = request.getParameter("email");
	 	    String contact = request.getParameter("contact");
	 	    String gender = request.getParameter("gender");
	 	    String dob = request.getParameter("dob");
	 	    String pwd = request.getParameter("pwd");
	 	    String location = request.getParameter("location");
	 	    String status = "Registered";

	 	    // Create a Logistic object and set its fields
	 	    Logistic logistic = new Logistic();
	 	    logistic.setName(name);
	 	    logistic.setEmail(email);
	 	    logistic.setContact(contact);
	 	    logistic.setGender(gender);  // Add gender
	 	    logistic.setDateofbirth(dob);        // Add date of birth
	 	    logistic.setPassword(pwd);   // Add password
	 	    logistic.setLocation(location); // Add location
	 	    logistic.setStatus(status);

	 	    // Call service layer for registration logic
	 	    String msg = adminService.LogisticRegistration(logistic);

	 	    // Create ModelAndView to return the registration success view
	 	    ModelAndView mv = new ModelAndView("regsuccessoflogistic");
	 	    mv.addObject("message", msg);
	 	    return mv;
	 	}


	    @GetMapping("viewalllogistics")
	    public ModelAndView viewAllLogistics() {
	        ModelAndView mv = new ModelAndView();
	        List<Logistic> logisticList = adminService.viewAllLogistics();
	        mv.setViewName("viewalllogistics");
	        mv.addObject("logisticList", logisticList);
	        return mv;
	    }

	    @GetMapping("updatelogisticstatus")
	    public ModelAndView updatelogisticstatus() {
	        ModelAndView mv = new ModelAndView();
	        List<Logistic> logisticList = adminService.viewAllLogistics();
	        mv.setViewName("updatelogisticstatus");
	        mv.addObject("logisticList", logisticList);
	        return mv;
	    }

	    @GetMapping("updatestatusoflogistic")
	    public String updatestatusoflogistic(@RequestParam("id") int lcId, @RequestParam("status") String status) {
	        adminService.updatelogisticstatus(status, lcId);
	        return "redirect:/updatelogisticstatus";
	    }

	    @GetMapping("deletelogistic")
	    public ModelAndView deletelogistic() {
	        ModelAndView mv = new ModelAndView();
	        List<Logistic> logisticList = adminService.viewAllLogistics();
	        mv.setViewName("deletelogistic");
	        mv.addObject("logisticList", logisticList);
	        return mv;
	    }

	    @GetMapping("logisticdelete")
	    public String deleteoperationoflogistic(@RequestParam("id") int lid) {
	        adminService.deletelogistic(lid);
	        return "redirect:/deletelogistic";
     }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    //update password
	    @GetMapping("adminchangepassword")
	    public ModelAndView adminChangePassword() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("adminchangepassword"); // JSP/HTML page for password change
	        return mv;
	    }

	    @PostMapping("updateadminpassword")
	    public ModelAndView updateAdminPassword(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView();
	        String username = "admin";
	        String oldPassword = request.getParameter("oldpassword");
	        String newPassword = request.getParameter("newpassword");

	        boolean isUpdated = adminService.changeAdminPassword(username, oldPassword, newPassword);

	        if (isUpdated) {
	            mv.setViewName("passwordchangesuccess");
	            mv.addObject("message", "Password changed successfully.");
	        } else {
	            mv.setViewName("adminchangepassword");
	            mv.addObject("message", "Invalid username or old password. Please try again.");
	        }

	        return mv;
	    }
}
