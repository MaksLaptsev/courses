<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 021 21.03.21
  Time: 12:38
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
    <title>Editing author</title>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/static/css/editAuthor.css" rel="stylesheet"  type="text/css">
</head>
<body id="bodyEditBook">
<jsp:include page="admin.jsp"/>



<div id="container">
    <div id="pageEditBook">
        <%-- 1-Img, 0-Bio, 2-lookBio --%>
            <div id="myModal1" style="width: 350px; height: 200px">
                    <form method="POST" id="uploadFile1" action="" enctype="multipart/form-data">
                        <p style="position: absolute; bottom: 150px;top: 30px;left: 60px"><spring:message code="app.admin.upload"/> </p><br/>
                        <input id="file1" type="file" name="file" style="position: absolute;top:90px;left: 65px"/><br/><br/>
                        <a title="Сохранить" class="pointer" id="upload1" onclick="dynamicUpload()" style="position: absolute; top: 61%;left: 40%"><img src="${pageContext.request.contextPath}/resources/static/images/upload.png" width="75" height="75"></a>
                    </form>
                <span id="myModal__close1" class="close">ₓ</span>
            </div>
            <div id="myOverlay1"></div>

            <div id="myModal2" style="width: 350px; height:fit-content">
                <p><c:import url="${pageContext.request.contextPath}/${authorForm.bio}" var ="bio" charEncoding="UTF-8"/><c:out value="${bio}"/></p>
                <span id="myModal__close2" class="close">ₓ</span>
            </div>
            <div id="myOverlay2"></div>

            <div id="myModal0" style="width: 350px; height: 200px">
                <form method="POST" id="uploadFile0" action="" enctype="multipart/form-data">
                        <p style="position: absolute; bottom: 150px;top: 30px;left: 60px"><spring:message code="app.admin.uploadBio"/></p><br/>
                    <input id="file0" type="file" name="file" style="position: absolute;top:90px;left: 65px"/><br/><br/>
                    <a title="Сохранить" class="pointer" id="upload0" onclick="dynamicUploadBio()" style="position: absolute; top: 61%;left: 40%"><img src="${pageContext.request.contextPath}/resources/static/images/upload.png" width="75" height="75"></a>
                </form>
                <span id="myModal__close0" class="close">ₓ</span>
            </div>
            <div id="myOverlay0"></div>


        <div id="editingBook">
            <div class="form-wrap">
                <div class="profile"><img id="idImgAuthor" src="${pageContext.request.contextPath}/${authorForm.urlImg}" width="270" height="330">
                    <h1 id="h1EditBook"><spring:message code="app.author.photo"/></h1>
                    <h2 title="Загрузка новой обложки" id="h2EditBook"><a id="uploadNewImg" href="#"><img id="idCover" src="${pageContext.request.contextPath}/resources/static/images/book.png" width="75" height="75"/></a></h2>
                    <p style="position: absolute; left: 147px; bottom: 35px"><spring:message code="app.admin.edit"/></p>
                </div>
                <%--@elvariable id="authorForm" type="com.maxlaptsev.shop.model.Author"--%>
                <form:form cssStyle="background: white; height: 551px" modelAttribute="authorForm" method="post" action="" >
                    <form:hidden id="bio" path="bio" value="${authorForm.bio}"/>
                    <form:hidden id="url" path="urlImg"  value="${authorForm.urlImg}"/>
                    <div>
                        <label><spring:message code="app.user.name"/></label>
                        <form:input id="input" path="name" type="text" name="name" placeholder="${authorForm.name}"/>
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
                        <button id="authorBio" ><spring:message code="app.admin.author.look"/></button><button id="authorBioChange" onclick=""><spring:message code="app.admin.edit"/></button>
                    </div>
                    <button id="changeButton" type="submit"><spring:message code="app.user.save"/></button>
                </form:form>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#authorBio').click(function (event) {
                event.preventDefault();
                myOverlay(2);
            })
        });

        $(document).ready(function () {
            $('#authorBioChange').click(function (event) {
                event.preventDefault();
                myOverlay(0);
            })
        })
    </script>
    <script>
        $(document).ready(function() {
            $('#uploadNewImg').click( function(event){
                event.preventDefault();
                myOverlay(1);
            })
        });
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
                    if(data === "Вы удачно загрузили "+name){
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
        function dynamicUpload(){

            var formElement = $("[id='uploadFile1']")[0];
            var fd = new FormData(formElement);
            var fileInput = $("[id='file1']")[0];
            fd.append('file1', fileInput.files[0] );
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
        function successUpload(url) {
            var el = document.getElementById('idImgAuthor');
            el.setAttribute('src','${pageContext.request.contextPath}/resources/static/images/'+url);
        }
    </script>
</div>
</body>
</html>
