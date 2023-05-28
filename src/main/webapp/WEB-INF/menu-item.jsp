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
            <c:if test="${not empty param.itemId and param.itemId == ''}">
                <small class="text-danger">Please enter a valid item ID.</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="text" class="form-control" id="quantity" name="quantity" required>
            <c:if test="${not empty param.quantity and param.quantity == ''}">
                <small class="text-danger">Please enter a valid quantity.</small>
            </c:if>
        </div>
        <div class="form-group">
            <label for="itemName">Item Name:</label>
            <input type="text" class="form-control" id="itemName" name="itemName" required>
        </div>
        <div class="form-group">
        <div class="form-group">
            <label for="mention">Mention:</label>
            <input type="text" class="form-control" id="mention" name="mention">
        </div>
        <button type="submit" class="btn btn-primary">Add to Cart</button>
    </form>

</div>
</body>
</html>
