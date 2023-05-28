<%--
  Created by IntelliJ IDEA.
  User: MLG Y520
  Date: 27.05.2023
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <<title>Order Confirmation</title>
</head>
<body>
<h2>Order Confirmation</h2>
<p>Thank you for your order, <strong>${order.name}</strong>!</p>
<p>Your order details:</p>
<ul>
    <li>Name: ${order.name}</li>
    <li>Address: ${order.address}</li>
    <li>Distance: ${order.distance} km</li>
    <li>Mention: ${order.mention}</li>
    <li>Unique Code: ${order.uniqueCode}</li>
</ul>
<p>Please make a note of your unique code for future reference.</p>
<p>Click <a href="/restaurants">here</a> to go back to the homepage.</p>
</body>
</html>
