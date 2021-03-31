<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 021 21.12.20
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Authors</title>
</head>
<body>

<h2>Authors</h2>
<table>
    <tr>
        <th>id</th>
        <th>name</th>
        <th>lastname</th>
    </tr>
    <c:forEach var="author" items="${authors}">
        <tr>
            <td>${author.id}</td>
            <td>${author.name}</td>
            <td>${author.lastName}</td>
        </tr>
    </c:forEach>

</table>
<div>       <!-- content -->
    <div>    <!-- buttons holder -->
        <button onclick="location.href='/'">Go to Library</button>
    </div>
</div>
</body>
</html>