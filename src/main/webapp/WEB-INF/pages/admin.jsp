<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 008 08.03.21
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Admin</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/admin.css" rel="stylesheet"  type="text/css">
</head>
<body>
<jsp:include page="index.jsp"/>
<c:set var="successBook" value="${successBook}" scope="page"/>
<c:set var="successAuthor" value="${successAuthor}" scope="page"/>
<c:set var="successEditAuthor" value="${successEditAuthor}" scope="page"/>
<c:set var="successEditBook" value="${successEditBook}" scope="page"/>
<div id="container">
    <div id="adminPanel" style="position: absolute; top: 200px; left: 47px">

        <div id="modalSuccess" style="width: 400px; height: 140px">
            <p><spring:message code="app.admin.addBook.success"/></p>
            <button onclick="location.href='${pageContext.request.contextPath}/admin/add/book'"><spring:message code="app.admin.addBookAgain"/></button>
            <button onclick="location.href='${pageContext.request.contextPath}/admin/list/book?id=${Id}'" style="position: relative"><spring:message code="app.admin.editAddBook"/></button>
            <span id="modalSuccess__close" class="close">ₓ</span>
        </div>
        <div id="overlaySuccess"></div>
        <div id="modalSuccessAuthor" style="width: 400px; height: 140px">
            <p><spring:message code="app.admin.addAuthorSuccess"/></p>
            <button onclick="location.href='${pageContext.request.contextPath}/admin/add/author'"><spring:message code="app.admin.addAuthorAgain"/></button>
            <button onclick="location.href='${pageContext.request.contextPath}/admin/list/author?id=${Id}'" ><spring:message code="app.admin.editAddAuthor"/></button>
            <span id="modalSuccessAuthor__close" class="close">ₓ</span>
        </div>
        <div id="overlaySuccessAuthor"></div>

        <div id="modalSuccessEditBook" style="width: 400px; height: 140px">
            <p><spring:message code="app.admin.editBookSuccess"/></p>
            <button onclick="location.href='${pageContext.request.contextPath}/getbookById/${Id}'" style="position: absolute"><spring:message code="app.page.view"/></button>
            <button onclick="location.href='${pageContext.request.contextPath}/admin/list/book?id=${Id}'" style="position: relative; top: 25px;"><spring:message code="app.admin.editAgain"/></button>
            <span id="modalSuccessEditBook__close" class="close">ₓ</span>
        </div>
        <div id="overlaySuccessEditBook"></div>

        <div id="modalSuccessEditAuthor" style="width: 400px; height: 140px">
            <p><spring:message code="app.admin.editAuthorSuccess"/></p>
            <button onclick="location.href='${pageContext.request.contextPath}/getAuthorById/${Id}'" style="position: absolute"><spring:message code="app.page.view"/></button>
            <button onclick="location.href='${pageContext.request.contextPath}/admin/list/author?id=${Id}'" style="position: relative; top: 25px;"><spring:message code="app.admin.editAgain"/></button>
            <span id="modalSuccessEditAuthor__close" class="close">ₓ</span>
        </div>
        <div id="overlaySuccessEditAuthor"></div>

        <button id="listBooks" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/list/books?sort=id&ascending=true'"><spring:message code="app.admin.listBooks"/></button>

        <button id="listAuthors" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/list/authors?sort=id&ascending=true'"><spring:message code="app.admin.listAuthors"/></button>

        <button id="addBook" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/add/book'"><spring:message code="app.admin.add.book"/></button>

        <button id="addAuthor" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/add/author'"><spring:message code="app.admin.add.author"/></button>

        <button id="listUsers" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/list/users?sort=id&ascending=true'"><spring:message code="app.admin.listUsers"/></button>

        <button id="listOrders" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/list/orders?sort=id&ascending=true'"><spring:message code="app.admin.listOrders"/></button>


    </div>

    <hr id="Line2" style="position:absolute;left:0px;top:181px;width:919px;z-index:1;">
    <div id="wb_Text2" style="position:absolute;left:0px;top:150px;width:445px;height:31px;z-index:2;">
        <span style="color:#000000;font-family:'Times New Roman';font-size:27px;"><spring:message code="app.admin.panel"/> ${head}</span>
    </div>
</div>


</body>

<%--Success add book--%>
<script>
    $(document).ready(function () {
        var success = '${successBook}';
        if (success === "Yes"){
            $('#overlaySuccess').fadeIn(297, function () {
                $('#modalSuccess')
                    .css('display', 'block')
                    .animate({opacity: 1}, 198);
            });
            $('#modalSuccess__close, #overlaySuccess').click(function () {
                $('#modalSuccess').animate({opacity: 0}, 198,
                    function () {
                        $(this).css('display', 'none');
                        $('#overlaySuccess').fadeOut(297);
                    });
            });
        }
    });

</script>
<%--Success add author--%>
<script>
    $(document).ready(function () {
        var success = '${successAuthor}';
        if (success === "Yes"){
            $('#overlaySuccessAuthor').fadeIn(297, function () {
                $('#modalSuccessAuthor')
                    .css('display', 'block')
                    .animate({opacity: 1}, 198);
            });
            $('#modalSuccessAuthor__close, #overlaySuccessAuthor').click(function () {
                $('#modalSuccessAuthor').animate({opacity: 0}, 198,
                    function () {
                        $(this).css('display', 'none');
                        $('#overlaySuccessAuthor').fadeOut(297);
                    });
            });
        }
    });
</script>
<%--Success edit author--%>
<script>
    $(document).ready(function () {
        var success = '${successEditAuthor}';
        if (success === "Yes"){
            $('#overlaySuccessEditAuthor').fadeIn(297, function () {
                $('#modalSuccessEditAuthor')
                    .css('display', 'block')
                    .animate({opacity: 1}, 198);
            });
            $('#modalSuccessEditAuthor__close, #overlaySuccessEditAuthor').click(function () {
                $('#modalSuccessEditAuthor').animate({opacity: 0}, 198,
                    function () {
                        $(this).css('display', 'none');
                        $('#overlaySuccessEditAuthor').fadeOut(297);
                    });
            });
        }
    });
</script>
<%--Success edit book--%>
<script>
    $(document).ready(function () {
        var success = '${successEditBook}';
        if (success === "Yes"){
            $('#overlaySuccessEditBook').fadeIn(297, function () {
                $('#modalSuccessEditBook')
                    .css('display', 'block')
                    .animate({opacity: 1}, 198);
            });
            $('#modalSuccessEditBook__close, #overlaySuccessEditBook').click(function () {
                $('#modalSuccessEditBook').animate({opacity: 0}, 198,
                    function () {
                        $(this).css('display', 'none');
                        $('#overlaySuccessEditBook').fadeOut(297);
                    });
            });
        }
    });
</script>
</html>
