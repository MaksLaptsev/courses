<%@ page import="com.maxlaptsev.shop.model.UserInfo" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 007 07.02.21
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <link href="${pageContext.request.contextPath}/resources/static/css/info.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/userInfo.css" rel="stylesheet" type="text/css">
</head>
<body style="background: #F7F7F7">
<jsp:include page="index.jsp"/>
<div id="container">
    <table style="position:absolute;left:140px;top:290px;width:781px;height:395px;z-index:0;" id="UserInfoTable">
        <tr>
            <td class="cell0"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> <br><spring:message code="app.user.name"/>:</span></td>
            <td class="cell1"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> ${userInfo.name}</span></td>
        </tr>
        <tr>
            <td class="cell0"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> <spring:message code="app.user.lastname"/>:</span></td>
            <td class="cell1"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> ${userInfo.lastName}</span></td>
        </tr>
        <tr>
            <td class="cell0"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> <spring:message code="app.user.phonenumber"/>:</span></td>
            <td class="cell1"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> ${userInfo.phoneNumber}</span></td>
        </tr>
        <tr>
            <td class="cell2"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> Email:</span></td>
            <td class="cell3"><span style="color:#000000;font-family:Arial;font-size:13px;line-height:16px;"> ${userInfo.email}</span></td>
        </tr>
    </table>
    <div id="wb_Text2" style="position:absolute;left:148px;top:256px;width:377px;height:16px;z-index:1;">
        <span style="color:#000000;font-family:Arial;font-size:13px;">Login: ${userLogin}</span></div>

    <input type="button" id="userOrders" name="orders" value="<spring:message code="app.user.orderHistory"/>" onclick="location.href='${pageContext.request.contextPath}/user/getUserOrders'" style="position:absolute;left:785px;top:256px;width:130px;height:25px;z-index:1;"/>

    <input type="button" id="editUserInfo" name="editing" value="<spring:message code="app.user.red"/>" onclick="location.href='${pageContext.request.contextPath}/editingUserInfo'" style="position:absolute;left:785px;top:691px;width:130px;height:25px;z-index:2;">
</div>
</body>
</html>
