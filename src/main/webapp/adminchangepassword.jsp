<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            overflow: hidden; /* Prevent scrolling */
        }
        nav {
            width: 100%;
        }
        .content {
            flex: 1; /* Take remaining space to enable centering */
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 90%; /* Adjust to fit smaller screens */
            max-width: 300px; /* Maintain a consistent width on larger screens */
            text-align: center;
        }
        .card h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .card form label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        .card form input {
            width: 100%; /* Use full width of the card */
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .card form button {
            background-color: green;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .card form button:hover {
            background-color: lightgreen;
        }
        .card p {
            color: red;
        }
    </style>
</head>
<body>
    <!-- Include the navigation bar -->
    <nav>
        <%@ include file="adminnavbar.jsp" %>
    </nav>

    <!-- Center the card -->
    <div class="content">
        <div class="card">
            <h2>Change Password</h2>
            <form action="${pageContext.request.contextPath}/updateadminpassword" method="post">
                <label>Old Password:</label>
                <input type="password" name="oldpassword" required>

                <label>New Password:</label>
                <input type="password" name="newpassword" required>

                <button type="submit">Change Password</button>
            </form>
            <p><c:out value="${message}" /></p>
        </div>
    </div>
</body>
</html>