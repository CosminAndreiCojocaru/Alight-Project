<%--
  Created by IntelliJ IDEA.
  User: MLG Y520
  Date: 27.05.2023
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Complete Order</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        /* Custom styles for the form and container */
        .container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="number"] {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .form-group input[type="text"]:focus,
        .form-group input[type="number"]:focus {
            outline: none;
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .form-group button[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            border: none;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-group button[type="submit"]:hover {
            background-color: #0069d9;
        }

        .unique-code {
            margin-top: 20px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 4px;
        }

        .unique-code h3 {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .back-to-home {
            text-align: center;
            margin-top: 20px;
        }

        .back-to-home p {
            font-size: 14px;
        }

        .back-to-home .home-link {
            color: #007bff;
            text-decoration: none;
        }

        .back-to-home .home-link:hover {
            text-decoration: underline;
        }

        .back-to-home p {
            font-size: 14px;
        }

        .back-to-home .home-link {
            color: #007bff;
            text-decoration: none;
        }

        .back-to-home .home-link:hover {
            text-decoration: underline;
        }

        .back {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .back {
            position: fixed;
            top: 20px;
            right: 20px;
        }

        .back button {
            padding: 10px 20px;
            background-color: #dc3545;
            border: none;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        .back button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Complete Order</h2>

    <form id="orderForm" action="/restaurants/${restaurants.id}/complete-order" method="POST">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" required>
        </div>
        <div class="form-group">
            <label for="distance">Distance in km</label>
            <input type="number" id="distance" name="distance" required>
        </div>
        <div class="form-group">
            <label for="mention">Order Mentions</label>
            <input type="text" id="mention" name="mention">
        </div>
        <div class="form-group">
            <button type="submit">Submit</button>
        </div>
    </form>

    <div class="unique-code" id="uniqueCode" style="display: none;">
        <h3>Unique Code:</h3>
        <p id="codeValue"></p>
    </div>

    <script>
        // Submit the form using AJAX
        document.getElementById("orderForm").addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent form submission
            var form = event.target;
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Display the unique code section and set the code value
                        var uniqueCodeSection = document.getElementById("uniqueCode");
                        var codeValue = document.getElementById("codeValue");
                        codeValue.textContent = xhr.responseText;
                        uniqueCodeSection.style.display = "block";
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
<div class="back-to-home">
    <p>Click <a href="/restaurants" class="home-link">here</a> to go back to the homepage.</p>
</div>
</body>

<c:if test="${not empty param.minOrderAmount}">
    <div class="back">
        <button onclick="window.history.back()">Back</button>
    </div>
</c:if>
</html>
