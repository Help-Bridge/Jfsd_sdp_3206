<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Donor</title>
    <style>
        /* Form container styling */
        .form-container {
            width: 60%;
            max-width: 600px;
            background-color: #ffffff;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            margin: 0 auto; /* This centers the form horizontally */
            margin-top: 50px; /* Add space at the top */
            position: absolute; /* Allows vertical centering */
            top: 50%; /* Position form at the center of the screen */
            left: 50%; /* Position form at the center horizontally */
            transform: translate(-50%, -50%); /* Corrects the position for exact centering */
        }

        /* Heading styling with blue underline */
        h3 {
            text-align: center;
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 15px;
            position: relative;
            display: inline-block;
        }

        h3::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 3px;
            background-color: #3498db;
            bottom: -5px;
            left: 0;
        }

        /* Form styling */
        form {
            width: 100%;
            display: flex;
            flex-direction: column;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 8px;
            text-align: left;
            font-size: 14px;
        }

        input[type="text"], input[type="email"], input[type="password"], input[type="date"], input[type="number"], textarea {
            width: 100%;
            padding: 5px;
            margin: 4px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            transition: box-shadow 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="date"]:focus, input[type="number"]:focus, textarea:focus {
            box-shadow: 0 0 8px rgba(52, 152, 219, 1);
            border-color: #3498db;
            outline: none;
        }

        input[type="radio"] {
            margin-right: 6px;
        }

        /* Button container styling */
        .button-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin-top: 15px;
        }

        input[type="submit"], input[type="reset"] {
            background-color: #3498db;
            color: white;
            padding: 8px 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s, box-shadow 0.3s ease-in-out;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #1a252f;
            box-shadow: 0 0 8px rgba(52, 152, 219, 1);
        }

        label {
            font-size: 14px;
            font-weight: bold;
            color: #34495e;
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
    <div class="main-content">
        <div class="form-container" align="center">
            <form method="post" action="adddonor">
                <h3>Add Donor</h3>
                <table>
                    <tr>
                        <td><label for="name">Enter Name</label></td>
                        <td><input type="text" id="name" name="name" required /></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="gender" value="MALE" required />
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="gender" value="FEMALE" required />
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="gender" value="OTHERS" required />
                            <label for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="dob">Enter Date of Birth</label></td>
                        <td><input type="date" id="dob" name="dob" required /></td>
                    </tr>
                    <tr>
                        <td><label for="email">Enter Email ID</label></td>
                        <td><input type="email" id="email" name="email" required /></td>
                    </tr>
                    <tr>
                        <td><label for="pwd">Enter Password</label></td>
                        <td><input type="password" id="pwd" name="pwd" required /></td>
                    </tr>
                    <tr>
                        <td><label for="contact">Enter Contact</label></td>
                        <td><input type="number" id="contact" name="contact" required /></td>
                    </tr>
                    <tr>
                        <td><label for="address">Enter Address</label></td>
                        <td><textarea id="address" name="address" rows="3" required></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Register" />
                            <input type="reset" value="Clear" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <%@include file="adminnavbar.jsp" %>
</body>
</html>
