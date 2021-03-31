<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 021 21.03.21
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Editing user</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/editUser.css" rel="stylesheet"  type="text/css">
</head>
<body id="bodyEditBook">
<jsp:include page="admin.jsp"/>
<script>
    function changeStatus(what,id){
        var selectedopt=what.options[what.selectedIndex];
        var value = selectedopt.value;
        changeStatusOrder(id,value);
    }
</script>


<div id="container">
    <div id="pageEditBook">
        <%-- 1-Img, 0-Bio, 2-lookBio --%>
        <div id="myModal" style="width: 350px; height: 200px">
            <div id="divTable"></div>
            <span id="myModal__close" class="close">ₓ</span>
        </div>
        <div id="myOverlay"></div>

        <div id="myModal0" style="width: 350px; height: 200px">

            <span id="myModal__close0" class="close">ₓ</span>
        </div>
        <div id="myOverlay0"></div>


        <div id="editingBook">
            <div class="form-wrap">
                <div class="profile">
                    <p style="text-align: center; background: none">User Info</p>
                    <div>
                        <label>id</label>
                        <p>${userForm.userInfo.id}</p>
                    </div>
                    <div>
                        <label>name</label>
                        <p>${userForm.userInfo.name}</p>
                    </div>
                    <div>
                        <label>lastname</label>
                        <p>${userForm.userInfo.lastName}</p>
                    </div>
                    <div>
                        <label>phoneNumber</label>
                        <p>${userForm.userInfo.phoneNumber}</p>
                    </div>
                    <div>
                        <label>email</label>
                        <p>${userForm.userInfo.email}</p>
                    </div>
                </div>
                <%--@elvariable id="userForm" type="com.maxlaptsev.shop.model.User"--%>
                <form:form name="formUser" cssStyle="background: white; height: 551px" modelAttribute="userForm" method="post" action="" >
                    <form:hidden path="password" value="${userForm.password}"/>
                    <form:hidden path="userInfo" value="${userForm.userInfo.id}"/>
                    <form:hidden  path="id" name="id" value="${userForm.id}"/>
                    <form:hidden  path="username" name="username" value="${userForm.username}"/>
                    <p style="text-align: center; background: none;color: black">User</p>
                    <div>
                        <label style="color: black">ID</label>
                        <p style="width: 100%;padding: 10px 15px;border-width: 0;background: #e6e6e6;outline: none;margin: 0;text-align: left;color: black">${userForm.id}</p>
                    </div>
                    <div>
                        <label style="color: black">Login</label>
                        <p style="width: 100%;padding: 10px 15px;border-width: 0;background: #e6e6e6;outline: none;margin: 0;text-align: left;color: black">${userForm.username}</p>
                    </div>
                    <div>
                        <label style="color: black">Role</label>
                        <p style="width: 100%;padding: 10px 15px;border-width: 0;background: #e6e6e6;outline: none;margin: 0;text-align: left;color: black">${userForm.role}</p>
                        <form:select path="role">
                            <form:options items="${roles}" itemValue="id"></form:options>
                        </form:select>
                    </div>
                    <div>
                        <label style="color: black">Заказы</label>
                        <div id="modalOrder">
                            <table class="table">
                                <tr>
                                    <th width="20px">Id</th>
                                    <th style="border-bottom: black">date</th>
                                    <th style="border-bottom: black">totalprice</th>
                                    <th style="border-bottom: black">Status</th>
                                </tr>
                                <c:forEach items="${userForm.orders}" var="order">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>${order.dataTimestamp}</td>
                                        <td>${order.totalPrice}</td>
                                        <td id="${order.status}">${order.status}</td>
                                        <td style="border: none">
                                                <select  class="changeStatus" name="changeStatus" >
                                                    <option value="#">Выбрать статус</option>
                                                    <option data-id="${order.id}" title="<spring:message code="app.user.order.completed"/>" value="completed"><spring:message code="app.user.order.completed"/></option>
                                                    <option data-id="${order.id}" title="<spring:message code="app.user.order.processing"/>" value="processing"><spring:message code="app.user.order.processing"/></option>
                                                    <option data-id="${order.id}" title="<spring:message code="app.user.order.canceled"/>" value="canceled"><spring:message code="app.user.order.canceled"/></option>
                                                </select>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <span id="modalOrder__close" class="close">ₓ</span>
                        </div>
                        <div id="orderOverlay"></div>
                        <button id="userOrders">Просмотреть</button>
                    </div>
                    <button id="changeButton" type="submit"><spring:message code="app.user.save"/></button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#userOrders').click( function(event){
            event.preventDefault();
            modal();
        })
    });
</script>
<script>
    $('.changeStatus').change(function(){
        var orderId = $(this).find(':selected').data('id');
        var value = $(this).val();
        changeStatusOrder(orderId,value);
    });
</script>
<script>
    function modal() {
        $('#orderOverlay').fadeIn(297, function () {
            $('#modalOrder')
                .css('display', 'block')
                .animate({opacity: 1}, 198);
        });
        $('#modalOrder__close, #orderOverlay').click(function () {
            $('#modalOrder').animate({opacity: 0}, 198,
                function () {
                    $(this).css('display', 'none');
                    $('#orderOverlay').fadeOut(297);
                });
        });
    }
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
</body>
</html>
