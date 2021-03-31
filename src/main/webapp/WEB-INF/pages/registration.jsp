<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 027 27.01.21
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
    <meta charset="utf-8">
    <title>Registration</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/registration.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="index.jsp"/>
<div class="containerRegistration" id="containerRegistration">
    <spring:message code="app.reg.password" var="pass"/>
    <spring:message code="app.reg.username" var="username"/>
    <spring:message code="app.reg.passwordConfirm" var="confirm"/>

    <div id="myModal">
        <p><spring:message code="app.reg.${error}"/></p>
        <span id="myModal__close" class="close">ₓ</span>
    </div>
    <div id="myOverlay"></div>
    <a hidden id="err1" class="err" href="#">Action</a>

    <div class="outer">
        <div class="middle">
            <div class="inner">
                <div class="login-wr">
                    <h2><spring:message code="app.page.registration"/></h2>


                    <%--@elvariable id="userForm" type="com.maxlaptsev.shop.model.User"--%>
                    <form:form name="loginform" class="form" method="post" modelAttribute="userForm">
                        <div>
                            <form:input id="username" type="text" path="username" name="username" placeholder="${username}"/>
                            <form:errors path="username" cssClass="error"/>
                        </div>
                        <div>
                            <form:input id="password" type="password" path="password" name="password" placeholder="${pass}"/>
                            <form:errors path="password" cssClass="error"/>
                        </div>
                        <div>
                            <form:input id="password" type="password" path="passwordConfirm" name="passwordConfirm" placeholder="${confirm}"/>
                        </div>
                        <button type="submit"> <spring:message code="app.page.registration"/> </button>
                    </form:form>

                    <c:if test="${error != null && error != ''}">
                        <script>
                            $('#myOverlay').fadeIn(297, function(){
                                $('#myModal')
                                    .css('display', 'block')
                                    .animate({opacity: 1}, 198);
                            });

                            $('#myModal__close, #myOverlay').click( function(){
                                $('#myModal').animate({opacity: 0}, 198,
                                    function(){
                                        $(this).css('display', 'none');
                                        $('#myOverlay').fadeOut(297);
                                    });
                            });
                        </script>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
