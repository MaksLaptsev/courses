<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 021 21.01.21
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--<%@ taglib prefix="th" uri="/ajaxjs" %>--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/reset.css" rel="stylesheet"  type="text/css">

</head>
<body>

<jsp:include page="index.jsp"/>
<sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
</sec:authorize>
<div id="containerLogin">
            <div class="outer">
                <div class="middle">
                    <div class="inner">
                        <div class="login-wr">
                            <h2><spring:message code="app.page.login"/></h2>
                            <form name="loginform" class="form" method="post" action="${pageContext.request.contextPath}/login">
                                <input id="username" type="text" name="username" placeholder="Пользователь">
                                <input id="password" type="password" name="password" placeholder="Пароль">
                                <a href="${pageContext.request.contextPath}/registration"> <p> <spring:message code="app.page.registration"/> </p></a>
                                <button type="submit"> <spring:message code="app.page.login"/> </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
</div>
</body>
</html>
