<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.leader.model.*"%>
<html>
<head>
<title>領隊首頁 select_page</title>
</head>
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


<body>
<style>
	table{
		font-size:18px;
	}
	th{
		font-size:20px!important;
	}
	div.col-md-11 {
	    margin: 20px 65px 0 65px;
	}
	.footer {
		position: relative!important;
	}
	
	#btnAddLd {
	    margin-left: 70px;
	    width: 120px;
	    height: 45px;
	    font-size: 20px;
	    border-radius: 10px;
	    border:1px solid #26BEC9;
	    background-color: #26BEC9;
	    color: #fff;
	    opacity: 0.7;
	}
 	#btnAddLd,#btnSearch:hover{ 
 		 box-shadow: 0 0 11px rgba(33,33,33,.3);  
 		 text-decoration: none!important; 
 	} 
 	
	#btnSearch {
	    width: 90px!important;
	    height: 45px;
	    font-size: 20px;
	    border-radius: 10px;
	    border:1px solid #26BEC9;
	    background-color: #26BEC9;
	    color: #fff;
	    opacity: 0.7;
	}
	
	#textSearch {
		    margin-left: 70px;
		width: 150px!important;
	    height: 45px!important;
	    border-radius: 10px!important;
	}

	#btnAddLd:hover{
		opacity:1;
	}
	#talebtn{
		margin-top:20px;
	}
	#pageHead{
		margin-left:0px;
		font-size:16px;
		color:#666666;
	}
	#pageFoot{
		margin-left:1000px;
		padding-left:180px;
		font-size:16px;
		color:#666666;
	}
</style>
<% 
	LdService ldSvc = new LdService();
	List<LdVO> list = ldSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<table id="talebtn">
	<thead>
		<tr>
			<th><FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/leader/addLd.jsp">
					<input id="btnAddLd" type="submit" value="+新增領隊">
				</FORM></th>
			
			<th><FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/leader/ld.do">
<!-- 			<b>請輸入領隊編號</b> -->
					<input id="textSearch" type="text" placeholder="領隊編號-12001" name="ldNo">
					<input type="hidden" name="action" value="getOne_For_Display">
					<input id="btnSearch" type="submit" value="搜尋">
				</FORM></th>
		</tr>
	</thead>
</table>


<div class="content">

	<div class="row">
		<div class="col-md-11">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">領隊列表</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table" id="myTable">
							<thead class=" text-primary">
								<th>照片</th>
								<th>編號</th>
								<th>姓名</th>
								<th>經歷介紹</th>
								<th>評分</th>
								<th>Email</th>
								<th>編輯</th>
							</thead>
							<tbody>		
							<div id="pageHead"><%@ include file="/resource/file/page1.file"%></div>			
								<c:forEach var="ldVO" items="${list}" 
										begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
							
								<tr ${(ldVO.ldNo==param.ldNo)? 'bgcolor=#cfd3c9':''}>
									<td><img src="<%= request.getContextPath()%>/leader/ldPic.do?ldNo=${ldVO.ldNo}" width="120" height="120"></td>
									<td>${ldVO.ldNo}</td>
									<td>${ldVO.ldName}</td>
									<td>${ldVO.ldExpr}</td>
									<td>${ldVO.ldScore}</td>
									<td>${ldVO.ldMail}</td>
									<td>
										<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/leader/ld.do">
										<input type="submit" value="修改">			   
										<input type="hidden" name="ldNo"  value="${ldVO.ldNo}">
										<input type="hidden" name="action" value="getOne_For_Update">			   
										</FORM>
									</td>
								</tr>
								
							</c:forEach>
							</tbody>
													
						</table>
						<div id="pageFoot"><%@ include file="/resource/file/page2.file"%></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>