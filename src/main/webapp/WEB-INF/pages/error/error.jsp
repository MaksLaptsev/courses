<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 031 31.03.21
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <title>404</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@600;900&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/static/css/404-500.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/4b9ba14b0f.js" crossorigin="anonymous"></script>
</head>
<body >

<div class="mainbox">
    <i class="far fa-question-circle fa-spin" style="position: absolute; left: 17%; top: 18%"></i>
    <i class="far fa-question-circle fa-spin"></i>
    <i class="far fa-question-circle fa-spin" style="position: absolute; left: 63%;top: 18%"></i>
    <div class="msg"><spring:message code="app.error.500"/><a href="${pageContext.request.contextPath}/start"><spring:message code="app.error.500-1"/></a></div>
</div>

</body>
</html>
