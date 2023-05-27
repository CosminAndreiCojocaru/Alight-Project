<%--
  Created by IntelliJ IDEA.
  User: MLG Y520
  Date: 27.05.2023
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Complete Order</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h2>Complete Order</h2>
    <%-- Add an empty <div> to hold the unique code --%>
    <div id="uniqueCode"></div>

    <form id="orderForm" action="/restaurants/${restaurants.id}/complete-order" method="POST">
        <input type="text" name="name" placeholder="Name" required><br>
        <input type="text" name="address" placeholder="Address" required><br>
        <input type="number" name="distance" placeholder="Distance in km" required><br>
        <input type="text" name="mention" placeholder="Order Mentions"><br>
        <button type="submit">Submit</button>
    </form>

    <script>
        // Submit the form using AJAX
        document.getElementById("orderForm").addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent form submission
            var form = event.target;
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Display the unique code in the <div>
                        document.getElementById("uniqueCode").innerHTML = "Unique Code: " + xhr.responseText;
                    } else {
                        // Handle error case
                    }
                }
            };
            xhr.open(form.method, form.action, true);
            xhr.send(new FormData(form));
        });
    </script>
</div>
<p>Click <a href="/restaurants">here</a> to go back to the homepage.</p>
</body>
</html>

