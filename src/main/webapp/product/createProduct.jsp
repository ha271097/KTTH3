<%--
  Created by IntelliJ IDEA.
  User: CONG
  Date: 5/29/2021
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>ADD</title>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <style>
        .create-form{
            margin-top: 70px;
            max-height: 500px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand btn btn-outline-info" href="/products">Thoát ra ngoài</a>

    </div>
</nav>


<div class="create-form col-sm-5  border border-secondary border-5 rounded">
    <p>${message}</p>
    <form method="post">
        <input name="name"  class="form-control" type="text" placeholder=" nhập tên sản phẩm">
        <input name="price" class="form-control"  type="text" placeholder="giá sản phậm">
        <input name="amount" class="form-control"  type="text" placeholder="số lượng sản phậm">
        <input name="color" class="form-control"  type="text" placeholder="màu sắc sản phẩm">
        <input name="description" class="form-control"  type="text" placeholder="thông tin sản phẩm">
        <select name="category_id" class="form-select">
            <c:forEach items="${categoryList}" var="category">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </select>
        <button  class="btn btn-danger" type="submit">Thêm mới</button>
    </form>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</html>
