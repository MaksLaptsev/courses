
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 028 28.01.21
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Book info</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/info.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/static/css/bookInfo.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background: #F7F7F7">
<jsp:include page="index.jsp"/>
<div id="container">
    <picture id="wb_Picture1" style="position:absolute;left:72px;top:305px;width:312px;height:416px;z-index:0">
        <img src="${pageContext.request.contextPath}/${getbook.urlImg}" id="Picture1" alt="" srcset="">
    </picture>
    <div id="wb_Heading2" style="position:absolute;left:414px;top:314px;width:581px;height:70px;z-index:1;">
        <h1 id="Heading2">${getbook.name}</h1></div>
    <div id="Html1" style="position:absolute;left:414px;top:396px;width:204px;height:179px;z-index:3">
        <div class="b-description__sub">
            <table>
                <tbody>
                <tr class="">
                    <td><spring:message code="app.library.author"/>:</td>
                    <c:forEach items="${getbook.authors}" var="author">
                        <td>
                            <a href="/getAuthorById/${author.id}">
                                    ${author.toString() }
                            </a>
                        </td>
                    </c:forEach>
                </tr>
                <tr class="">
                    <td><spring:message code="app.livrary.publish"/>:</td>
                    <td>${getbook.publisher}</td>
                </tr>
                <tr class="">
                    <td><spring:message code="app.library.pages"/>:</td>
                    <td itemprop="numberOfPages">${getbook.pages}</td>
                </tr>
                <tr class="">
                    <td><spring:message code="app.book.quantity"/>:</td>
                    <c:if test="${getbook.getQuantityBook().quantity > 0}" >
                        <td>${getbook.getQuantityBook().quantity}</td>
                    </c:if>
                    <c:if test="${getbook.getQuantityBook().quantity == 0}" >
                        <td><spring:message code="app.book.availability"/></td>
                    </c:if>
                </tr>

                <tr class="">
                    <td><spring:message code="app.book.price"/>:</td>
                    <td>${getbook.price} BYN</td>
                </tr>
                </tbody>
            </table>
            <div class="description" style="position: absolute">
                <label style="width: 550px; position: absolute;top: 15px; font-size: 15px;">
                        <c:if test="${getbook.description.length() > 5}">
                            <c:import url="${pageContext.request.contextPath}/${getbook.description}" var ="desc" charEncoding="UTF-8"/>
                            <c:out value="${desc}"/>
                        </c:if>
                        <c:if test="${getbook.description.length() < 2}">
                            <label style="width: 550px; position: absolute;top: 15px; font-size: 15px;"><spring:message code="app.book.info.desc"/></label>
                        </c:if>
                </label>
            </div>
        </div>
    </div>
    <button onclick="addToBasket(${getbook.id})"><spring:message code="app.basket.add"/></button>

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
</div>
</body>
</html>
