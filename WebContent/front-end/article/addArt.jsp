<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.art.model.*"%>

<%
	ArticleVO artVO = (ArticleVO) request.getAttribute("ArticleVO");
	
%>



<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工資料新增 - addEmp.jsp</title>




</head>
<body bgcolor='white'>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/ckeditor2/ckeditor.js"></script>
<script>
$(document).ready(function() {
	   CKEDITOR.replace('ldExpr');
	   console.log("ready!");
	  });
</script>



<!-- 	<h3>資料新增:</h3> -->

	<%-- 錯誤表列 --%>
	
	
	<div class="addView">
	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="<%=request.getContextPath()%>/art/art.do" name="form1">
	<c:if test="${not empty errorMsgs}">
<!-- 		<font style="color: red">請修正以下錯誤:</font> -->
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
		<div id="addTop">
			文章分類:
			<input  type="radio" name="artcNo" value="17001" checked>心得
			<input  type="radio" name="artcNo" value="17002">知識
			<input  type="radio" name="artcNo" value="17003">裝備
			<input  type="radio" name="artcNo" value="17004">新聞
			<input  type="radio" name="artcNo" value="17005">其他
			<br>
				文章標題:
				<input type="TEXT" name="artTitle" size="20	" autocomplete="off" placeholder="請輸入標題"
				required value="<%=(artVO == null) ? "" : artVO.getArtTitle()%>" />
			<br>
			預覽圖片:
				<input type="file" id="myArtFile" name="artPic" size="45"
					value="<%=(artVO == null) ? "預覽圖片" : artVO.getArtPic()%>" />
					<div id="myArtpreviewDad">
						 <div id="myArtpreview"></div>
				 </div>
			<br>
		</div>
		 <input type="hidden" name="myArtfilename" id="filename">

		
	<div id="addCkedit">
		<div class=ckedit>
			文章內容:
			<textarea id="ldExpr" name="artText" cols="32" rows="50" required></textarea>
		</div>
	</div>	
	<div id="addButton">
			<div id="addSend">
				<input type="hidden" name="memId" size="45" value="${memberVO.memId}" >
				<input type="hidden" name="artCount" size="45" value="1" >
				<input type="hidden" name="artStatus" size="1"value="1" >
				 <input type="hidden"name="action" value="insert"> 
				<input class="submit" type="submit"value="分享文章">
			</div>
<!-- 			<div id="addSave"> -->
<%-- 				<input type="hidden" name="memId" size="45" value="${memberVO.memId}" > --%>
<!-- 				<input type="hidden" name="artCount" size="45" value="1" > -->
<!-- 				<input type="hidden" name="artStatus" size="1"value="0" /> -->
<!-- 				 <input type="hidden"name="action" value="insert">  -->
<!-- 				<input type="submit"value="存為草稿"> -->
<!-- 			</div> -->
		</div>	
	</FORM>

</div>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/styleWen.css">
    <script type="text/javascript">

      
        
        $(document).ready(function(){
        	init2();
        })
        
        
        function init2() {

            let myFile = document.getElementById("myArtFile");
            let filename = document.getElementById("myArtfilename");
            let preview = document.getElementById('myArtpreview');

            myFile.addEventListener('change', function(e) {
                let files = e.target.files;
                if (files) {
                    let file = files[0];
                    if (file.type.indexOf('image') > -1) {


                        let reader = new FileReader();
                        reader.addEventListener('load', function(e) {
                            console.log(e);
                            let result = e.target.result;
                            
                            let img = document.createElement('img');
                            img.setAttribute('src', result);
                            $("#myArtpreview").empty();
                            preview.append(img);
                        });
                        reader.readAsDataURL(file); 
                    } else {
                        alert('請上傳圖片！');
                    }
                }
            });
        }
    </script>
</body>


</html>