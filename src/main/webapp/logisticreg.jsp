<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Logistic</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Form container styling */
        .form-container {
            width: 60%;
            max-width: 600px;
            background-color: #ffffff;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            margin: 0 auto;
            margin-top: 50px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
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

        input[type="text"], input[type="email"], input[type="password"], input[type="date"], input[type="tel"], textarea {
            width: 100%;
            padding: 5px;
            margin: 4px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            transition: box-shadow 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="date"]:focus, input[type="tel"]:focus, textarea:focus {
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
    <div class="form-container" align="center">
        <form method="post" action="addlogistic" onsubmit="return validateForm()">
            <h3>Add Logistic</h3>
            <table>
                <tr>
                    <td><label for="name">Enter Name</label></td>
                    <td>
                        <input type="text" id="name" name="name" 
                               pattern="[A-Za-z\s]+" 
                               title="Name should only contain letters and spaces." 
                               required />
                    </td>
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
                    <td>
                        <input type="date" id="dob" name="dob" 
                               max="2005-12-31" 
                               title="You must be at least 18 years old." 
                               required />
                    </td>
                </tr>
                <tr>
                    <td><label for="email">Enter Email ID</label></td>
                    <td>
                        <input type="email" id="email" name="email" 
                               pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" 
                               title="Enter a valid email address." 
                               required />
                    </td>
                </tr>
                <tr>
                    <td><label for="pwd">Enter Password</label></td>
                    <td>
                        <input type="password" id="pwd" name="pwd" 
                               pattern=".{8,}" 
                               title="Password must be at least 8 characters long." 
                               required />
                    </td>
                </tr>
                <tr>
                    <td><label for="contact">Enter Contact</label></td>
                    <td>
                        <input type="tel" id="contact" name="contact" 
                               pattern="[0-9]{10}" 
                               title="Contact must be a 10-digit number." 
                               required />
                    </td>
                </tr>
                <tr>
                    <td><label for="location">Enter Location</label></td>
                    <td>
                        <input type="text" id="location" name="location" 
                               pattern=".{2,}" 
                               title="Location must have at least 2 characters." 
                               required />
                    </td>
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
    <%@include file="adminnavbar.jsp" %>
    <script>
        function validateForm() {
            const dob = document.getElementById("dob").value;
            const dobDate = new Date(dob);
            const minDate = new Date("2005-12-31");

            if (dobDate > minDate) {
                alert("You must be at least 18 years old.");
                return false;
            }
            alert("Registration successful!");
            return true;
        }
    </script>
</body>
</html>
