<%@ page import="onlineShoppingProject.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancel Orders</title>
    <link rel="stylesheet" href="../css/ordersReceived-style.css">
    <style>
        .th-style {
            width: 25%;
        }
    </style>
</head>
<body>
    <div style="color: white; text-align: center; font-size: 30px;">Cancel Orders <i class='fas fa-window-close'></i></div>
    
    <c:choose>
        <c:when test="${msg == 'cancel'}">
            <h3 class="alert">Order Cancel Successfully!</h3>
        </c:when>
        <c:when test="${msg == 'done'}">
            <h3 class="alert">Successfully Updated!</h3>
        </c:when>
        <c:when test="${msg == 'invalid'}">
            <h3 class="alert">Something went wrong! Try Again!</h3>
        </c:when>
    </c:choose>

    <table id="customers">
        <tr>
            <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
            <th scope="col">Expected Delivery Date</th>
            <th scope="col">Payment Method</th>
            <th scope="col">T-ID</th>
            <th scope="col">Status</th>
        </tr>
        <c:forEach var="cartItem" items="${cartItems}">
            <tr>
                <td>${cartItem.mobileNumber}</td>
                <td>${cartItem.productName}</td>
                <td>${cartItem.quantity}</td>
                <td><i class="fa fa-inr"></i>${cartItem.subTotal}</td>
                <td>${cartItem.address}</td>
                <td>${cartItem.city}</td>
                <td>${cartItem.state}</td>
                <td>${cartItem.country}</td>
                <td>${cartItem.orderDate}</td>
                <td>${cartItem.expectedDeliveryDate}</td>
                <td>${cartItem.paymentMethod}</td>
                <td>${cartItem.tId}</td>
                <td>${cartItem.status}</td>
            </tr>
        </c:forEach>
    </table>
    
    <br>
    <br>
    <br>
</body>
</html>
