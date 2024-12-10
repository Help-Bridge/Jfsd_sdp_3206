<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.klef.jfsd.donation.model.Donor" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    Donor d = (Donor) session.getAttribute("donor");
    if (d == null) {
        response.sendRedirect("donorsessionexpiry.jsp");
        return ;
    }
%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donation Form</title>
    <style>
        /* Style the form container */
        .form-container {
            width: 60%;
            max-width: 600px;
            background-color: #ffffff;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            margin: 0 auto;
            margin-top: 50px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        /* Style for heading */
        h2 {
            text-align: center;
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 15px;
        }

        /* Form styling */
        form {
            width: 100%;
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #34495e;
            margin-top: 10px;
        }

        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 5px;
            margin: 4px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            transition: box-shadow 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="number"]:focus, textarea:focus {
            box-shadow: 0 0 8px rgba(52, 152, 219, 1);
            border-color: #3498db;
            outline: none;
        }

        button {
            background-color: #3498db;
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 15px;
            transition: background-color 0.3s, box-shadow 0.3s ease-in-out;
        }

        button:hover {
            background-color: #1a252f;
            box-shadow: 0 0 8px rgba(52, 152, 219, 1);
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .form-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Donation Form</h2>
        <form action="<%= request.getContextPath() %>/donations" method="post">
            <label for="donorId">Donor ID:</label>
            <!-- Display the donor ID from session -->
            <input type="text" id="donorId" name="donorId" value="<%= d.getId() %>" readonly placeholder="Donor ID" required><br>

            <label for="product">Product:</label>
            <input type="text" id="product" name="product" value="${donation.product}" placeholder="Enter Product" required><br>

            <label for="count">Count:</label>
            <input type="number" id="count" name="count" value="${donation.count}" placeholder="Enter Count" required><br>

            <label for="location">Location:</label>
            <input type="text" id="location" name="location" value="${donation.location}" placeholder="Enter Location" required><br>

            <label for="description">Description:</label>
            <textarea id="description" name="description" placeholder="Enter Description" required>${donation.description}</textarea><br>

            <!-- Hidden status field with default value of "donated" -->
            <input type="hidden" id="status" name="status" value="Inprogress">

            <button type="submit">Submit Donation</button>
        </form>
    </div>
    <%@include file="donernav.jsp" %>
</body>
</html>
