<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HelpBridge Navbar</title>
    <link rel="stylesheet" href="nav.css">
</head>
<body>
    <nav class="navbar">
            <nav class="navbar1">
      <div class="logo">
        <img src="images/icon1.jpg" alt="Help Bridge Logo" style="height: 40px; margin-right: 10px; vertical-align: middle;">
        <a href="adminhome" style="color: white;">HelpBridge</a>
      </div>
      </nav>
        <ul class="navbar-menu">
            <li class="dropdown">
                <a href="#">Donor</a>
                <ul class="dropdown-menu">
                    <li><a href="donorreg">Add</a></li>
                    <li><a href="deletedonor">Remove</a></li>
                    <li><a href="updatedonorstatus">Update Status</a></li>
                    <li><a href="viewalldonors">View</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#">Recipient</a>
                <ul class="dropdown-menu">
                    <li><a href="recipientreg">Add</a></li>
                    <li><a href="deleterecipient">Remove</a></li>
                    <li><a href="updaterecipientstatus">Update Status</a></li>
                    <li><a href="viewallrecipients">View</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#">Logistic Coordinator</a>
                <ul class="dropdown-menu">
                    <li><a href="logisticreg">Add</a></li>
                    <li><a href="deletelogistic">Remove</a></li>
                    <li><a href="updatelogisticstatus">Update Status</a></li>
                    <li><a href="viewalllogistics">View</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#">Admin</a>
                <ul class="dropdown-menu">
                    <li><a href="adminchangepassword.jsp">Change Password</a></li>
                    <li><a href="/">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</body>
</html>
