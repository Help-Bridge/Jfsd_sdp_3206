<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor Navbar</title>
    <link rel="stylesheet" href="donnav.css">
</head>
<body>
    <nav class="navbar">
                    <nav class="navbar1">
      <div class="logo">
        <img src="images/icon1.jpg" alt="Help Bridge Logo" style="height: 40px; margin-right: 10px; vertical-align: middle;">
        <a href="donorhome" style="color: white;">HelpBridge</a>
      </div>
      </nav>
        <ul class="navbar-menu">
            <li><a href="donations">Donate Product</a></li>
            <li><a href="orders">Donate Money</a></li>
            <li><a href="mydonations">Donated Product</a></li>
            <li><a href="displayOrders">Donated Money</a></li>
            <li><a href="donorprofile">Profile</a></li>
            <li class="dropdown">
                <a href="#">Donor</a>
                <ul class="dropdown-menu">
                    <li><a href="/">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</body>
</html>
