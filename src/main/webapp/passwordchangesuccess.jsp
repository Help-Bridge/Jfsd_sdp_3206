<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Password Changed</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        nav {
            width: 100%;
        }
        .content {
            flex: 1; /* Take remaining space to enable centering */
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        p {
            margin-bottom: 15px;
            color: #555;
        }
       .content a {
            color: white;
            background-color: green;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-weight: bold;
        }
        a:hover {
            background-color: lightgreen;
        }
    </style>
</head>
<body>
    <!-- Include the navigation bar -->
    <nav>
        <%@ include file="adminnavbar.jsp" %>
    </nav>

    <!-- Center the content -->
    <div class="content">
        <div>
            <h2>Password Change Successful</h2>
            <p>Your password has been updated successfully.</p>
            <a href="${pageContext.request.contextPath}/admin-login.jsp">Go to Login Page</a>
        </div>
    </div>
</body>
</html>