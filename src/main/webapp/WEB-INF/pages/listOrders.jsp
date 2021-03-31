<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 023 23.03.21
  Time: 20:36
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
    <title>admin/list/authors</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/listOrders.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/pagin.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/admin.css" rel="stylesheet"  type="text/css">

</head>
<body style="background: #F7F7F7; font-size: 13px">
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
        <div id="myModalOrders">
            <div id="table" style="position: relative">
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
            <span id="myModal__closeOrders" class="close">ₓ</span>
        </div>
        <div id="myOverlayOrders"></div>

        <div id="sort" style="position:absolute;left:800px;top:250px;width:245px;height:20px;z-index:0">
            <p style="position:absolute;left:-85px;top:3px;height:20px;z-index:0"><spring:message code="app.page.sort"/>:</p>
            <form name="sortMenu">
                <select name="sel" onChange="changeSort(document.sortMenu.sel)">
                    <option value="#"><spring:message code="app.page.selectSort"/></option>
                    <option title="Сортировка по дате" value="${clearUrl}?sort=dataTimestamp&ascending=true">по дате ↑</option>
                    <option title="Сортировка по дате" value="${clearUrl}?sort=dataTimestamp&ascending=false">по дате ↓</option>
                    <option title="Сортировка по дате" value="${clearUrl}?sort=id&ascending=true">по id ↑</option>
                    <option title="Сортировка по дате" value="${clearUrl}?sort=id&ascending=false">по id ↓</option>
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
                    <th style="border-bottom: black"><spring:message code="app.user.order.date"/></th>
                    <th style="border-bottom: black">User Id</th>
                    <th style="border-bottom: black"><spring:message code="app.user.order.books"/></th>
                    <th style="border-bottom: black"><spring:message code="app.basket.totalPrice"/></th>
                    <th style="border-bottom: black"><spring:message code="app.user.order.status"/></th>

                </tr>
                <c:forEach items="${pagedListHolder.pageList}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.dataTimestamp}</td>
                        <td><a onclick="location.href='${pageContext.request.contextPath}/admin/list/user?id=${item.userId}'">${item.userId}</a></td>
                        <td><a class="getBooks" data-id="${item.id}"><spring:message code="app.admin.listBooks"/></a></td>
                        <td>${item.totalPrice}</td>
                        <td id="${item.status}">${item.status}</td>
                        <td style="border: none">
                            <select  class="changeStatus" name="changeStatus" style="color: black" >
                                <option value="#"><spring:message code="app.admin.order.status"/></option>
                                <option id="completed" data-id="${item.id}" title="<spring:message code="app.user.order.completed"/>" value="completed"><spring:message code="app.user.order.completed"/></option>
                                <option id="processing" data-id="${item.id}" title="<spring:message code="app.user.order.processing"/>" value="processing"><spring:message code="app.user.order.processing"/></option>
                                <option id="canceled" data-id="${item.id}" title="<spring:message code="app.user.order.canceled"/>" value="canceled"><spring:message code="app.user.order.canceled"/></option>
                            </select>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <tg:paging pagedListHolder="${pagedListHolder}"
                       pagedLink="${pagedLink}" />
        </div>
    </div>
</div>
<script>
    $('.changeStatus').change(function(){
        var orderId = $(this).find(':selected').data('id');
        var value = $(this).val();
        changeStatusOrder(orderId,value);
    });
</script>
<script>
    function changeStatusOrder(id,value) {
        $.ajax({
            url: '/admin/user/order/status',
            method: 'POST',
            action: 'update',
            data:{id: id, value: value},
            success: function (response) {
                alert(response);
                location.reload();
                modal();

            },
            error:  function(xhr, str){
                alert('<spring:message code="app.page.error"/> ' + xhr.responseCode);
            }
        })
    }
</script>
<script>
    $(document).ready(function() {
        $('a.getBooks').click( function(event){
            event.preventDefault();
            var order_id = $(this).data('id');
            getBooksByOrder(order_id);
        })
    })
</script>
<script>
    function getBooksByOrder(id) {
        $.ajax({
            url: '/admin/user/order/books',
            method: 'GET',
            action: 'update',
            data:{id: id},
            success: function (response) {
                $("#table").html($(response).find("#tableBooks").html());
                setTimeout(modal(),1500);

            },
            error:  function(xhr, str){
                alert('<spring:message code="app.page.error"/> ' + xhr.responseCode);
            }
        })
    }
</script>
<script>
    function modal() {
        $('#myOverlayOrders').fadeIn(297, function () {
            $('#myModalOrders')
                .css('display', 'block')
                .animate({opacity: 1}, 198);
        });
        $('#myModal__closeOrders, #myOverlayOrders').click(function () {
            $('#myModalOrders').animate({opacity: 0}, 198,
                function () {
                    $(this).css('display', 'none');
                    $('#myOverlayOrders').fadeOut(297);
                });
            location.reload();
        });
    }
</script>
</body>
</html>