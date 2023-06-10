<%--
  Created by IntelliJ IDEA.
  User: MLG Y520
  Date: 27.05.2023
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Calculate and display the total price
            var totalPrice = 0;
            var standardDeliveryDistance = parseFloat('${order.restaurants[0].standardDeliveryDistance}');
            var extraDeliveryFee = parseFloat('${order.restaurants[0].extraDeliveryFee}');
            var distance = parseFloat('${order.distance}');

            $('.itemTotalPrice').each(function () {
                var itemTotalPrice = parseFloat($(this).text());
                if (!isNaN(itemTotalPrice)) {
                    totalPrice += itemTotalPrice;
                }
            });

            // Calculate extra distance charge
            var extraDistance = distance - standardDeliveryDistance;
            if (extraDistance > 0) {
                var extraDistanceCharge = extraDistance * extraDeliveryFee;
                totalPrice += extraDistanceCharge;
            }

            // Add the standard delivery price
            var standardDeliveryPrice = parseFloat('${order.restaurants[0].standardDeliveryPrice}');
            if (!isNaN(standardDeliveryPrice)) {
                totalPrice += standardDeliveryPrice;
            }

            $('#totalPrice').text(totalPrice.toFixed(2));
        });
    </script>
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
<p>Ordered Items:</p>
<table>
    <tr>
        <th>Item Name</th>
        <th>Quantity</th>
        <th>Mention</th>
        <th>Price</th>
        <th>Total Price</th>
    </tr>
    <c:forEach items="${order.cartItems}" var="cartItem">
        <tr>
            <td>${cartItem.menuItem.name}</td>
            <td>${cartItem.quantity}</td>
            <td>${cartItem.mention}</td>
            <td>${cartItem.menuItem.price}</td>
            <td class="itemTotalPrice">${cartItem.menuItem.price * cartItem.quantity}</td>
        </tr>
    </c:forEach>
</table>
<p>Standard Delivery Distance: ${order.restaurants[0].standardDeliveryDistance} km</p>
<p>Standard Delivery Price: $${order.restaurants[0].standardDeliveryPrice}</p>
<p>Extra Distance Charge Per Km: $${order.restaurants[0].extraDeliveryFee}</p>
<p>Total Price: $<span id="totalPrice">0.00</span></p>
<p>Please make a note of your unique code for future reference.</p>
<p>Click <a href="/restaurants">here</a> to go back to the homepage.</p>
</body>
</html>
