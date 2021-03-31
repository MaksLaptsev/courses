<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 007 07.02.21
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <link href="${pageContext.request.contextPath}/resources/static/css/info.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/userInfo.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="index.jsp"/>
<div id="container">

    <spring:message code="app.user.emailEdit" var="email"/>
    <spring:message code="app.user.phonenumberEdit" var="phoneNumber"/>
    <spring:message code="app.user.lastnameEdit" var="lastName"/>
    <spring:message code="app.user.nameEdit" var="name"/>

    <%--@elvariable id="userInfoForm" type="com.maxlaptsev.shop.model.UserInfo"--%>
    <form:form method="POST" modelAttribute="userInfoForm" >
        <form:hidden path="id" value="${userInfoForm.id}"/>
        <form:hidden path="user" value="${userInfoForm.user.id}"/>
    <table style="position:absolute;left:140px;top:290px;width:781px;height:395px;z-index:0;" id="UserInfoTable">
        <tr>
            <td class="cell0"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> <br><spring:message code="app.user.name"/>: </span></td>
            <spring:bind path="name">
                <td class="cell1"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> <form:input path="name" type="text" placeholder="${name}"/></span>
                <form:errors path="name" cssClass="error"/></td>
            </spring:bind>
        </tr>
        <tr>
            <td class="cell0"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> <spring:message code="app.user.lastname"/>:</span></td>
            <spring:bind path="lastName">
            <td class="cell1"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> <form:input path="lastName" type="text" placeholder="${lastName}"/></span>
                <form:errors path="lastName" cssClass="error"/></td>
            </spring:bind>
        </tr>
        <tr>
            <td class="cell0"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> <spring:message code="app.user.phonenumber"/>:</span></td>
            <spring:bind path="phoneNumber">
            <td class="cell1"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"><form:input path="phoneNumber" type="text"  placeholder="${phoneNumber}"  />
            <form:errors path="phoneNumber" cssClass="error" cssStyle="color: red;position: absolute;inline-size: max-content;top: 65%;left: 53%;"/></span></td>
            </spring:bind>
        </tr>
        <tr>
            <td class="cell2"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> Email:</span></td>
            <spring:bind path="email">
            <td class="cell3"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> <form:input path="email" type="text" placeholder="${email}" />
            <form:errors path="email" cssClass="error" cssStyle="color: red;position: absolute;inline-size: max-content;top: 91%;left: 67%;"/></span></td>
            </spring:bind>
        </tr>
    </table>
    <div id="wb_Text2" style="position:absolute;left:148px;top:256px;width:377px;height:16px;z-index:1;">
        <span style="color:#000000;font-family:Arial;font-size:13px;"><spring:message code="app.user.red"/></span></div>
        <button type="submit" id="editUserInfo" name="editing"  style="position:absolute;left:812px;top:691px;width:96px;height:25px;z-index:2;"><spring:message code="app.user.save"/></button>
    </form:form>
        <input type="submit" id="cancel" name="" value='<spring:message code="app.user.cancell"/>' onclick="location.href='${pageContext.request.contextPath}/cancell'" style="position:absolute;left:709px;top:691px;width:96px;height:25px;z-index:3;">
</div>
</body>
</html>
