<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ page import="java.util.*" %>
<%@ page import="com.leader.model.*" %>

<%	LdVO ldVO = (LdVO) request.getAttribute("ldVO"); %>

<html>
<head>
<title>listOneEmp.jsp</title>

<style>
  table {
	width: 950px;
	background-color: #F5F5DC;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left:auto; 
	margin-right:auto;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  input[type="submit"] { padding:5px 15px; 
						background:#D2B48C;
						border:0 none;
						cursor:pointer;
						-webkit-border-radius: 5px;
						border-radius: 5px;
						}
</style>

</head>
<body bgcolor='#D2B48C'>

<table id="table1">
	<tr>
		<td align="center">
			 <h3>查詢領隊資料-listOneLd.jsp</h3>
			 <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/select_page.jsp">
				<input type="submit" value="回首頁">
			</FORM>
		</td>
		<td>
			 <h4><img src="<%= request.getContextPath()%>/resource/images/logo.png" width="150" height="150" border="0"></h4>
		</td>
	</tr>
</table>

<table>
	<tr>
		<th>領隊編號</th>
		<th>領隊姓名</th>
		<th>大頭照</th>
		<th>經歷</th>
		<th>狀態</th>
		<th>評分</th>
		<th>評分人數</th>
	</tr>
	<tr>
		<td>${ldVO.ldNo}</td>
		<td>${ldVO.ldName}</td>
		<td><img src="<%= request.getContextPath()%>/leader/ldPic.do?ldNo=${ldVO.ldNo}" width="120" height="120"></td>
		<td>${ldVO.ldExpr}</td>
		<td>${ldVO.ldStatus}</td>
		<td>${ldVO.ldScore}</td>
		<td>${ldVO.ldPeople}</td>
	</tr>
</table>
</body>
</html>