<%@page import="com.klef.jfsd.donation.model.Donor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
 Donor d = (Donor) session.getAttribute("donor");
 if (d == null) {
     response.sendRedirect("donorsessionexpiry.jsp");
     return;
 }
%>  
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Donor Profile</title>

<style>
    /* Reset and body styling */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }



    /* Profile content styling */
.content {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* Full viewport height to ensure vertical centering */
    width: 100vw; /* Full viewport width for horizontal centering */
    margin: 0; /* Remove margin since centering uses the entire viewport */
    padding: 0; /* Remove any padding for precise alignment */
    background-color: #f7f9fc; /* Optional: Matches the rest of your UI theme */
}


    .profile-card {
        width: 100%;
        max-width: 400px;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        text-align: center;
        color: #2c3e50;
    }

    .profile-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }

    .profile-image {
        width: 100px;
        height: 100px;
        border-radius: 100%;
        border: 4px solid #3498db;
        margin-top: 20px;
    }

    .profile-card h3 {
        font-size: 24px;
        color: #2c3e50;
        margin-top: 20px;
    }

    .profile-info {
        display: flex;
        justify-content: space-between;
        padding: 10px 10px;
        font-size: 14px;
        color: #34495e;
    }

    .profile-info span {
        color: #5d6d7e;
        font-weight: bold;
    }

    .profile-info b {
        color: #2c3e50;
    }

    .button-container a {
        text-decoration: none;
        padding: 10px 18px;
        margin: 0 8px;
        color: #ffffff;
        background-color: #2c3e50;
        border-radius: 4px;
        font-weight: bold;
        transition: background 0.3s;
        font-size: 14px;
    }

    .button-container a:hover {
        background-color: #2d7aa8;
    }
</style>
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="donernav.jsp" />

    <!-- Profile Content -->
    <div class="content">
        <div class="profile-card">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDGQO5-8CPA9Hzl5_wLkAf6VtlMw52q7IwRw&s" alt="Profile Picture" class="profile-image">
            <h3><%= d.getName() %></h3>

            <div class="profile-info"><span>ID:</span> <b><%= d.getId() %></b></div>
            <div class="profile-info"><span>Gender:</span> <b><%= d.getGender() %></b></div>
            <div class="profile-info"><span>Email:</span> <b><%= d.getEmail() %></b></div>
            <div class="profile-info"><span>Date of Birth:</span> <b><%= d.getDateofbirth() %></b></div>
            <div class="profile-info"><span>Contact:</span> <b><%= d.getContact() %></b></div>
            <div class="profile-info"><span>Address:</span> <b><%= d.getAddress() %></b></div>
            <div class="profile-info"><span>Status:</span> <b><%= d.getStatus() %></b></div>

            <div class="button-container">
                <a href="updatedonor">Update Profile</a>
                <a href="#">Change Password</a>
            </div>
        </div>
    </div>
</body>
</html>
