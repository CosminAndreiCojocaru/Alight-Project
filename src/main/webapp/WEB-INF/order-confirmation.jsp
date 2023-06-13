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
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        h2 {
            margin-top: 0;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        strong {
            font-weight: bold;
        }

        #totalPrice {
            font-size: 18px;
            font-weight: bold;
        }

        .homepage-link {
            color: #007bff;
            text-decoration: none;
        }

        .homepage-link:hover {
            text-decoration: underline;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
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

            var extraDistance = distance - standardDeliveryDistance;
            if (extraDistance > 0) {
                var extraDistanceCharge = extraDistance * extraDeliveryFee;
                totalPrice += extraDistanceCharge;
            }

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
    <li><strong>Name:</strong> ${order.name}</li>
    <li><strong>Address:</strong> ${order.address}</li>
    <li><strong>Distance:</strong> ${order.distance} km</li>
    <li><strong>Mention:</strong> ${order.mention}</li>
    <li><strong>Unique Code:</strong> ${order.uniqueCode}</li>
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
<p><strong>Standard Delivery Distance:</strong> ${order.restaurants[0].standardDeliveryDistance} km</p>
<p><strong>Standard Delivery Price:</strong> $${order.restaurants[0].standardDeliveryPrice}</p>
<p><strong>Extra Distance Charge Per Km:</strong> $${order.restaurants[0].extraDeliveryFee}</p>
<p><strong>Total Price:</strong> $<span id="totalPrice">0.00</span></p>
<p>Please make a note of your unique code for future reference.</p>
<p>Click <a class="homepage-link" href="/restaurants">here</a> to go back to the homepage.</p>
</body>
</html>
