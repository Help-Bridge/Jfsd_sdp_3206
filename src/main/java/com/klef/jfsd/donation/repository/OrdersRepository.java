package com.klef.jfsd.donation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.donation.model.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer>{

	Orders findByRazorpayOrderId(String razorpayId);
	
	List<Orders> findByDonerId(Integer donerId);
}