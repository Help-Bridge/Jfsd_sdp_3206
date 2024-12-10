<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Donations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Container styling */
        .table-container {
            width: 80%;
            max-width: 1200px;
            background-color: #ffffff;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            margin: 50px auto;
        }

        /* Heading styling with blue underline */
        h3 {
            text-align: center;
            color: #2c3e50;
            font-weight: bold;
            margin-bottom: 20px;
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

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            font-size: 14px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f4f4f9;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .table-container {
                width: 95%;
                padding: 15px;
            }

            th, td {
                font-size: 12px;
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <%@ include file="donernav.jsp" %>

    <div class="main-content">
        <div class="table-container">
            <h3>View All Donations</h3>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Amount</th>
                        <th>Order Status</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Corrected JSTL c:forEach tag -->
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td><c:out value="${order.orderId}" /></td>
                            <td><c:out value="${order.name}" /></td>
                            <td><c:out value="${order.email}" /></td>
                            <td><c:out value="${order.amount}" /></td>
                            <td><c:out value="${order.orderStatus}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>