<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 021 21.03.21
  Time: 16:24
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
    <link href="${pageContext.request.contextPath}/resources/static/css/addBook.css" rel="stylesheet"  type="text/css">
    <link href="${pageContext.request.contextPath}/resources/static/css/editBook.css" rel="stylesheet"  type="text/css">

</head>
<body id="bodyEditBook">
<jsp:include page="admin.jsp"/>
<div id="container">
    <div id="pageEditBook">

        <div id="myModal" style="width: 350px; height: 200px">
            <form method="POST" id="uploadFile" action="#" enctype="multipart/form-data">
                <p style="position: absolute; bottom: 150px;top: 30px;left: 60px"><spring:message code="app.admin.upload"/></p><br/>
                <input id="file" type="file" name="file" accept="image/*" style="visibility: hidden"/><br/><br/>
                <input type="button" onclick="document.getElementById('file').click()" value="<spring:message code="app.admin.upload.file"/>" style="position: absolute;top:90px;left: 30%;width: 120px"/>
                <a id="upload" class="pointer" onclick="dynamicUpload()" style="position: absolute; top: 70%;left: 33%; cursor: pointer;background: #e6e6e6;border: outset;width: 100px;text-decoration: none;color: black;"><spring:message code="app.user.save"/></a>
            </form>
            <span id="myModal__close" class="close">ₓ</span>
        </div>
        <div id="myOverlay"></div>

        <div id="myModalDescription" style="width: 350px; height: 200px">
            <form method="POST" id="uploadFileDescription" action="" enctype="multipart/form-data">
                <p style="position: absolute; bottom: 150px;top: 30px;left: 60px"><spring:message code="app.admin.uploadBio"/> </p><br/>
                <input id="fileDescription" accept="text/*" type="file" name="file" style="visibility: hidden"/><br/><br/>
                <input type="button" onclick="document.getElementById('fileDescription').click()" value="<spring:message code="app.admin.upload.file"/>" style="position: absolute;top:90px;left: 30%;width: 120px"/>
                <a id="uploadDescription" class="pointer" onclick="dynamicUploadDesc()" style="position: absolute; top: 70%;left: 33%; cursor: pointer;background: #e6e6e6;border: outset;width: 100px;text-decoration: none;color: black;"><spring:message code="app.user.save"/></a>
            </form>
            <span id="myModalDescription__close" class="close">ₓ</span>
        </div>
        <div id="myOverlayDescription"></div>


        <div id="editingBook">
            <div class="form-wrap" >
                <div class="profile"><img id="idImgBook" src="${pageContext.request.contextPath}/${bookForm.urlImg}" width="270" height="330">
                    <h1 id="h1EditBook"><spring:message code="app.admin.bookFace"/></h1>
                    <h2 title="Загрузка новой обложки" id="h2EditBook"><a id="uploadNewImg" href="#"><img id="idCover" src="${pageContext.request.contextPath}/resources/static/images/book.png" width="75" height="75"/></a></h2>
                    <p style="position: absolute; left: 147px; bottom: 20%;width: 50px"><spring:message code="app.admin.edit"/></p>
                </div>
                <%--@elvariable id="bookForm" type="com.maxlaptsev.shop.model.Book"--%>
                <form:form id="formNewBook" cssStyle="background: white" modelAttribute="bookForm" method="post" action="">
                    <form:hidden path="urlImg" id="url" value="${bookForm.urlImg}"/>
                    <form:hidden path="description" id="description" value="${bookForm.description}"/>
                    <div>
                        <label><spring:message code="app.table.nameBook"/></label>
                        <form:input id="input" path="name" type="text" name="name" placeholder="${bookForm.name}"/>
                        <form:errors path="name" cssClass="error"/>
                    </div>
                    <div>
                        <label><spring:message code="app.livrary.publish"/></label>
                        <form:input id="input" path="publisher" type="text" name="publisher" placeholder="${bookForm.publisher}"/>
                        <form:errors path="publisher" cssClass="error"/>
                    </div>
                    <div>
                        <label><spring:message code="app.table.pages"/></label>
                        <form:input id="pages" path="pages" pattern="^[0-9]+$" type="number" min="0" name="pages" placeholder="${bookForm.pages}"/>
                        <form:errors path="pages" cssClass="error"/>
                    </div>
                    <div>
                        <label><spring:message code="app.book.language"/></label>
                        <form:input id="input" path="language" type="text" name="language" placeholder="${bookForm.language}"/>
                        <form:errors path="language" cssClass="error"/>
                    </div>
                    <div>
                        <label><spring:message code="app.table.price"/></label>
                        <form:input id="price" path="price" type="number" min="0" step="0.01" pattern="^([1-9][0-9]*)+(\\.[0-9]{1,2})?$" name="price" placeholder="${bookForm.price}"/>
                        <form:errors path="price" cssClass="error"/>
                    </div>
                    <div>
                        <label><spring:message code="app.book.quantity"/></label>
                        <form:input id="quantity"  path="quantityBook.quantity" pattern="^[0-9]+$" type="number" min="0" name="quantity" placeholder="${bookForm.quantityBook.quantity}"/>
                        <form:errors path="quantityBook.quantity" cssClass="error"/>
                    </div>
                    <div>
                        <label><spring:message code="app.page.author"/></label>
                        <form:errors path="authors" cssClass="error"/>
                        <button id="choseAuthor"><spring:message code="app.admin.listAuthors"/></button>
                        <div id="modalAuthors">
                            <form:checkboxes id="selectAuthor" path="authors" items="${authors}" itemValue="id" itemLabel="nameAndLastName" element="span class='checkbox'" />
                            <form:errors path="authors" cssClass="error"/>
                            <span id="modalAuthors__close" class="close">ₓ</span>
                        </div>
                        <div id="overlayAuthors"></div>
                    </div>
                    <div id="divGenreChose">
                        <label><spring:message code="app.page.genre"/></label>
                        <form:errors path="genre" cssClass="error"/>
                        <button id="choseGenre"><spring:message code="app.admin.choose"/></button>
                        <div id="modalGenre">
                            <form:checkboxes id="selectAuthor" path="genre" items="${genre}" element="span class='checkbox'" />

                            <span id="modalGenre__close" class="close">ₓ</span>
                        </div>
                        <div id="overlayGenre"></div>
                    </div>
                    <div id="desc">
                        <button id="uploadDesc"><spring:message code="app.admin.book.desc.add"/></button>
                    </div>
                    <button id="changeButton" type="submit"><spring:message code="app.user.save"/></button>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script>
    $('#formNewBook').submit(function () {
        if ($('#quantity').val() ===""){
            $('#quantity').val(0);
        }
        if($('#price').val()==="") {
            $('#price').val(0);
        }
        if($('#pages').val()==="") {
            $('#pages').val(0);
        }
    })
