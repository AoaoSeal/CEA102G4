<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.leader.model.*"%>

<!DOCTYPE html>
<html>
<head>
<title>新增 addEmp.jsp</title>
</head>
<body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resource/ckeditor/ckeditor.js"></script>
<style>
	.form-group input[type=file]{
		opacity: 1!important;
		background-color: #FFFFFF!important;
	    border: 1px solid #DDDDDD!important;
	    border-radius: 4px!important;
	    color: #66615b!important;
	    line-height: normal!important;
	    height: 34px!important;
	    font-size: 16px!important;
	    width:100%!important;
	    position: relative!important;
	}
	#btnInsert{
		background-color: #51cbce;
	    color: #FFFFFF;
	    border-radius: 30px;
	    width: 100px;
	    height: 40px;
		font-size:18px;
	}

 	div.content{	 
 		margin-left: 100px; 
 		font-size:18px!important;

 	} 
	.footer {
		position: relative!important;
	}
</style>
<% LdVO ldVO = (LdVO) request.getAttribute("ldVO");%>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
		<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="content">
	<div class="row">
	<div class="col-md-8">
	  <div class="card card-user">
	    <div class="card-header">
	      <h5 class="card-title">新增領隊資料</h5>
	    </div>
	    <div class="card-body">
	      <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/leader/ld.do" enctype="multipart/form-data">
	        <div class="row">
	        <div  class="col-md-2"></div>
	        <div class="col-md-8 pr-1">
	            <div class="form-group">
	              <label>姓名</label>
	              <input type="text" class="form-control" name="ldName">
	            </div>
	          </div>
<!-- 	          <div class="col-md-5 pr-1"> -->
<!-- 	            <div class="form-group"> -->
<!-- 	              <label>領隊編號</label> -->
<%-- 	              <input type="text" class="form-control" disabled="" value="<%=ldVO.getLdNo()%>"> --%>
<!-- 	            </div> -->
<!-- 	          </div> -->
			</div>
<!-- 			<div class="row"> -->
<!-- 			<div  class="col-md-2"></div> -->
<!-- 	          <div class="col-md-5 pl-1"> -->
<!-- 	          	<div class="form-group"> -->
<!-- 	              <label for="exampleInputEmail1">Email</label> -->
<!-- 	              <input type="hidden" class="form-control" name="ldMail"> -->
<!-- 	            </div>	             -->
<!-- 	          </div> -->
<!-- 	          <div class="col-md-3 px-1"> -->
<!-- 	            <div class="form-group"> -->
<!-- 	              <label>密碼</label> -->
<!-- 	              <input type="hidden" class="form-control" name="ldPass"> -->
<!-- 	            </div> -->
<!-- 	          </div> -->
<!-- 	        </div> -->
	        <div class="row">
	        <div  class="col-md-2"></div>
			 <div class="col-md-8">
	            <div class="form-group">
	              <label>領隊照片</label>
	              <input type="file" name="ldPic" id="imgInp">
	            </div>
	          </div>
	        </div>
	        <div class="row">	  
	        <div  class="col-md-2"></div>   
   
	          	<div class="col-md-8">
	            <div class="form-group">
	              <label>圖片預覽</label><br>
	              <img id="preview" width="150" height="150" src="<%= request.getContextPath()%>/leader/ldPic.do?ldNo=${ldVO.ldNo}">
	            </div>
	          </div>
	        </div>

	        <div class="row">
	        <div  class="col-md-2"></div>
	          <div class="col-md-8">
	            <div class="form-group">
	              <label>經歷介紹:</label>
	             <textarea name="ldExpr" cols="32" rows="5"></textarea>
	            </div>
	          </div>
	        </div>
	        <div class="row">
	        <div  class="col-md-8"></div>
	          <div class="update ml-auto mr-auto">
				<input type="hidden" name="action" value="insert">
				<input id="btnInsert" type="submit" value="新增">	
	          </div>
	        </div>
	      </Form>
	    </div>
	  </div>
	</div>
 	</div>
</div>

<script type="text/javascript">
	$('#imgInp').change(function() {
		  let file = $('#imgInp')[0].files[0];
		  let reader = new FileReader;
		  reader.onload = function(e) {
		    $('#preview').attr('src', e.target.result);
		  };
		  reader.readAsDataURL(file);
		});


	  $(document).ready(function() {
	   CKEDITOR.replace('ldExpr');
	   console.log("ready!");
	  });



</script>
</body>
</html>