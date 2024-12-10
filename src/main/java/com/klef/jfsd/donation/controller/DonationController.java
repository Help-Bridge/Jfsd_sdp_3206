package com.klef.jfsd.donation.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.klef.jfsd.donation.model.Donation;
import com.klef.jfsd.donation.model.Donor;
import com.klef.jfsd.donation.model.Recipient;
import com.klef.jfsd.donation.repository.DonationRepository;
import com.klef.jfsd.donation.service.DonationService;

import jakarta.servlet.http.HttpSession;

@Controller
public class DonationController {

    @Autowired
    private DonationService donationService;
    
    @Autowired
    private DonationRepository donationRepository;
    
    
    @Autowired
    private HttpSession session;
    

    @GetMapping("donations")
    public String showDonationForm(Model model) {
        model.addAttribute("donation", new Donation());
        return "donationform";
    }

    @PostMapping("/donations")
    public String submitDonation(@ModelAttribute Donation donation) {
        donationService.saveDonation(donation);
        return "donationSuccess";  // You can show a success page or redirect
    }
    
    

    @RequestMapping("/mydonations")
    public String getDonations(HttpSession session, Model model) {
    	Donor d = (Donor) session.getAttribute("donor");
        if (d == null) {
            return "redirect:/login"; // Redirect to login if donorId doesn't exist
        }
        long donorId =(long) d.getId();
        List<Donation> donations = donationService.getDonationsByDonorId(donorId);
        model.addAttribute("donationList", donations);
        return "donationList"; // Return the view name
    }
    
       
    
    
    @GetMapping("/viewDonations")
    public String viewDonations(Model model) {
        List<Donation> donationList = donationRepository.findAll();
        model.addAttribute("donationList", donationList);
        return "viewdonations"; // JSP file
    }
    
    
    @GetMapping("/updatestatusofdonation")
    public String updateDonationStatus(@RequestParam("id") Long id, @RequestParam("status") String status) {
    	 Recipient recipient = (Recipient) session.getAttribute("recipient");

    	    if (recipient == null) {
    	        // Handle the case where the recipient is not found in session (optional)
    	        return "redirect:/login";  // Redirect to the login page or show an error message
    	    }

    	    Long reqId = (long)recipient.getId();
    	    String dest=recipient.getLocation();
        donationRepository.updateDonationStatusAndRequestedId(status,reqId ,dest,id);
        return "redirect:/viewDonations"; // Redirect back to the donation list page
    }
    
    
    
    
//    @RequestMapping("/myrequesteddonations")
//    public String getDonationsByRequestedId(HttpSession session, Model model) {
//        // Assuming that the recipient is stored in the session
//        Recipient recipient = (Recipient) session.getAttribute("recipient");
//
//        if (recipient == null) {
//            return "redirect:/login"; // Redirect to login if recipient is not found in session
//        }
//
//        Long requestedId = (long) recipient.getId();
//        // Call the service to get donations by requestedId and status "Requested"
//        List<Donation> donations = donationService.getDonationsByRequestedIdAndStatus(requestedId);
//        model.addAttribute("donationList", donations);
//        return "myrequestlist"; // Return the view name
//    }
    @RequestMapping("/myrequesteddonations")
    public String getDonationsByRequestedId(HttpSession session, Model model) {
        // Assuming that the recipient is stored in the session
        Recipient recipient = (Recipient) session.getAttribute("recipient");

        if (recipient == null) {
            return "redirect:/login"; // Redirect to login if recipient is not found in session
        }

        Long requestedId = (long) recipient.getId();
        // Define the statuses to filter donations
        List<String> statuses = Arrays.asList("Requested", "OnTheWay", "Donated");

        // Call the service to get donations by requestedId and statuses
        List<Donation> donations = donationService.getDonationsByRequestedIdAndStatuses(requestedId, statuses);
        model.addAttribute("donationList", donations);
        return "myrequestlist"; // Return the view name
    }

    
    
    
    @GetMapping("/viewlcDonations")
    public String viewlcDonations(Model model) {
        List<Donation> donationList = donationRepository.findAll();
        model.addAttribute("donationList", donationList);
        return "lcrequestlist"; // JSP file
    }
    
    
    @GetMapping("/updatelcofdonation")
    public String updatelcDonationStatus(@RequestParam("id") Long id, @RequestParam("status") String status) {
        donationRepository.updatelcStatus(id,status);
        return "redirect:/viewlcDonations"; // Redirect back to the donation list page
    }
    
    
    
    @GetMapping("/lchistory")
    public String lchistory(Model model) {
        List<Donation> donationList = donationRepository.findAll();
        model.addAttribute("donationList", donationList);
        return "lchistory"; 
    
}
}
