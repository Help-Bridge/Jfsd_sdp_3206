<%@page import="com.klef.jfsd.donation.model.Donor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 Donor d= (Donor)session.getAttribute("donor"); 
 if(d==null)
 {
     response.sendRedirect("donorsessionexpiry.jsp");
     return;
 }
%> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Donor Profile - SDP Project</title>
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
    <!-- Sidebar Navbar -->
    
        <%@include file="donernav.jsp" %>
    

    <!-- Main Content -->
    <div class="content">
        <div class="form-container">
            <h3><u>Update Profile</u></h3>
            <form method="post" action="updatedonorprofile">
                <table>
                    <tr>
                        <td><label for="did">Donor ID</label></td>
                        <td><input type="number" id="did" name="did" readonly value="<%= d.getId() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="name">Enter Name</label></td>
                        <td><input type="text" id="name" name="name" value="<%=d.getName() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="gender" value="MALE" <%= d.getGender().equals("MALE") ? "checked" : "" %> required/>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="gender" value="FEMALE" <%= d.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="gender" value="OTHERS" <%= d.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                            <label for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="dob">Enter Date of Birth</label></td>
                        <td><input type="date" id="dob" name="dob" value="<%= d.getDateofbirth() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="email">Enter Email ID</label></td>
                        <td><input type="email" id="email" name="email" readonly value="<%= d.getEmail() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="pwd">Enter Password</label></td>
                        <td><input type="password" id="pwd" name="pwd" value="<%=d.getPassword() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="contact">Enter Contact</label></td>
                        <td><input type="tel" id="contact" name="contact" value="<%=d.getContact() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="address">Enter Address</label></td>
                        <td><textarea id="address" name="address" required><%=d.getAddress() %></textarea></td>
                    </tr>
                </table>
                <div class="button-container">
                    <input type="submit" value="Update"/>
                    <input type="reset" value="Reset"/>
                </div>
            </form>
        </div>
    </div>


</body>
</html>