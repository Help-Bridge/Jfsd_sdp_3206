package com.klef.jfsd.donation.model;

import jakarta.persistence.*;

@Entity
@Table(name = "donations")
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "donor_id", nullable = false)
    private Long donorId;

    @Column(name = "product", nullable = false)
    private String product;

    @Column(name = "count", nullable = false)
    private int count;

    @Column(name = "location", nullable = false)
    private String location;

    @Column(name = "description", length = 500)
    private String description;

    @Column(name = "status", length = 50)
    private String status;

    @Column(name = "requested_id")
    private Long requestedId;  // Adding requestedId field
    
    @Column(name = "destination", length = 255) // New destination field
    private String destination; // New destination attribute

    // Default constructor
    public Donation() {
    }

    // Parameterized constructor with destination
    public Donation(Long donorId, String product, int count, String location, String description, String status, Long requestedId, String destination) {
        this.donorId = donorId;
        this.product = product;
        this.count = count;
        this.location = location;
        this.description = description;
        this.status = status;
        this.requestedId = requestedId;
        this.destination = destination;  // Initialize destination field
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getDonorId() {
        return donorId;
    }

    public void setDonorId(Long donorId) {
        this.donorId = donorId;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getRequestedId() {
        return requestedId;
    }

    public void setRequestedId(Long requestedId) {
        this.requestedId = requestedId;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    // toString method including destination
    @Override
    public String toString() {
        return "Donation{" +
               "id=" + id +
               ", donorId=" + donorId +
               ", product='" + product + '\'' +
               ", count=" + count +
               ", location='" + location + '\'' +
               ", description='" + description + '\'' +
               ", status='" + status + '\'' +
               ", requestedId=" + requestedId +
               ", destination='" + destination + '\'' +  // Including destination in toString
               '}';
    }
}
