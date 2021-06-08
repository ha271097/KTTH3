<%--
  Created by IntelliJ IDEA.
  User: CONG
  Date: 5/29/2021
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>EditProduct</title>
</head>
<body>
        <a href="/home">Back Home</a>
        <form method="post" >
                <label>Id sản phẩm</label>
                <input name="id" id="id" value="${product.id}">
                <label>Tên sản phẩm</label>
                <input name="name" id="name" value="${product.name}"></br>
                <label>Giá sản phẩm</label>
                <input name="price" id="price" value="${product.price}"></br>
                <label >Số lượng sản phẩm</label>
                <input name="amount" id="amount" value="${product.amount}"></br>
                <label >Màu sắc sản phẩm</label>
                <input name="color" id="color" value="${product.color}"></br>
                <label >Thông tin sản phẩm</label>
                <input name="description" id="description" value="${product.description}"></br>
                <label for="category_id">Loại sản phẩm</label>
                <select id="category_id" class="form-select">
                    <c:forEach items="${categoryList}" var="category">
                        <option value="${category.id}"<c:if test="${product.category.id == category.id}">selected="true"</c:if>>${category.name}</option>
                    </c:forEach>
                </select>
            <button type="submit">EDIT</button>
        </form>
</body>
</html>
