<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.klef.jfsd.donation.model.Donor"%>
	
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<% 
Donor donor = (Donor) session.getAttribute("donor");
if(donor==null)
{
	response.sendRedirect("sessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Donor Home</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            overflow: hidden;
            font-family: 'Roboto', sans-serif;
        }

        body {
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
        }

        /* Navbar Styling */
        nav {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            z-index: 100;
            flex-shrink: 0; /* Prevents nav from shrinking */
        }

        /* Center Content */
        .center-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            min-height: 0; /* Allows container to shrink if needed */
        }

        /* Card Styling */
        .card {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            padding: 20px;
            text-align: center;
            max-width: 500px;
            width: 90%;
            margin: auto;
        }

        .card h1 {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: clamp(20px, 4vw, 26px); /* Responsive font size */
        }

        .card p {
            font-size: clamp(14px, 3vw, 16px); /* Responsive font size */
            color: #555;
            margin-bottom: 15px;
        }

        /* Button */
        .card button {
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: clamp(14px, 3vw, 16px);
            transition: background 0.3s, transform 0.2s ease-in-out;
        }

        .card button:hover {
            background: linear-gradient(90deg, #2575fc, #6a11cb);
            transform: scale(1.05);
        }

        /* Ensure content stays within viewport on smaller screens */
        @media screen and (max-height: 600px) {
            .card {
                padding: 15px;
            }
            
            .card h1 {
                margin-bottom: 10px;
            }
            
            .card p {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Include Navbar -->
    <nav>
        <%@include file="donernav.jsp" %>
    </nav>

    <!-- Centered Welcome Card -->
    <div class="center-container">
        <div class="card">
			<h3 align="center">Welcome,<%=donor.getName()%></h3>

            <p>Thank you for joining us. Here you can manage your donations, view upcoming campaigns, and make a difference.</p>
            <button onclick="location.href='donate.jsp'">Make a Donation</button>
        </div>
    </div>
</body>
</html>