<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Donor Login</title>
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box; /* Fix for text boxes extending beyond the card */
        }

        body {
            font-family: 'Roboto', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
        }

        /* Login Container */
        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            width: 100%;
        }

        .login-box {
            background: #fff;
            padding: 30px 25px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 380px;
            animation: fadeIn 1s ease-in-out;
            text-align: center;
        }

        /* Fade-in Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
            font-weight: bold;
            text-transform: uppercase;
        }

        /* Input Box */
        .input-box {
            position: relative;
            margin-bottom: 20px;
        }

        .input-box input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            background: #f9f9f9;
            font-size: 16px;
            transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .input-box input:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 6px rgba(106, 17, 203, 0.4);
        }

        .input-box label {
            position: absolute;
            top: 14px;
            left: 15px;
            font-size: 14px;
            color: #aaa;
            pointer-events: none;
            transition: all 0.3s ease-in-out;
        }

        .input-box input:focus + label,
        .input-box input:not(:placeholder-shown) + label {
            top: -8px;
            left: 12px;
            font-size: 12px;
            color: #6a11cb;
            background: #fff;
            padding: 0 4px;
            border-radius: 4px;
        }

        /* Button */
        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background: #6a11cb;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease;
        }

        button:hover {
            background: #2575fc;
            transform: scale(1.05);
        }

        /* Links */
        .forgot-password, p a {
            display: inline-block;
            margin-top: 10px;
            color: #007BFF;
            font-size: 14px;
            text-decoration: none;
            transition: color 0.2s ease-in-out;
        }

        .forgot-password:hover, p a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        p {
            margin-top: 15px;
            color: #666;
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .login-box {
                padding: 20px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h2>Donor Login</h2>
        <form method="post" action="checkdonorlogin">
            <div class="input-box">
                <input type="email" id="d_email" name="d_email" required placeholder=" " />
                <label for="d_email">Enter Email ID</label>
            </div>
            <div class="input-box">
                <input type="password" id="d_password" name="d_password" required placeholder=" " />
                <label for="d_password">Password</label>
            </div>
            <button type="submit">Login</button>
        </form>
        <a href="#" class="forgot-password">Forgot your password?</a>
        <p>Don't have an account? <a href="pregdonor">Sign Up</a></p>
    </div>
</div>

<!-- Show alert only if 'message' is not empty or null -->
<c:if test="${not empty message}">
    <script type="text/javascript">
        alert("${message}");
    </script>
</c:if>

</body>
</html>