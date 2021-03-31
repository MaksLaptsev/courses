<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<data>
    <table>
        <tr>
            <th width="20px">Id</th>
            <th><spring:message code="app.table.nameBook"/></th>
            <th><spring:message code="app.table.pages"/></th>
            <th><spring:message code="app.table.price"/></th>
        </tr>
        <c:forEach items="${items}" var="item">
            <tr>
                <td>${item.id}</td>
                <td><c:out value="${item.name}" /></td>
                <td>${item.pages}"</td>
                <td>${item.price }</td>
            </tr>
        </c:forEach>
    </table>
</data>