</script>

<script>
    function overlayGet() {
        $('#overlayAuthors').fadeIn(297, function () {
            $('#modalAuthors')
                .css('display', 'block')
                .animate({opacity: 1}, 198);
        });
        $('#modalAuthors__close, #overlayAuthors').click(function () {
            $('#modalAuthors').animate({opacity: 0}, 198,
                function () {
                    $(this).css('display', 'none');
                    $('#overlayAuthors').fadeOut(297);
                });
        });
    }
</script>
<script>
    function overlayGetGenre() {
        $('#overlayGenre').fadeIn(297, function () {
            $('#modalGenre')
                .css('display', 'block')
                .animate({opacity: 1}, 198);
        });
        $('#modalGenre__close, #overlayGenre').click(function () {
            $('#modalGenre').animate({opacity: 0}, 198,
                function () {
                    $(this).css('display', 'none');
                    $('#overlayGenre').fadeOut(297);
                });
        });
    }
</script>

<script>
    $(document).ready(function () {
        $('#choseAuthor').click(function (event) {
            event.preventDefault();
            overlayGet();
        })
    });
    $(document).ready(function () {
        $('#choseGenre').click(function (event) {
            event.preventDefault();
            overlayGetGenre();
        })
    });
</script>

<script>
    $(document).ready(function() {
        $('#uploadNewImg').click( function(event){
            event.preventDefault();

            $('#myOverlay').fadeIn(297, function(){
                $('#myModal')
                    .css('display', 'block')
                    .animate({opacity: 1}, 198);
            });

            $('#myModal__close, #myOverlay').click( function(){
                $('#myModal').animate({opacity: 0}, 198,
                    function(){
                        $(this).css('display', 'none');
                        $('#myOverlay').fadeOut(297);
                    });
            });
        })
    });
</script>
<script>
    document.getElementById('file').addEventListener('change',prepareUpload,false);

    function prepareUpload(event) {
        var files = event.target.files;
        var fileName = files[0].name;
        newAtt(fileName);
    }

    function newAtt(name) {
        var el = document.getElementById('url');
        el.setAttribute('value','resources/static/images/'+name);
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
                alert(data);
            }
        });
    }
</script>
<script>
    $(document).ready(function () {
        $('#uploadDesc').click(function (event) {
            event.preventDefault();

            $('#myOverlayDescription').fadeIn(297, function () {
                $('#myModalDescription')
                    .css('display', 'block')
                    .animate({opacity: 1}, 198);
            });
            $('#myModalDescription__close, #myOverlayDescription').click(function () {
                $('#myModalDescription').animate({opacity: 0}, 198,
                    function () {
                        $(this).css('display', 'none');
                        $('#myOverlayDescription').fadeOut(297);
                    });
            });
        })
    })
</script>
<script>
    function dynamicUploadDesc(){

        var formElement = $("[id='uploadFileDescription']")[0];
        var fd = new FormData(formElement);
        var fileInput = $("[id='fileDescription']")[0];
        fd.append('fileDescription', fileInput.files[0] );
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
                    changeDescUrl(name);
                }
                alert(data);
            }
        });
    }
</script>
<script>
    function changeDescUrl(name) {
        var el = document.getElementById('description');
        el.setAttribute('value','resources/static/text/'+name);
    }
</script>
<script>
    function successUpload(url) {
        var el = document.getElementById('idImgBook');
        el.setAttribute('src','${pageContext.request.contextPath}/resources/static/images/'+url);
    }
</script>
</body>
</html>

