<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 021 21.03.21
  Time: 20:11
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
    <title>Editing book</title>

    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/addAuthor.css" rel="stylesheet"  type="text/css">

</head>
<body id="bodyEditBook">
<jsp:include page="admin.jsp"/>
<div id="container">
    <c:if test="${success.length()>1}">
        <script>
            alert(${success});
        </script>
    </c:if>
    <div id="pageEditBook">
        <div id="myModal" style="width: 350px; height: 200px">
            <form method="POST" id="uploadFile" action="" enctype="multipart/form-data">
                <p style="position: absolute; bottom: 150px;top: 30px;left: 60px"><spring:message code="app.admin.upload"/></p><br/>
                <input id="file" type="file" name="file" style="visibility: hidden"/><br/><br/>
                <input type="button" onclick="document.getElementById('file').click()" value="<spring:message code="app.admin.upload.file"/>" style="position: absolute;top:90px;left: 30%;width: 120px"/>
                <a id="upload" class="pointer" onclick="dynamicUpload()" style="position: absolute; top: 70%;left: 33%; cursor: pointer;background: #e6e6e6;border: outset;width: 100px;text-decoration: none;color: black;"><spring:message code="app.user.save"/></a>
            </form>
            <span id="myModal__close" class="close">ₓ</span>
        </div>
        <div id="myOverlay"></div>

        <div id="myModal0" style="width: 350px; height: 200px">
            <form method="POST" id="uploadFile0" action="" enctype="multipart/form-data">
                <p style="position: absolute; bottom: 150px;top: 30px;left: 60px"><spring:message code="app.admin.uploadBio"/> </p><br/>
                <input id="file0" type="file" name="file" style="visibility: hidden"/><br/><br/>
                <input type="button" onclick="document.getElementById('file0').click()" value="<spring:message code="app.admin.upload.file"/>" style="position: absolute;top:90px;left: 30%;width: 120px"/>
                <a id="upload0" class="pointer" onclick="dynamicUploadBio()" style="position: absolute; top: 70%;left: 33%; cursor: pointer;background: #e6e6e6;border: outset;width: 100px;text-decoration: none;color: black;"><spring:message code="app.user.save"/></a>
            </form>
            <span id="myModal__close0" class="close">ₓ</span>
        </div>
        <div id="myOverlay0"></div>

        <div id="editingBook">
            <div class="form-wrap">
                <div class="profile"><img id="idImgAuthor" src="${pageContext.request.contextPath}/${authorForm.urlImg}" width="270" height="330">
                    <h1 id="h1EditBook"><spring:message code="app.author.photo"/></h1>
                    <h2 title="Загрузка новой обложки" id="h2EditBook"><a id="uploadNewImg" href="#"><img id="idCover" src="${pageContext.request.contextPath}/resources/static/images/book.png" width="75" height="75"/></a></h2>
                    <p style="position: absolute; left: 147px; bottom: 35px;width: 50px"><spring:message code="app.admin.edit"/></p>
                </div>
                <%--@elvariable id="authorForm" type="com.maxlaptsev.shop.model.Author"--%>
                <form:form cssStyle="background: white" modelAttribute="authorForm" method="post" action="">
                    <form:hidden id="bio" path="bio" name="bio" value="${authorForm.bio}" />
                    <form:hidden path="urlImg" id="url" value="${authorForm.urlImg}" />
                    <div>
                        <label><spring:message code="app.user.name"/></label>
                        <form:input id="input" path="name" type="text"  name="name" placeholder="${authorForm.name}"/>
                        <form:errors path="name" cssClass="error"/>
                    </div>
                    <div>
                        <label><spring:message code="app.user.lastname"/></label>
                        <form:input id="input" path="lastName" type="text" name="lastName" placeholder="${authorForm.lastName}"/>
                        <form:errors path="lastName" cssClass="error"/>
                    </div>

                    <div>
                        <label><spring:message code="app.author.bio"/></label>
                        <form:errors path="bio" cssClass="error"/>
                        <button id="uploadBio"><spring:message code="app.admin.up"/></button>
                    </div>
                    <button id="changeButton" type="submit"><spring:message code="app.user.save"/></button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#uploadNewImg').click( function(event){
            event.preventDefault();
            myOverlay('');
        })
    });
    $(document).ready(function () {
        $('#uploadBio').click(function (event) {
            event.preventDefault();
            myOverlay(0);
        })
    })
</script>
<script>
    function myOverlay(val) {
        var overlayMy = '#myOverlay'+val;
        var myModal = '#myModal'+val;
        var closeOver = '#myModal__close'+val+','+'#myOverlay'+val;
        $(overlayMy).fadeIn(297, function(){
            $(myModal)
                .css('display', 'block')
                .animate({opacity: 1}, 198);
        });

        $(closeOver).click( function(){
            $(myModal).animate({opacity: 0}, 198,
                function(){
                    $(this).css('display', 'none');
                    $(overlayMy).fadeOut(297);
                });
        });
    }
</script>
<script>
    function dynamicUpload(){

        var formElement = $("[id='uploadFile']")[0];
        var fd = new FormData(formElement);
        var fileInput = $("[id='file']")[0];
        fd.append('file', fileInput.files[0] );
        var name = fileInput.files[0].name;


        console.log(fd);

        $.ajax({
            url: '${pageContext.request.contextPath}/admin/upload',
            data: fd,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
                successUpload(name);
                changeImgUrl(name);
                alert(data);
            }
        });
    }
</script>
<script>
    function dynamicUploadBio(){

        var formElement = $("[id='uploadFile0']")[0];
        var fd = new FormData(formElement);
        var fileInput = $("[id='file0']")[0];
        fd.append('file0', fileInput.files[0] );
        var name = fileInput.files[0].name;
        console.log(fd);

        $.ajax({
            url: '${pageContext.request.contextPath}/admin/upload/bio',
            data: fd,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function(data){
                if(data === "Вы удачно загрузили "+name || data === "You have successfully downloaded "+name){
                    changeBioUrl(name);
                }
                alert(data);
            }
        });
    }
</script>
<script>
    function changeImgUrl(name) {
        var el = document.getElementById('url');
        el.setAttribute('value','resources/static/images/'+name);
    }
</script>

<script>
    function changeBioUrl(name) {
        var el = document.getElementById('bio');
        el.setAttribute('value','resources/static/text/'+name);
    }
</script>
<script>
    function successUpload(url) {
        var el = document.getElementById('idImgAuthor');
        el.setAttribute('src','${pageContext.request.contextPath}/resources/static/images/'+url);
    }
</script>
</body>
</html>
