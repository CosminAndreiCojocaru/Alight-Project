<%--
  Created by IntelliJ IDEA.
  User: MLG Y520
  Date: 26.05.2023
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Restaurants</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        .page-header {
            margin-bottom: 30px;
            text-align: center;
        }

        .table-header {
            background-color: #343a40;
            color: #fff;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f8f9fa;
        }

        .pizza-photo {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 150px;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .fire-heading {
            position: relative;
            display: inline-block;
            font-size: 48px;
            font-family: "Comic Sans MS", cursive;
            animation: fire 2s infinite;
            text-fill-color: transparent;
            -webkit-text-stroke: 2px #FF4500;
        }

        @keyframes fire {
            0% {
                text-shadow: 0 0 3px #FF4500, 0 0 6px #FF4500;
            }
            50% {
                text-shadow: 0 0 12px #FF4500, 0 0 24px #FF4500, 0 0 36px #FF4500;
            }
            100% {
                text-shadow: 0 0 3px #FF4500, 0 0 6px #FF4500;
            }
        }

        .menu-item-btn {
            background-color: #3f3e3e;
            color: #fff;
            font-family: "Copperplate", emoji;
        }

    </style>
</head>

<body>
<div class="container">
    <div class="page-header">
        <h1 class="fire-heading">Restaurants</h1>
    </div>

    <img class="pizza-photo" src="${pageContext.request.contextPath}/images/pizza-photo.jpg" alt="Pizza Photo">

    <table class="table table-striped">
        <thead class="table-header">
        <tr>
            <th>Name</th>
            <th>Schedule</th>
            <th>Minimum Order</th>
            <th>Standard Delivery Distance</th>
            <th>Standard Delivery Price</th>
            <th>Extra Distance</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${restaurants}" var="restaurant">
            <tr>
                <td><c:out value="${restaurant.name}"/></td>
                <td><c:out value="${restaurant.schedule}"/></td>
                <td><c:out value="${restaurant.minimumOrder}"/></td>
                <td><c:out value="${restaurant.standardDeliveryDistance}"/></td>
                <td><c:out value="${restaurant.standardDeliveryPrice}"/></td>
                <td><c:out value="${restaurant.extraDeliveryFee}"/></td>
                <td><a href="<c:url value="/restaurants/${restaurant.id}/menuitem"/> "
                       class="btn btn-info menu-item-btn">Menu Item</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    // Your JavaScript code here (if needed)
</script>
<h3>Check Order Details</h3>
<form action="<c:url value='/restaurants/order-details'/>" method="GET">
    <input type="text" name="code" placeholder="Enter unique code" required>
    <button type="submit">Check Order</button>
</form>
</body>
</html>
