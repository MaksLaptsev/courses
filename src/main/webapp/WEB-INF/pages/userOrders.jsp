<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 007 07.03.21
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<html>
<head>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/info.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/userOrders.css" rel="stylesheet"  type="text/css">
</head>
<body style="background: #F7F7F7">
<jsp:include page="index.jsp"/>

<div id="myModal">
    <div id="divTable">
    </div>
    <span id="myModal__close" class="close">ₓ</span>
</div>
<div id="myOverlay"></div>
<div id="container">
    <div id="Html1" style="position:absolute;left:93px;top:207px;width:827px;height:524px;z-index:0">
        <div class="container" style="position:absolute;left:0;top:0;width:800px;height:500px;z-index:0">
            <jsp:useBean id="pagedListHolder" scope="request"
                         type="org.springframework.beans.support.PagedListHolder" />
            <c:url value="/user/getUserOrders" var="pagedLink">
                <c:param name="p" value="~" />
            </c:url>
            <c:if test="${pagedListHolder.source.size() > 0}">

                <table class="table">
                    <tr>
                        <th width="20px"><spring:message code="app.user.order.number"/></th>
                        <th style="border-bottom: black"><spring:message code="app.user.order.date" /></th>
                        <th style="border-bottom: black"><spring:message code="app.user.order.books" /></th>
                        <th style="border-bottom: black"><spring:message code="app.basket.totalPrice"/></th>
                        <th style="border-bottom: black"><spring:message code="app.user.order.status" /></th>

                    </tr>
                    <c:forEach items="${pagedListHolder.pageList}"  var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.dateStringWithFormat}</td>
                            <td><a class="listBook" data-id="${item.id}" href="#"><spring:message code="app.user.order.show" /></a></td>
                            <td>${item.totalPrice}</td>
                            <td id="${item.status}"><spring:message code="app.user.order.${item.status}"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${pagedListHolder.source.size() < 1}">
                <tr>
                    <th style="position:absolute;font-size: large; left:0;top:0;width:800px;height:500px;z-index:0"><spring:message code="app.user.order.not"/></th>
                </tr>
            </c:if>
            <tg:paging pagedListHolder="${pagedListHolder}"
                       pagedLink="${pagedLink}" />
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('a.listBook').click( function(event){
            event.preventDefault();
            var order_id = $(this).data('id');
            $.ajax({
                url: '/user/order/listBook',
                method: 'GET',
                action: 'update',
                data:{id: order_id},
                success: function (response) {
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
                },
                error:  function(xhr, str){
                    alert('<spring:message code="app.page.error"/> ' + xhr.responseCode);
                }
            })
        });
    });
</script>



</body>
</html>
