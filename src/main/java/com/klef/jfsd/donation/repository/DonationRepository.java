package com.klef.jfsd.donation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.donation.model.Donation;

import jakarta.transaction.Transactional;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {
    // JpaRepository provides built-in methods like save(), findById(), delete(), etc.
	

	    List<Donation> findByDonorId(Long donorId); // Custom query to find donations by donorId
	    
	    
	    List<Donation> findByRequestedIdAndStatus(Long requestedId, String status);
	    List<Donation> findByRequestedIdAndStatusIn(Long requestedId, List<String> statuses);

	    
//	    @Query("update Donation d set d.status=?1 where d.id=?2")
//	    @Modifying  // DML operation
//	    @Transactional  // Enables auto-commit
//	    public int updatedonationstatus(String status, Long donationId);
	    
	    
	    @Query("update Donation d set d.status = ?1, d.requestedId = ?2,d.destination = ?3 where d.id = ?4")
	    @Modifying  // DML operation
	    @Transactional  // Enables auto-commit
	    public int updateDonationStatusAndRequestedId(String status, Long requestedId,String dist, Long donationId);

	    
	    @Query("update Donation d set d.status = ?2 where d.id = ?1")
	    @Modifying  // DML operation
	    @Transactional  // Enables auto-commit
	    public int updatelcStatus(Long donationId,String status );
}
