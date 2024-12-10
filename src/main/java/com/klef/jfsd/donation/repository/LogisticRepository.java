package com.klef.jfsd.donation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.donation.model.Logistic;

import jakarta.transaction.Transactional;

@Repository
public interface LogisticRepository extends JpaRepository<Logistic, Integer>
{
   
    @Query("select lc from Logistic lc where lc.email=?1 and lc.password=?2")
    public Logistic checklogisticLogin(String lcEmail, String lcPassword);
    
    // Method to update Logistic Coordinator status
    @Query("update Logistic lc set lc.status=?1 where lc.id=?2")
    @Modifying  // DML
    @Transactional  // To enable auto commit
    public int updateLogisticStatus(String status, int lcId);
}
