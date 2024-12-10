<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Donor</title>
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
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const deleteLinks = document.querySelectorAll(".delete-link");
            deleteLinks.forEach(link => {
                link.addEventListener("click", function(event) {
                    const confirmation = confirm("Are you sure you want to delete this donor?");
                    if (!confirmation) {
                        event.preventDefault();
                    }
                });
            });
        });
    </script>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
    <c:if test="${not empty message}">
        <div style="color: green; font-weight: bold; margin-bottom: 15px; text-align: center;">
            ${message}
        </div>
    </c:if>
    <c:if test="${not empty error}">
        <div style="color: red; font-weight: bold; margin-bottom: 15px; text-align: center;">
            ${error}
        </div>
    </c:if>
    <div class="table-container">
        <h3>Delete Donor</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>GENDER</th>
                    <th>EMAIL</th>
                    <th>DATE OF BIRTH</th>
                    <th>CONTACT</th>
                    <th>ADDRESS</th>
                    <th>STATUS</th>
                    <th>ACTION</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${donorlist}" var="donor">
                    <tr>
                        <td><c:out value="${donor.id}" /></td>
                        <td><c:out value="${donor.name}" /></td>
                        <td><c:out value="${donor.gender}" /></td>
                        <td><c:out value="${donor.email}" /></td>
                        <td><c:out value="${donor.dateofbirth}" /></td>
                        <td><c:out value="${donor.contact}" /></td>
                        <td><c:out value="${donor.address}" /></td>
                        <td><c:out value="${donor.status}" /></td>
                        <td>
                            <a class="delete-link" href="<c:url value='donordelete?id=${donor.id}' />">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
