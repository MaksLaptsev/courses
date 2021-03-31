<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 008 08.03.21
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<html>
<head>
    <title>admin/list/books</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/listBooks.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/pagin.css" rel="stylesheet"  type="text/css">

</head>
<body style="background: #F7F7F7;font-size: 13px">
<jsp:include page="admin.jsp"/>
<jsp:useBean id="pagedListHolder" scope="request"
             type="org.springframework.beans.support.PagedListHolder"/>
<jsp:useBean id="strUrl" scope="request" type="java.lang.String"/>
<jsp:useBean id="clearUrl" scope="request" type="java.lang.String"/>
<jsp:useBean id="head" scope="request" type="java.lang.String"/>
<c:url value="${strUrl}" var="pagedLink">
    <c:param name="p" value="~" />
</c:url>
<div id="container">
<div id="listBooks">
    <div id="myModal">
        <div id="table" style="position: relative">

        </div>
        <span id="myModal__close" class="close">ₓ</span>
    </div>
    <div id="myOverlay"></div>

    <div id="sort" style="position:absolute;left:800px;top:250px;width:245px;height:20px;z-index:0">
        <p style="position:absolute;left:-85px;top:3px;height:20px;z-index:0"><spring:message code="app.page.sort"/>:</p>
        <form name="sortMenu">
            <select name="sel" onChange="changeSort(document.sortMenu.sel)">
                <option value="#"><spring:message code="app.page.selectSort"/></option>
                <option title="Сортировка по цене"
                        value="${clearUrl}?sort=price&ascending=true"><spring:message code="app.page.sort.byPrice"/> ↑</option>
                <option title="Сортировка по названию" value="${clearUrl}?sort=name&ascending=true"><spring:message code="app.page.sort.byName"/> ↑</option>
                <option title="Сортировка по цене"
                        value="${clearUrl}?sort=price&ascending=false"><spring:message code="app.page.sort.byPrice"/> ↓</option>
                <option title="Сортировка по названию" value="${clearUrl}?sort=name&ascending=false"><spring:message code="app.page.sort.byName"/> ↓</option>
            </select>
        </form>
        <script>
            function changeSort(what){
                var selectedopt=what.options[what.selectedIndex];
                window.location = selectedopt.value
            }
        </script>
    </div>

    <div id="divTable" style="position: absolute; top: 275px;left: 0px;width: 1000px">
        <table class="table">
            <tr>
                <th width="20px">Id</th>
                <th style="border-bottom: black"><spring:message code="app.table.nameBook"/></th>
                <th style="border-bottom: black"><spring:message code="app.table.pages"/></th>
                <th style="border-bottom: black"><spring:message code="app.table.price"/></th>
                <th style="border-bottom: black"><spring:message code="app.book.quantity"/></th>

            </tr>
            <c:forEach items="${pagedListHolder.pageList}" var="item">
                <tr>
                    <td>${item.id}</td>
                    <td><a href="/getbookById/${item.id}">${item.name}</a></td>
                    <td>${item.pages}</td>
                    <td>${item.price }</td>
                    <td>${item.getQuantityBook().quantity}</td>
                    <td style="border: none"><a title="<spring:message code="app.admin.editBook"/>" class="editBook" data-id="${item.id}" onclick="location.href='${pageContext.request.contextPath}/admin/list/book?id=${item.id}'"><img src="${pageContext.request.contextPath}/resources/static/images/changeButton.png" alt="editing book" width="20px" height="20px"></a></td>
                </tr>
            </c:forEach>
        </table>
        <tg:paging pagedListHolder="${pagedListHolder}"
                   pagedLink="${pagedLink}" />
    </div>
</div>
</div>

</body>
</html>
