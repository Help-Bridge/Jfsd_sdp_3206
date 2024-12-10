package com.klef.jfsd.donation.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.klef.jfsd.donation.model.Donor;
import com.klef.jfsd.donation.model.Orders;
import com.klef.jfsd.donation.service.OrderService;
import com.razorpay.RazorpayException;

import jakarta.servlet.http.HttpSession;


@Controller
public class OrdersController {
	
	@Autowired
	private OrderService orderService;

	@GetMapping("orders")
	public String ordersPage() {
		return "orders";
	}
	
	@PostMapping(value = "createOrder", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Orders> createOrder(@RequestBody Orders orders) throws RazorpayException{
		Orders razorpayOrder = orderService.createOrder(orders);
		return new ResponseEntity<>(razorpayOrder,HttpStatus.CREATED);
	}
	
	@PostMapping("/paymentCallback")
	public String paymentCallback(@RequestParam Map<String, String> response) {
		 	orderService.updateStatus(response);
		 	return "success";
		
	}
	
	
	
	
	@GetMapping("/displayOrders")
    public String displayOrders(HttpSession session, Model model) {
		Donor d = (Donor) session.getAttribute("donor");
        if (d == null) {
            return "redirect:/login"; // Redirect to login if donorId doesn't exist
        }
        Integer donerId = d.getId();
        List<Orders> orders = orderService.getOrdersByDonerId(donerId);
        model.addAttribute("orders", orders);
        return "displayOrders";
    }
	
	
	
}