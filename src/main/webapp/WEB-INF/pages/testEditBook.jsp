<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 008 08.03.21
  Time: 23:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<html>
<link href="${pageContext.request.contextPath}/resources/static/css/table.css" rel="stylesheet"  type="text/css">
    <body>
        <div id="tableForBook">
            <table id="tableBooks" class="table">
                <tr>
                    <th width="20px">Id</th>
                    <th style="border-bottom: black"><spring:message code="app.table.nameBook"/></th>
                    <th style="border-bottom: black"><spring:message code="app.table.pages"/></th>
                    <th style="border-bottom: black"><spring:message code="app.livrary.publish"/></th>
                    <th style="border-bottom: black"><spring:message code="app.book.language"/></th>
                    <th style="border-bottom: black"><spring:message code="app.table.price"/></th>
                </tr>
                <c:forEach items="${books}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.name}</td>
                    <td>${item.pages}</td>
                    <td>${item.publisher}</td>
                    <td>${item.language}</td>
                    <td>${item.price}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>