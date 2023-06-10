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
    <title>Menu Item</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Retrieve the menu item data from the server
            var menuItems = [];
            <c:forEach items="${restaurants.menuItem}" var="menuitem">
            menuItems.push({
                name: '${menuitem.name}',
                price: ${menuitem.price}
            });
            </c:forEach>

            // Update the price field when the item name is changed
            $('#name').change(function () {
                var selectedItem = $(this).val();
                var selectedMenuItem = menuItems.find(function (item) {
                    return item.name === selectedItem;
                });

                if (selectedMenuItem) {
                    $('#price').val(selectedMenuItem.price);
                } else {
                    $('#price').val('');
                }
            });
        });
    </script>
</head>
<body>

<div class="container">
    <h2>Menu Item for ${restaurants.name}&nbsp;&nbsp;
        <a href="<c:url value="/restaurants"/>" class="btn btn-primary">Back to Restaurants List</a></h2>

    <table class="table table-striped">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
        </tr>
        <c:forEach items="${restaurants.menuItem}" var="menuitem">
            <tr>
                <td><c:out value="${menuitem.name}"/></td>
                <td><c:out value="${menuitem.description}"/></td>
                <td><c:out value="${menuitem.price}"/></td>

            </tr>
        </c:forEach>
    </table>

    <form action="<c:url value='/restaurants/${restaurants.id}/menuitem/addtocart'/>" method="post">
        <div class="form-group" style="display: none;">
            <label for="itemId">Item ID:</label>
            <input type="text" class="form-control" id="itemId" name="itemId" value="${restaurants.id}" readonly>
        </div>

        <div class="form-group">
            <label for="name">Item Name:</label>
            <select class="form-control" id="name" name="name" required>
                <option value="">Select an item</option>
                <c:forEach items="${restaurants.menuItem}" var="menuitem">
                    <option value="${menuitem.name}">${menuitem.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="text" class="form-control" id="quantity" name="quantity" required>
            <c:if test="${not empty param.quantity and param.quantity == ''}">
                <small class="text-danger">Please enter a valid quantity.</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="mention">Mention:</label>
            <input type="text" class="form-control" id="mention" name="mention">
        </div>
        <div class="form-group" style="display: none;">
            <label for="price">Price:</label>
            <input type="number" class="form-control" id="price" name="price" required readonly>
            <c:if test="${not empty param.price and param.price == ''}">
                <small class="text-danger">Please enter a valid price.</small>
            </c:if>
        </div>
        <button type="submit" class="btn btn-primary">Add to Cart</button>
    </form>

</div>
</body>
</html>
