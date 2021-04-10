<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 026 26.01.21
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%-- Тут проверяю из куков какой был выбран язык  --%>
<html>
<head>
    <meta charset="utf-8">
    <title>Head</title>
    <link href="${pageContext.request.contextPath}/resources/static/css/info.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="container">
    <div id="wb_Heading1" style="position:absolute;left:2px;top:5px;width:599px;height:100px;z-index:29;">
        <h1 id="Heading1"><spring:message code="app.page.welcom"/></h1></div>
    <div id="wb_Text1" style="position:absolute;left:601px;top:5px;width:116px;height:16px;z-index:30;">
        <span style="color:#000000;font-family:Arial;font-size:13px;"><spring:message code="app.lang.title"/></span></div>
    <span class="changeLang" style="position:absolute;left:601px;top:21px;width:116px;height:28px;z-index:4;">
            <select id="locale" name="lang">
                <option id="en" value="en"  ><spring:message code="app.lang.eng"/></option>
                <option id="ru" value="ru" ><spring:message code="app.lang.ru"/></option>
            </select>
    </span>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
    </script>

    <%-- Смена языка через select --%>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#locale").change(function () {
                var selectedOption = $('#locale').val();
                if (selectedOption !== ''){
                    $('#locale').selected;
                    if (checkSimbol(replace(window.location.href.toString()))){

                        window.location.replace(replace(window.location.href.toString())+"&lang=" + selectedOption);
                        document.getElementById(selectedOption).selected = true;
                    }else{

                        window.location.replace(replace(window.location.href.toString())+"?lang=" + selectedOption);
                        document.getElementById(selectedOption).selected = true;
                    }
                }
            });
        });
        <%-- Тут я проверяю url на наличие параметров для того, что бы корректно добавить параметр для смены языка --%>
        function checkSimbol(url) {
            return -1 < url.indexOf('?');
        }
        function replace(url) {
            return url.replace('?lang=en','').replace('?lang=ru','').replace('&lang=en','').replace('&lang=ru','');
        }


    </script>


<%--    Отображается, если не авторизован--%>
    <div>
        <sec:authorize access="!isAuthenticated()">
            <input type="submit" id="Button1" name="registration" onclick="location.href='${pageContext.request.contextPath}/registration'; return false;" value="<spring:message code="app.page.registration"/>" style="position:absolute;left:888px;top:24px;width:178px;height:25px;z-index:5;">
            <input type="submit" id="Button2" name="login" onclick="location.href='${pageContext.request.contextPath}/login';return false;" value="<spring:message code="app.page.login"/>" style="position:absolute;left:1075px;top:24px;width:175px;height:25px;z-index:6;">
        </sec:authorize>
    </div>
<%--    Отоюражается, если аторизован--%>
    <div>
        <sec:authorize access="isAuthenticated()">
            <input type="submit" id="Button1" name="userInfo" onclick="location.href='${pageContext.request.contextPath}/getActiveUserInfo'; return false;" value="<spring:message code="app.page.userAccount"/>" style="position:absolute;left:850px;top:24px;width:220px;height:25px;z-index:5;">
            <input type="submit" id="Button2" name="userBasket" onclick="location.href='${pageContext.request.contextPath}/userBasket'" value="<spring:message code="app.page.userBasket"/>" style="position:absolute;left:1075px;top:24px;width:175px;height:25px;z-index:6;">
            <input type="submit" id="Button2" name="logout" onclick="location.href='${pageContext.request.contextPath}/logout'" value="<spring:message code="app.user.logout"/>" style="position:absolute;left:1075px;top:55px;width:175px;height:25px;z-index:6;">
        </sec:authorize>
        <sec:authorize access="hasRole('ADMIN')">
            <input type="submit" id="Button1" name="admin" onclick="location.href='${pageContext.request.contextPath}/admin'; return false;" value="<spring:message code="app.admin.panel"/>" style="position:absolute;left:850px;top:55px;width:220px;height:25px;z-index:5;">
        </sec:authorize>
    </div>
    <div id="wb_JavaScript1" style="position:absolute;left:744px;top:28px;width:100px;height:17px;z-index:34;">
        <div style="color:#000000;font-size:14px;font-family:Times New Roman;font-weight:normal;font-style:normal;text-align:center;text-decoration:none" id="basicclock"></div>
        <script>
            function clock()
            {
                var digital = new Date();
                var hours = digital.getHours();
                var minutes = digital.getMinutes();
                var seconds = digital.getSeconds();
                if (minutes <= 9) minutes = "0" + minutes;
                if (seconds <= 9) seconds = "0" + seconds;
                dispTime = hours + ":" + minutes + ":" + seconds;
                var basicclock = document.getElementById('basicclock');
                basicclock.innerHTML = dispTime;
                setTimeout("clock()", 1000);
            }
            clock();
        </script>

    </div>
<%--    Вывод всех книг--%>
    <input type="button" id="Button3" name="listBooks" onclick="location.href='${pageContext.request.contextPath}/getAllBooks?sort=id&ascending=true';return false;" value="<spring:message code="app.page.listB"/>" style="position:absolute;left:195px;top:112px;width:269px;height:36px;z-index:35;"/>
<%--    вывод всех авторов--%>
    <input type="button" id="Button4" name="listAuthors" onclick="location.href='${pageContext.request.contextPath}/getAllAuthors?sort=id&ascending=true';return false;" value="<spring:message code="app.page.listA"/>" style="position:absolute;left:733px;top:112px;width:269px;height:36px;z-index:36;"/>
<%--    все жанры--%>
    <input type="button" id="genreButton" name="genre" onclick="location.href='${pageContext.request.contextPath}/allGenre';return false;" value="<spring:message code="app.page.genre"/>"  style="position:absolute;left:464px;top:112px;width:269px;height:36px;z-index:37;"/>
<%--    возврат на главную стр--%>
    <input type="button" id="Button8" name="Главная" onclick="location.href='${pageContext.request.contextPath}/index'; return false;" value="<spring:message code="app.page.index"/>" style="position:absolute;left:2px;top:112px;width:193px;height:36px;z-index:43;"/>

    <form name="searchForm" onsubmit="return doSearch();" >
        <input type="text" id="idAuthor" style="position:absolute;left:1007px;top:120px;width:140px;height:22px;z-index:12;" name="searchString" spellcheck="false" placeholder="" role="searchbox">
        <select name="whatSearch" style="position:absolute;left:1007px;top:144px;width:139px;height:16px;z-index:14;">
            <option selected value="${pageContext.request.contextPath}/getBookByName/?sort=id&ascending=true&search="><spring:message code="app.page.inStrBook"/> </option>
            <option value="${pageContext.request.contextPath}/getAuthorByName/?sort=id&ascending=true&search=" ><spring:message code="app.page.inStrAuthor"/></option>
        </select>
        <input type="submit"  id="Button6"  value="<spring:message code="app.page.search"/>" style="position:absolute;left:1152px;top:119px;width:96px;height:25px;z-index:13;">
    </form>



</div>
<script>
    function doSearch() {
        var sf=document.searchForm;
        var submitTo = sf.whatSearch.options[sf.whatSearch.selectedIndex].value + encodeURIComponent(sf.searchString.value);
        window.location.href = submitTo;
        return false;
    }
</script>
<script>
    var xx = document.cookie.replace("org.springframework.web.servlet.i18n.CookieLocaleResolver.LOCALE=","");
    $(document).ready(function() {
        document.getElementById(xx).selected = true;
    })
</script>
</body>
</html>
