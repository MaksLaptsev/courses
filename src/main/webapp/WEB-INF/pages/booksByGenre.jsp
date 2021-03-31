<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 007 07.02.21
  Time: 18:46
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
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/getallbooks.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/pagin.css" rel="stylesheet"  type="text/css">
    <title>Books</title>
</head>

<body style="background: #F7F7F7">
    <jsp:include page="index.jsp"/>
    <jsp:useBean id="pagedListHolderGenre" scope="request"
                 type="org.springframework.beans.support.PagedListHolder"/>
    <jsp:useBean id="strUrl" scope="request" type="java.lang.String"/>
    <jsp:useBean id="clearUrl" scope="request" type="java.lang.String"/>
    <c:url value="${strUrl}" var="pagedLink">
        <c:param name="p" value="~" />
    </c:url>
<div>
    <div id="container">
        <div id="sort" style="position:absolute;left:750px;top:163px;width:245px;height:20px;z-index:0">
            <p style="position:absolute;left:1025px;top:163px;height:20px;z-index:0"><spring:message code="app.page.sort"/>:</p>
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
        <div id="Html1" style="position:absolute;left:0px;top:193px;width:919px;height:623px;z-index:0">
            <c:forEach items="${pagedListHolderGenre.pageList}" var="item">
                <figure style="border: 1px solid #000000; margin-right: 20px; margin-bottom: 7px; margin-left: 5px; margin-top: 5px">
                    <a href="/getbookById/${item.id}">
                        <img src="${pageContext.request.contextPath}/${item.urlImg}" content="image/jpeg" width="270" height="330" alt="" >
                    </a>
                    <figcaption style="text-align: center">${item.name}</figcaption>
                </figure>
            </c:forEach>
        </div>
        <hr id="Line2" style="position:absolute;left:0px;top:181px;width:919px;z-index:1;">
        <div id="wb_Text2" style="position:absolute;left:0px;top:150px;width:445px;height:31px;z-index:2;">
            <span style="color:#000000;font-family:'Times New Roman';font-size:27px;">Все книги</span></div>
    </div>
    <div id="pagin">
        <div id="htmlPagin" style="position:absolute;left:387px;top:913px;width:144px;height:63px;z-index:0">
            <tg:paging pagedListHolder="${pagedListHolderGenre}"
                       pagedLink="${pagedLink}" /></div>
    </div>
</div>
</body>
</html>
