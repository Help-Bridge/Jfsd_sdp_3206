<%@page import="com.klef.jfsd.donation.model.Recipient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Recipient recipient = (Recipient) session.getAttribute("recipient");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Recipient Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
     <style>
        /* Reset and font styles */
        body, ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        body {
            font-family: Arial, sans-serif;
        }

        /* Navbar styles */
       

       
        /* Dropdown styles */
        .dropdown a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            display: inline-block;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
        }

        .dropdown-menu {
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #444;
            display: none;
            min-width: 150px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .dropdown-menu li {
            border-bottom: 1px solid #555;
        }

        .dropdown-menu li:last-child {
            border-bottom: none;
        }

        .dropdown-menu a {
            color: white;
            text-decoration: none;
            padding: 10px;
            display: block;
        }

        .dropdown-menu a:hover {
            background-color: #555;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .navbar-menu {
                flex-direction: column;
                gap: 10px;
            }

            .dropdown-menu {
                position: static;
                box-shadow: none;
            }
        }

        /* Logo Styles */
        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 40px;
            margin-right: 10px;
        }

        .logo a {
            color: #2c3e50;
            text-decoration: none;
            font-size: 1.5rem;
            font-weight: bold;
        }

        /* Profile content styling */
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height for vertical centering */
            background-color: #f7f9fc;
        }

        .form-container {
            width: 100%;
            max-width: 500px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            text-align: center;
            color: #2c3e50;
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        h3 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
        }

        td {
            padding: 10px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"],
        input[type="tel"],
        input[type="password"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .button-container {
            text-align: center;
        }

        input[type="submit"],
        input[type="reset"] {
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin: 5px;
            transition: background 0.3s;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #2d7aa8;
        }

        .contact-us {
            position: absolute;
            bottom: 20px;
            right: 20px;
            display: flex;
            align-items: center;
            background-color: #ffffff;
            padding: 10px 20px;
            border-radius: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            cursor: pointer;
            transition: box-shadow 0.3s;
            color: #333;
            font-weight: bold;
        }

        .contact-us img {
            border-radius: 50%;
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        .contact-us:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.25);
        }

    </style>
</head>
<body>
<%@include file="recipnav.jsp" %>

    <!-- Main Content -->
    <div class="content">
        <h4 align="center">
            <c:out value="${message}"></c:out>
        </h4>

        
        <div class="form-container">
        <h3><u>Update Recipient Profile</u></h3>
            <form method="post" action="updaterecipientprofile">
                <table>
                    <tr>
                        <td><label for="rid">Recipient ID</label></td>
                        <td><input type="number" id="rid" name="rid" readonly value="<%= recipient.getId() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="rname">Enter Name</label></td>
                        <td><input type="text" id="rname" name="rname" value="<%= recipient.getName() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="rgender" value="MALE" <%= recipient.getGender().equals("MALE") ? "checked" : "" %> required/>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="rgender" value="FEMALE" <%= recipient.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="rgender" value="OTHERS" <%= recipient.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                            <label for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="rdob">Enter Date of Birth</label></td>
                        <td><input type="date" id="rdob" name="rdob" value="<%= recipient.getDateofbirth() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="rlocation">Enter Location</label></td>
                        <td><input type="text" id="rlocation" name="rlocation" value="<%= recipient.getLocation() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="remail">Enter Email ID</label></td>
                        <td><input type="email" id="remail" name="remail" readonly value="<%= recipient.getEmail() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="rpwd">Enter Password</label></td>
                        <td><input type="password" id="rpwd" name="rpwd" value="<%= recipient.getPassword() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="rcontact">Enter Contact</label></td>
                        <td><input type="tel" id="rcontact" name="rcontact" value="<%= recipient.getContact() %>" required/></td>
                    </tr>
                </table>
                <div class="button-container">
                    <input type="submit" value="Update" />
                    <input type="reset" value="Clear" />
                </div>
            </form>
        </div>
    </div>

   </body>
   </html>