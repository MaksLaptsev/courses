<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 026 26.01.21
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<link href="${pageContext.request.contextPath}/resources/static/css/start.css" rel="stylesheet" th:href="@{/css/start.css}" type="text/css">
</head>
<body style="background: #F7F7F7">
<jsp:include page="index.jsp"/>
<div id="container">
    <div id="Html1" style="position:absolute;left:0px;top:193px;width:919px;height:623px;z-index:0">
        <c:forEach items="${books}" var="book">
            <figure>
                <div class="book_image">
                    <img src="${book.urlImg}" width="270" height="330" alt="" >
                    <figcaption>${book.name}</figcaption>
                        <div class="button_book">
                            <div class="info_book" >
                                <button class="button_info" onclick="window.location.href='${pageContext.request.contextPath}/getbookById/${book.id}'"><spring:message code="app.book.info"/></button>
                            </div>
                            <div class="add_to_basket">
                                <button class="button_add" onclick="addToBasket(${book.id})"><spring:message code="app.basket.add"/></button>
                            </div>
                    </div>
                </div>
            </figure>
        </c:forEach>
    </div>
    <hr id="Line2" style="position:absolute;left:0px;top:181px;width:919px;z-index:1;">
    <div id="wb_Text2" style="position:absolute;left:0px;top:150px;width:445px;height:31px;z-index:2;">
        <span style="color:#000000;font-family:'Times New Roman';font-size:27px;"><spring:message code="app.library.rnd"/></span></div>
</div>
<script type="text/javascript" >
    function addToBasket(id) {
        <sec:authorize access="isAuthenticated()">
            $.ajax({
                url: '/userBasket/addToBasket',
                method: 'POST',
                action: 'update',
                data:{id: id},
                success: function (response) {
                    alert('<spring:message code="app.basket.action.add"/>');
                },
                error:  function(xhr, str){
                    alert('<spring:message code="app.page.error"/> ' + xhr.responseCode);
                }
            });
            return false;
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            alert('<spring:message code="app.page.regOrLog"/>');
        </sec:authorize>
        return false;
    }
</script>
</body>
</html>
