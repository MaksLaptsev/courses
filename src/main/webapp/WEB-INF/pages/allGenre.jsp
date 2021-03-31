<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 008 08.02.21
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<html>
<head>
    <title>Genre</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/allGenre.css" rel="stylesheet"  type="text/css">
</head>
<body style="background: #F7F7F7">
    <jsp:include page="index.jsp"/>
    <div id="genreDiv">
        <c:set var="sort" value="?sort=id"/>
        <c:set var="ascending" value="&ascending=true"/>
        <hr id="Line2" style="position:absolute;left:0px;top:181px;width:919px;z-index:1;">
        <input type="button" id="DETECTIVE" name="DETECTIVE" value="<spring:message code="app.book.DETECTIVE"/>" onclick="location.href='${pageContext.request.contextPath}/getAllBooks/DETECTIVE${sort}${ascending}'" style="position:absolute;left:43px;top:306px;width:239px;height:42px;z-index:0;">
        <input type="button" id="THRILLER" name="" value="<spring:message code="app.book.THRILLER"/>" onclick="location.href='${pageContext.request.contextPath}/getAllBooks/THRILLER${sort}${ascending}'" style="position:absolute;left:334px;top:306px;width:239px;height:42px;z-index:1;">
        <input type="button" id="DOCUMENTARY" name="" value="<spring:message code="app.book.DOCUMENTARY"/>" onclick="location.href='${pageContext.request.contextPath}/getAllBooks/DOCUMENTARY${sort}${ascending}'" style="position:absolute;left:622px;top:306px;width:239px;height:42px;z-index:2;">
        <input type="button" id="DRAMATURGY" name="" value="<spring:message code="app.book.DRAMATURGY"/>" onclick="location.href='${pageContext.request.contextPath}/getAllBooks/DRAMATURGY${sort}${ascending}'" style="position:absolute;left:43px;top:442px;width:239px;height:42px;z-index:3;">
        <input type="button" id="ART" name="" value="<spring:message code="app.book.ART"/>" onclick="location.href='${pageContext.request.contextPath}/getAllBooks/ART${sort}${ascending}'" style="position:absolute;left:334px;top:442px;width:239px;height:42px;z-index:4;">
        <input type="button" id="SCIENCE" name="" value="<spring:message code="app.book.SCIENCE"/>" onclick="location.href='${pageContext.request.contextPath}/getAllBooks/SCIENCE${sort}${ascending}'" style="position:absolute;left:622px;top:442px;width:239px;height:42px;z-index:5;">
        <input type="button" id="ADVENTURE" name="" value="<spring:message code="app.book.ADVENTURE"/>" onclick="location.href='${pageContext.request.contextPath}/getAllBooks/ADVENTURE${sort}${ascending}'" style="position:absolute;left:43px;top:571px;width:239px;height:42px;z-index:6;">
    </div>
</body>
</html>
