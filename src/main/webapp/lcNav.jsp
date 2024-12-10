<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logistics Navbar</title>
    <link rel="stylesheet" href="donnav.css">
</head>
<body>
    <nav class="navbar">
                    <nav class="navbar1">
      <div class="logo">
        <img src="images/icon1.jpg" alt="Help Bridge Logo" style="height: 40px; margin-right: 10px; vertical-align: middle;">
        <a href="logistichome" style="color: white;">HelpBridge</a>
      </div>
      </nav>
        <ul class="navbar-menu">
            <li><a href="viewlcDonations">Requests</a></li>
            <li><a href="lchistory">History</a></li>
            <li><a href="#">Profile</a></li>
             <li class="dropdown">
                <a href="#">Logistic</a>
                <ul class="dropdown-menu">
                    <li><a href="/">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</body>
</html>
