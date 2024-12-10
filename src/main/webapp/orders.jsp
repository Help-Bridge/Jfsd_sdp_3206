<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Orders Page</title>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<%@ page import="com.klef.jfsd.donation.model.Donor" %>
<style>
    /* Basic reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    /* Page layout */
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background: linear-gradient(120deg, #84fab0, #8fd3f4);
    }

    /* Form container styling */
    .form-container {
        background: #ffffff;
        padding: 2rem;
        width: 100%;
        max-width: 400px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        transition: all 0.3s ease;
    }

    /* Table styling */
    table {
        width: 100%;
    }

    td {
        padding: 1rem 0;
    }

    /* Input styling */
    input[type="text"],
    input[type="email"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 1rem;
        transition: border 0.3s;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="number"]:focus {
        border-color: #339900;
    }

    /* Button styling */
    .btn-primary {
        display: inline-block;
        width: 100%;
        padding: 12px;
        background: #339900;
        color: #ffffff;
        font-size: 1rem;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    .btn-primary:hover {
        background: #267700;
    }

    /* Heading styling */
    h2 {
        text-align: center;
        font-size: 1.5rem;
        color: #333;
        margin-bottom: 1rem;
    }
.doner-nav {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: inherit;
    position: fixed;  /* This keeps it fixed at the top of the page */
    top: 0;           /* Align it at the very top */
    left: 0;          /* Align it to the left */
    width: 100%;      /* Make sure it spans the entire width of the page */
    z-index: 1000;    /* Ensure it stays on top of other content */
}

<%
Donor d = (Donor) session.getAttribute("donor");
if (d == null) {
    response.sendRedirect("donorsessionexpiry.jsp");
    return ;
}

String name = d.getName();
String email = d.getEmail();
int did=d.getId();
%>
</style>
</head>
<body>
    <div class="doner-nav">
    <%@include file="donernav.jsp" %>
    </div>
    <div class="form-container">
        <h2>Place Your Order</h2>
        <table>
            <tr>
                <td>Amount:</td>
                <td><input type="number" name="amount" id="amount" required /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button id="rzp-button1" class="btn-primary">Proceed To Pay</button>
                </td>
            </tr>
        </table>
    </div>

<script>
    async function createOrder() {
        // Pass the name, email, and donor ID directly from JSP to JavaScript
        const donorName = "<%= name %>";
        const donorEmail = "<%= email %>";
        const donorId = <%= did %>;

        const response = await fetch("http://localhost:2004/createOrder", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: donorName,
                email: donorEmail,
                amount: document.getElementById('amount').value,
                donerId: donorId // Include the donor ID
            })
        });
        const order = await response.json();
        return order;
    }

    document.getElementById('rzp-button1').onclick = async function(e) {
        const order = await createOrder();

        var options = {
            "key": "rzp_test_YoyjIpZp6LvIF9",
            "amount": order.amount,
            "currency": "INR",
            "name": " Vishnu Vardhan Reddy ",
            "description": "order for Test",
            "order_id": order.razorpayOrderId,
            "reciept": order.email,
            "callback_url": "http://localhost:2004/paymentCallback",
            "prefill": {
                "name": order.name,
                "email": order.email
            },
            "theme": {
                "color": "#339900"
            }
        };

        var rzp1 = new Razorpay(options);
        rzp1.open();
        e.preventDefault();
    }
</script>


</body>
</html>
