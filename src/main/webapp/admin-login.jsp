<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="loginstyles.css">
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h2>Admin Login</h2>
        <!-- Optional error message -->
        <p class="error-message" id="error-message">Invalid credentials. Please try again.</p>
        <form method="post" action="checkadminlogin" onsubmit="return validateForm()">       
            <div class="input-box">
                <input type="text" id="auname" name="auname" required placeholder=" " />
                <label for="auname">Enter Username</label>
            </div>
            <div class="input-box">
                <input type="password" id="apwd" name="apwd" required placeholder=" " />
                <label for="apwd">Password</label>
            </div>
            <button type="submit">Login</button>
        </form>
    </div>
</div>

<!-- Optional JavaScript for error handling -->
<script>
function validateForm() {
    const username = document.getElementById('auname').value.trim();
    const password = document.getElementById('apwd').value.trim();
    const errorMessage = document.getElementById('error-message');

    if (username === '' || password === '') {
        errorMessage.style.display = 'block';
        errorMessage.textContent = 'All fields are required.';
        return false;
    }
    // Additional checks can be added here
    errorMessage.style.display = 'none';
    return true;
}
</script>
</body>
</html>
