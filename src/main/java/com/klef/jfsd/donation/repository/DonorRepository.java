package com.klef.jfsd.donation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.donation.model.Donor;

import jakarta.transaction.Transactional;

@Repository
public interface DonorRepository extends JpaRepository<Donor, Integer> 
{
	@Query("select d from Donor d where d.email=?1 and d.password=?2")
	public Donor checkdonorlogin(String email, String password);
		 
	@Query("update Donor d set d.status=?1 where d.id=?2")
	@Modifying  // DML
	@Transactional  // to enable auto commit
	public int updatedonorstatus(String status, int did);

}
