<%--
  Created by IntelliJ IDEA.
  User: CONG
  Date: 6/8/2021
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product</title>
</head>
<body>
    <a href="/products?action=create">ADD Product</a>
    <from >
        <input type="text" value="Nhập tên sản phẩm">
        <button type="submit" value="">Tìm kiếm</button>
    </from>

    <table border="1">
        <tr>
            <th scope="col">Mã sản phẩm</th>
            <th scope="col">Tên sản phẩm</th>
            <th scope="col">Giá sản phẩm</th>
            <th scope="col">Số lượng sản phẩm</th>
            <th scope="col">Màu sắc sản phẩm</th>
            <th scope="col">Thông tin sản phẩm</th>
            <th scope="col">Loại sản phẩm</th>
            <th colspan="2" scope="col">Thao tác</th>
        </tr>
        <c:forEach items="${productList}" var="p">
            <tr>
                <td scope="row">${p.id}</td>
                <td>${p.name}</td>
                <td>${p.price}</td>
                <td>${p.amount}</td>
                <td>${p.color}</td>
                <td>${p.description}</td>
                <td>${p.category.name}</td>
                <td>
                    <a href="/home?action=edit&id=${p.id}">Sửa</a>
                </td>
                <td>
                    <a href="/home?action=delete&id=${p.id}">Xoá</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>