<%--
  Created by IntelliJ IDEA.
  User: MLG Y520
  Date: 26.05.2023
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">

    <style>
        /* Define a custom class for the button */
        .moved-button {
            position: absolute; /* Set the button position to absolute */
            top: 50px; /* Adjust the top position as desired */
            right: 1cm;
            font-family: Arial, sans-serif;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Cart</h2>
    <table class="table table-striped">
        <tr>
            <th>Item Name</th>
            <th>Quantity</th>
            <th>Mention</th>
        </tr>
        <c:forEach items="${restaurants}" var="cartItem" varStatus="loop">
            <tr>
                <td>${cartItem.menuItem.name}</td>
                <td>${cartItem.quantity}</td>
                <td>${cartItem.mention}</td>
                <c:if test="${loop.first}">
                    <td><a href="<c:url value='/restaurants/${cartItem.menuItem.id}/menuitem'/>" class="moved-button">Back to Menu Item</a></td>
                </c:if>

                <c:if test="${loop.first}">
                <div class="text-right">
                    <a href="<c:url value='/restaurants/${cartItem.menuItem.id}/complete-order'/>" class="btn btn-primary">Complete Order</a>
                </div>
                </c:if>
            </tr>
        </c:forEach>
    </table>



</div>
</body>
</html>

