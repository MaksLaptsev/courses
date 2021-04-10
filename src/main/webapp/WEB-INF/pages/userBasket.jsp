<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 022 22.02.21
  Time: 19:55
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
    <link href="${pageContext.request.contextPath}/resources/static/css/userBasket.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/info.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/table.css" rel="stylesheet"  type="text/css">
    <title>Basket</title>
</head>
<body style="background: #F7F7F7">
<jsp:include page="index.jsp"/>
<c:set var="s" value="S"/>

<div id="container">
    <div class="link_group" style="left:93px;top:207px;width:827px;height:524px;z-index:0">
        <a id="show_popup" class="show_popup" rel="popup" href="#"></a>
        <div class="popup">
            <a class="close" href="#">Close</a>
            <h2><spring:message code="app.basket.createOrder"/></h2>
            <button class="userInfo" onclick="window.location.href='${pageContext.request.contextPath}/getActiveUserInfo'"><spring:message code="app.basket.action.GoToAcc"/></button>
        </div>
    </div>
    <div id="Html1" style="position:absolute;left:93px;top:207px;width:827px;height:524px;z-index:0">
        <div class="container" style="position:absolute;left:0;top:0;width:800px;height:500px;z-index:0">
            <jsp:useBean id="pagedListHolder" scope="request"
                         type="org.springframework.beans.support.PagedListHolder" />
            <c:url value="/userBasket" var="pagedLink">
                <c:param name="p" value="~" />
            </c:url>
            <c:if test="${pagedListHolder.source.size() > 0}">
                <div class="clear_busket">
                    <button onclick="clearBasket()"><spring:message code="app.basket.action.clear"/></button>
                </div>
                <div class="create_order">
                    <button onclick="createOrder()"><spring:message code="app.basket.action.createOrder"/></button>
                </div>
                <table class="table">
                    <tr>
                        <th width="20px">Id</th>
                        <th style="border-bottom: black"><spring:message code="app.table.nameBook"/></th>
                        <th style="border-bottom: black"><spring:message code="app.table.pages"/></th>
                        <th style="border-bottom: black"><spring:message code="app.table.price"/></th>

                    </tr>
                    <c:forEach items="${pagedListHolder.pageList}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td><a href="/getbookById/${item.id}">${item.name}</a></td>
                            <td>${item.pages}</td>
                            <td>${item.price }</td>
                            <td style="border: none"><button onclick="delFromBasket(${item.id})"><img src="${pageContext.request.contextPath}/resources/static/images/delete.png" alt="Удалить из корзины" width="20px" height="20px"></button></td>
                        </tr>
                    </c:forEach>
                </table>
                <p style="font-size: 16px;font-family:'Times New Roman'"><spring:message code="app.basket.totalPrice"/>: ${userBasket.totalPrice} BYN</p>
            </c:if>
            <c:if test="${pagedListHolder.source.size() < 1}">
                <tr>
                    <th style="position:absolute;font-size: large; left:0;top:0;width:800px;height:500px;z-index:0"><spring:message code="app.basket.empty"/></th>
                </tr>
            </c:if>

            <tg:paging pagedListHolder="${pagedListHolder}"
                       pagedLink="${pagedLink}" />
        </div>
    </div>
</div>

<script type="text/javascript" >
    function delFromBasket(id) {

        $.ajax({
            url: '/userBasket/delFromBasket',
            method: 'POST',
            action: 'update',
            data:{id: id},
            success: function (response) {
                alert('<spring:message code="app.basket.action.del"/>');
                location.reload();
            },
            error:  function(xhr, str){
                alert('<spring:message code="app.page.error"/> ' + xhr.responseCode);
            }
        });
        return false;
    }
</script>
<script type="text/javascript">
    function clearBasket() {
        $.ajax({
            url: '/userBasket/clear',
            method:'POST',
            action: 'update',
            success: function (response) {
                alert('<spring:message code="app.basket.action.emptied"/>');
                location.reload();
            },
            error:  function(xhr, str){
                alert('<spring:message code="app.page.error"/> ' + xhr.responseCode);
            }
        });
        return false;

    }
</script>

<script type="text/javascript">
    function createOrder() {
        $.ajax({
            url: '/userBasket/createOrder',
            method:'POST',
            action: 'post',
            success: function (response,request) {

                if (response === "Success"){
                    alert('<spring:message code="app.basket.action.feedback"/>');
                    location.reload();
                }else if (response !=="Success" && response !== ""){
                    alert('<spring:message code="app.book.notHave"/> '+response)
                } else {
                    document.getElementById('show_popup').click();
                }
            },
            error:  function(xhr, str){
                alert('<spring:message code="app.page.error"/> ' + xhr.responseCode);
            }
        });
        return false;
    }
</script>

<script>
    $(document).ready(function() {
        $('a.notHave').click(function (event) {
            $("#divTable").html($(response).find("data").html());
            setTimeout(
                $('#myOverlay').fadeIn(297, function(){
                    $('#myModal')
                        .css('display', 'block')
                        .animate({opacity: 1}, 198);
                }),1000);

            $('#myModal__close, #myOverlay').click( function(){
                $('#myModal').animate({opacity: 0}, 198,
                    function(){
                        $(this).css('display', 'none');
                        $('#myOverlay').fadeOut(297);
                    });
            });
        });
    });
</script>

<script>
    $(function () {
        //script for popups
        $('a.show_popup').click(function () {
            $('div.'+$(this).attr("rel")).fadeIn(500);
            $("body").append("<div id='overlay'></div>");
            $('#overlay').show().css({'filter' : 'alpha(opacity=80)'});
            return false;
        });
        $('a.close').click(function () {
            $(this).parent().fadeOut(100);
            $('#overlay').remove('#overlay');
            return false;
        });
    });
</script>

</body>
</html>
