package com.klef.jfsd.donation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.donation.model.Recipient;

import jakarta.transaction.Transactional;

@Repository
public interface RecipientRepository extends JpaRepository<Recipient, Integer>
{
	
	@Query("select r from Recipient r where r.email=?1 and r.password=?2")
	public Recipient checkrecipientlogin(String remail, String rpwd);
	
	@Query("update Recipient r set r.status=?1 where r.id=?2")
	@Modifying  // DML
	@Transactional  // to enable auto commit
	public int updaterecipientstatus(String status, int rid);

}
