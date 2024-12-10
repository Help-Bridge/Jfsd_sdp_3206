<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logistic Login</title>
    <style>
        /* Global Reset and Box Model Fix */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #2193b0 0%, #6dd5ed 100%);
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
            max-width: 400px;
            text-align: center;
            animation: slideIn 0.8s ease-in-out;
        }

        /* Slide-In Animation */
        @keyframes slideIn {
            from {
                transform: translateY(-30px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
            font-size: 24px;
            font-weight: bold;
        }

        /* Message Display */
        h4 {
            color: red;
            text-align: center;
            margin-bottom: 15px;
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
            background: #f9f9f9;
            outline: none;
            font-size: 16px;
            transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .input-box input:focus {
            border-color: #2193b0;
            box-shadow: 0 0 6px rgba(33, 147, 176, 0.4);
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
            color: #2193b0;
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
            background: #2193b0;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease;
        }

        button:hover {
            background: #6dd5ed;
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

    <!-- Login Form -->
    <div class="login-container">
        <div class="login-box">
            <h2>Logistic Login</h2>
            <form method="post" action="checklogisticlogin">
                <div class="input-box">
                    <input type="email" id="lcemail" name="lcemail" required placeholder=" " />
                    <label for="lcemail">Enter Email ID</label>
                </div>
                <div class="input-box">
                    <input type="password" id="lcpassword" name="lcpassword" required placeholder=" " />
                    <label for="lcpassword">Enter Password</label>
                </div>
                <button type="submit">Login</button>
            </form>
            <a href="#" class="forgot-password">Forgot your password?</a>
            <p>Don't have an account? <a href="reglogistic">Sign Up</a></p>
        </div>
    </div>

    <!-- Show alert if 'message' is not empty -->
    <c:if test="${not empty message}">
        <script type="text/javascript">
            alert("${message}");
        </script>
    </c:if>

</body>
</html>
