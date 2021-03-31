<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 008 08.03.21
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Admin</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/admin.css" rel="stylesheet"  type="text/css">
</head>
<body>
<jsp:include page="index.jsp"/>
<div id="container">
    <div id="adminPanel" style="position: absolute; top: 200px; left: 47px">

        <button id="listBooks" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/list/books?sort=id&ascending=true'"><spring:message code="app.admin.listBooks"/></button>

        <button id="listAuthors" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/list/authors?sort=id&ascending=true'"><spring:message code="app.admin.listAuthors"/></button>

        <button id="addBook" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/add/book'"><spring:message code="app.admin.add.book"/></button>

        <button id="addAuthor" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/add/author'"><spring:message code="app.admin.add.author"/></button>

        <button id="listUsers" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/list/users?sort=id&ascending=true'"><spring:message code="app.admin.listUsers"/></button>

        <button id="listOrders" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/list/orders?sort=id&ascending=true'"><spring:message code="app.admin.listOrders"/></button>


    </div>

    <hr id="Line2" style="position:absolute;left:0px;top:181px;width:919px;z-index:1;">
    <div id="wb_Text2" style="position:absolute;left:0px;top:150px;width:445px;height:31px;z-index:2;">
        <span style="color:#000000;font-family:'Times New Roman';font-size:27px;"><spring:message code="app.admin.panel"/> ${head}</span>
    </div>
</div>

</body>
</html>
