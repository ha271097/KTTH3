<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CONG
  Date: 5/29/2021
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EditProduct</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <style>
        .form-product-1{
            margin: 75px auto;
            max-height: 800px;
        }
        .form-product{
            width: 90%;
            height: 90%;
            margin: auto;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand btn btn-outline-info" href="/products">Thoát ra ngoài</a>
    </div>
</nav>

<div class="col-sm-5  border border-secondary border-5 rounded  form-product-1">
    <div class="form-product">
        <form method="post" >
            <div class="form-group">
                <label class="form-label" for="id">Id sản phẩm</label>
                <input class="form-control" name="id" id="id" value="${product.id}" readonly>
            </div>
            <div class="form-group">
                <label class="form-label" for="name">Tên sản phẩm</label>
                <input class="form-control" name="name" id="name" value="${product.name}"></br>
            </div>
            <div class="form-group">
                <label class="form-label" for="price">Giá sản phẩm</label>
                <input class="form-control" name="price" id="price" value="${product.price}"></br>
            </div>
            <div class="form-group">
                <label class="form-label" for="amount">Số lượng sản phẩm</label>
                <input class="form-control" name="amount" id="amount" value="${product.amount}"></br>
            </div>
            <div class="form-group">
                <label class="form-label" for="color">Màu sắc sản phẩm</label>
                <input class="form-control" name="color" id="color" value="${product.color}"></br>
            </div>
            <div class="form-group">
                <label class="form-label" for="description">Thông tin sản phẩm</label>
                <input class="form-control" name="description" id="description" value="${product.description}"></br>
            </div>
            <div class="form-group">
                <label class="form-label" for="category_id">Loại sản phẩm</label>
                <select name="category_id" id="category_id" class="form-select">
                    <c:forEach items="${categoryList}" var="category">
                        <option value="${category.id}"<c:if test="${product.category.id == category.id}">selected="true"</c:if>>${category.name}</option>
                    </c:forEach>
                </select>
            </div>
            <button class="btn btn-danger" type="submit">Xác Nhận</button>
        </form>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</html>
