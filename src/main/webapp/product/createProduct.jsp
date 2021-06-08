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
</head>
<body>

<div>
    <p>${message}</p>
    <form method="post">
        <input name="name" type="text" placeholder=" nhập tên sản phẩm">
        <input name="price"   type="text" placeholder="giá sản phậm">
        <input name="amount"  type="text" placeholder="số lượng sản phậm">
        <input name="color"  type="text" placeholder="màu sắc sản phẩm">
        <input name="description"   type="text" placeholder="thông tin sản phẩm">
        <select name="category_id" >
            <c:forEach items="${categoryList}" var="category">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </select>
        <button type="submit">ADD NEW</button>
    </form>
</div>

</body>
</html>
