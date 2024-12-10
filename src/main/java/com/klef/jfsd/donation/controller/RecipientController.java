package com.klef.jfsd.donation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.donation.model.Recipient;
import com.klef.jfsd.donation.service.RecipientService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class RecipientController
{
	@Autowired
	private RecipientService recipientService;
	
	@GetMapping("pregrecipient")
	public ModelAndView regrecipient()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("precipientreg");
		return mv;
	}
	
	@GetMapping("recipientlogin1")
	public ModelAndView recipientlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recipientlogin");
		return mv;
	}
	
	
	@PostMapping("insertrecipient")
	public ModelAndView insertrecipient(HttpServletRequest request)
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
	      
	      String msg = recipientService.RecipientRegistration(recipient);
	      
	      ModelAndView mv = new ModelAndView("regsuccess");
	      mv.addObject("message", msg);
	    
	      return mv;

	   }
	
	@PostMapping("checkrecipientlogin")
	public ModelAndView checkrecipientlogin(HttpServletRequest request)
	   {
	     ModelAndView mv = new ModelAndView();
	     
	     String remail = request.getParameter("remail");
	     String rpwd = request.getParameter("rpwd");
	     
	     
	     Recipient recipient =  recipientService.checkerecipientlogin(remail, rpwd);
	     
	     if(recipient!=null && ("Accepted").equalsIgnoreCase(recipient.getStatus()) )
	     {
	    	 HttpSession  session = request.getSession();
	    	 session.setAttribute("recipient",recipient); 
	    	 
	    	 
	      mv.setViewName("recipienthome");
	      
	     }
	     else if(recipient!=null && ("Rejected").equalsIgnoreCase(recipient.getStatus()))
	     {
	    	 mv.setViewName("recipientlogin");
	    	 mv.addObject("message", "Id Rejected");
	     }
	     else if(recipient!=null && ("Registered").equalsIgnoreCase(recipient.getStatus()))
	     {
	    	 mv.setViewName("recipientlogin");
	    	 mv.addObject("message", "Pending... Try after sometime.");
	     }
	     else
	     {
	       mv.setViewName("recipientlogin");
	       mv.addObject("message", "Login Failed");
	     } 
	       return mv;
	   }
	
	
	
	@GetMapping("recipientcontactus")
	public ModelAndView recipientcontactus()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recipientcontactus");
		return mv;
	}
	@GetMapping("recipientprofile")
	public ModelAndView recipientprofile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("recipientprofile");
		return mv;
	}
	
	 @GetMapping("recipienthome")
     public ModelAndView recipienthome()
     {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("recipienthome");
       return mv;
     }
	 
	 @GetMapping("recipientlogout")
     public ModelAndView recipientlogout(HttpServletRequest request)
     {
		 HttpSession session = request.getSession();
		 
		 session.removeAttribute("recipient");  
		 
		 // session.invalidate();  // removes all session attributes
		 
       ModelAndView mv = new ModelAndView();
       mv.setViewName("recipientlogin");
       return mv;
     }
	 
	 @GetMapping("updaterecipient")
	 public ModelAndView updaterecipient()
	 {
		 ModelAndView mv = new ModelAndView();
		 mv.setViewName("updaterecipient");
		 return mv;
	 }
	 
	 @PostMapping("updaterecipientprofile")
	   public ModelAndView updaterecipientprofile(HttpServletRequest request)
	   {
	     ModelAndView mv = new ModelAndView();
	     
	    try
	    {
	      int id = Integer.parseInt(request.getParameter("rid"));
	      String name = request.getParameter("rname");
	      String gender = request.getParameter("rgender");
	      String dob = request.getParameter("rdob");
	      String password = request.getParameter("rpwd");
	      String location = request.getParameter("rlocation");
	      String contact = request.getParameter("rcontact");
	      
	      Recipient recipient = new Recipient();
	      
	      recipient.setId(id);
	      recipient.setName(name);
	      recipient.setGender(gender);
	      recipient.setDateofbirth(dob);
	      recipient.setPassword(password);
	      recipient.setLocation(location);
	      recipient.setContact(contact);
	        
	      String msg = recipientService.UpdateRecipientProfile(recipient);
	        
	      Recipient r = recipientService.displayRecipientByID(id);
	        
	         HttpSession session = request.getSession();
	         session.setAttribute("recipient",r); 
	       
	       
	        mv.setViewName("updatesuccess");
	        mv.addObject("message", msg);
	      
	    }
	    catch(Exception e)
	    {
	      mv.setViewName("updateerror");
	      mv.addObject("message", e);
	    }
	      return mv;
	   }
	 
	 @GetMapping("recipientsessionexpiry")
	 public ModelAndView recipientsessionexpiry()
	 {
		 ModelAndView mv = new ModelAndView();
		 mv.setViewName("recipientsessionexpiry");
		 return mv;
	 }
	

}
