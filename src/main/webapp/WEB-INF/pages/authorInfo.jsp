<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 028 28.01.21
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Author info</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/info.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/static/css/authorInfo.css" rel="stylesheet">
</head>
<body style="background: #F7F7F7">
<jsp:include page="index.jsp"/>
<div id="container">
    <picture id="wb_Picture1" style="position:absolute;left:72px;top:305px;width:312px;height:416px;z-index:0">
        <img src="${pageContext.request.contextPath}/${getauthor.urlImg}" id="Picture1" alt="" srcset="">
    </picture>
    <div id="wb_Heading2" style="position:absolute;left:414px;top:314px;width:581px;height:70px;z-index:1;">
        <h1 id="Heading2">${getauthor.toString()}</h1></div>
    <div id="Html1" style="position:absolute;left:416px;top:358px;width:328px;height:323px;z-index:3">
        <div class="section-content">
            <p><c:import url="${pageContext.request.contextPath}/${getauthor.bio}" var ="bio" charEncoding="UTF-8"/><c:out value="${bio}"/></p>
        </div>
    </div>
    <div class="author-books" style="position:absolute;left:416px;top:701px;width:328px;height:323px;z-index:3">
        <input type="button" id="authorBooks" onclick="location.href='${pageContext.request.contextPath}/books?authorId=${getauthor.id}&sort=id&ascending=true'; return false;" value="<spring:message code="app.author.books"/>">
    </div>
</div>
</body>
</html>
