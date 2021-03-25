<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="java.util.*" %>
<%@ page import="com.leader.model.*" %>



<html>
<head>
<title>listOneEmp.jsp</title>
</head>
<body>
<style>
	 div.content{	 
	 	top:100px;
 		margin-left: 200px; 
 		margin-bottom:100px;
 		font-size:18px!important;
 	} 
	.footer {
		position: relative!important;
	}
	#btnHome {
    margin-left: 70px;
    width: 100px;
    height: 45px;
    font-size: 18px;
    border-radius: 10px;
    border:1px solid #26BEC9;
    background-color: #26BEC9;
    color: #fff;
    opacity: 0.7;
	}

</style>
<%	LdVO ldVO = (LdVO) request.getAttribute("ldVO"); %>
     <div class="content">
        <div class="row">
          <div class="col-md-6">
            <div class="card card-user">
              <div class="image">
                <img src="<%= request.getContextPath()%>/resource/dashboard/img/header.jpg">
              </div>
              <div class="card-body">
                <div class="author">
                  <a href="#">
                    <img class="avatar border-gray" src="<%= request.getContextPath()%>/leader/ldPic.do?ldNo=${ldVO.ldNo}"s>
                    <h5 class="title">${ldVO.ldName}</h5>
                  </a>
                  <p class="description">
                    	編號:${ldVO.ldNo}
                  </p>
                </div>
                <div  class="col-md-2"></div>
<!--                 <p class="description text-center">  -->
                	領隊經歷：<br>    
                	<div  class="col-md-3"></div>           
                 ${ldVO.ldExpr}<br>
<!-- 					Email： -->
<%--                  ${ldVO.ldMail} --%>
<!--                 </p> -->
              </div>
              <div class="card-footer">
                <hr>
                <div class="button-container">
                  <div class="row">
                    <div class="col-lg-6 col-md-6 col-6 ml-auto">
                      <h5>分數<br><small>${ldVO.ldScore}</small></h5>
                    </div>
                    <div class="col-lg-6 col-md-6 col-6 ml-auto mr-auto">
                      <h5>評分人數<br><small>${ldVO.ldPeople}</small></h5>
                    </div>
<!--                     <div class="col-lg-3 mr-auto"> -->
<!--                       <h5>24,6$<br><small>Spent</small></h5> -->
<!--                     </div> -->

                  </div>
                </div>
              </div>
            </div>
           </div>
          </div>
          <div class="row">
          	<div class="col-md-4"></div>
	          	<div class="col-md-6">
	          		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/leader/select_page.jsp">
					<input id="btnHome" type="submit" value="回首頁">
					</FORM>
	          	</div>
          </div>
        </div>
</body>
</html>