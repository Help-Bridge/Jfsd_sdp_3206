package com.klef.jfsd.donation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.donation.model.Donation;
import com.klef.jfsd.donation.repository.DonationRepository;

@Service
public class DonationService {

    @Autowired
    private DonationRepository donationRepository;

    public void saveDonation(Donation donation) {
        donationRepository.save(donation);  // Saves donation to the database
    }
    public List<Donation> getDonationsByDonorId(Long donorId) {
        return donationRepository.findByDonorId(donorId); // Assuming you have this method in your repository
    }
    
    public List<Donation> getDonationsByRequestedIdAndStatus(Long requestedId) {
        return donationRepository.findByRequestedIdAndStatus(requestedId, "Requested");
    }
    
    public List<Donation> getDonationsByRequestedIdAndStatuses(Long requestedId, List<String> statuses) {
        return donationRepository.findByRequestedIdAndStatusIn(requestedId, statuses);
    }

    
//    public String updatedonationstatus(String status, Long donationId) {
//        donationRepository.updatedonationstatus(status, donationId);
//        return "Donation Status Updated Successfully";
//    }
}
