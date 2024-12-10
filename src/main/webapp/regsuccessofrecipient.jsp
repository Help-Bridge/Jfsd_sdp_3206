<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <style>
        /* General body styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        /* Container for success message */
        .message-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 90%;
            max-width: 400px;
        }

        /* Heading styling */
        h2 {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        /* Success message text styling */
        .message {
            font-size: 18px;
            color: #27ae60;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Link styling for navigation */
        a {
            font-size: 16px;
            color: #3498db;
            text-decoration: none;
            padding: 8px 16px;
            border: 2px solid #3498db;
            border-radius: 4px;
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #3498db;
            color: white;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .message-container {
                width: 80%;
            }
            h2 {
                font-size: 20px;
            }
            .message {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <div class="message-container">
        <h2>Registration Successful!</h2>
        <p class="message"><c:out value="${message}"/></p>
        <a href="adminhome">Back to Login</a>
    </div>

</body>
</html>
