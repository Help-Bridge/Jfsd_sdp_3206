<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Recipient</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 0;
        }

        .table-container {
            margin-top: 60px; /* Space for the fixed navbar */
            padding: 20px;
            width: 90%;
            margin-left: auto;
            margin-right: auto;
        }

        h3 {
            text-align: center;
            color: #34495e;
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 16px;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        td {
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .delete-link {
            display: inline-block;
            color: #e74c3c;
            text-decoration: none;
            padding: 6px 10px;
            border: 1px solid #e74c3c;
            border-radius: 4px;
            font-weight: bold;
            transition: 0.3s;
        }

        .delete-link:hover {
            background-color: #e74c3c;
            color: white;
        }

        @media screen and (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px;
            }

            .navbar a {
                padding: 10px;
                width: 100%;
                text-align: left;
            }

            .table-container {
                margin-top: 100px; /* Adjust for larger navbar */
            }

            th, td {
                font-size: 14px;
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
    <div class="table-container">
        <h3>Delete Recipient</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>GENDER</th>
                    <th>EMAIL</th>
                    <th>DATE OF BIRTH</th>
                    <th>CONTACT</th>
                    <th>LOCATION</th>
                    <th>STATUS</th>
                    <th>ACTION</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${recipientlist}" var="recipient">
                    <tr>
                        <td><c:out value="${recipient.id}" /></td>
                        <td><c:out value="${recipient.name}" /></td>
                        <td><c:out value="${recipient.gender}" /></td>
                        <td><c:out value="${recipient.email}" /></td>
                        <td><c:out value="${recipient.dateofbirth}" /></td>
                        <td><c:out value="${recipient.contact}" /></td>
                        <td><c:out value="${recipient.location}" /></td>
                        <td><c:out value="${recipient.status}" /></td>
                        <td>
                            <a class="delete-link" href="<c:url value='recipientdelete?id=${recipient.id}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
