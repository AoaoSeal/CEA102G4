<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.itinerary_category.model.*"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	#btnAddItc {
	    margin-left: 70px;
	    width: 150px;
	    height: 50px;
	    font-size: 18px;
	    border-radius: 10px;
	    border:1px solid #26BEC9;
	    background-color: #26BEC9;
	    color: #fff;
 	    opacity: 0.8; 
		transition: box-shadow .3s;
		border: 1px solid #ccc;
	}	
	
	#btnAddItc:hover{
		 box-shadow: 0 0 11px rgba(33,33,33,.3); 
	}
	#btn{ 
 		display:inline-block; 
		border-width: 2px; 
 	    font-weight: 600; 
 	    font-size: 0.8571em; 
 	    line-height: 1.35em; 

 	    border: none; 
 	    border-radius: 3px; 
 	    padding: 11px 22px; 
 	    cursor: pointer; 
 	    background-color: #66615B; 
 	    color: #FFFFFF; 
		opacity: 1;
 	} 
</style>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
</c:if>


<div id="div1">
<%-- 	<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary_category/addItc.jsp"> --%>
		<input id="btnAddItc" type="submit" value="+新增行程類別">
<!-- 	</FORM> -->
</div>	

<div class="content">
	<div class="row">
		<div class="col-md-11">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">行程類別</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-hover">
							<thead class=" text-primary">
								<th>類別編號</th>
								<th>類別名稱</th>
								<th>修改名稱</th>
								<th>查詢類別行程</th>
							</thead>
							<tbody>						
								<jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" />
								<c:forEach var="itcVO" items="${itcSvc.all}">
									<tr ${(itcVO.itcNo==param.itcNo)? 'bgcolor=#cfd3c9':''}>
										<th>${itcVO.itcNo}</th>
										<th>${itcVO.itcName}</th>
										<th>
										  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/itinerary_category/itc.do" style="margin-bottom: 0px;">
										    <input type="submit" id="btn1" value="修改"> 
										    <input type="hidden" name="itcNo" value="${itcVO.itcNo}">
										    <input class="btn" type="hidden" name="action" value="getOne_For_Update"></FORM>
										</th>
										<th>
										  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/itinerary_category/itc.do" style="margin-bottom: 0px;">
										    <input type="submit" id="btn1" value="查詢"> 
										    <input type="hidden" name="itcNo" value="${itcVO.itcNo}">
										    <input class="btn" type="hidden" name="action" value="listIts_ByItcno"></FORM>
										</th>
									</tr>
								</c:forEach>
							</tbody>													
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<%if (request.getAttribute("listIts_ByItcno")!=null){%>
       		<jsp:include page="listIts_ByItcno.jsp" />
			<%} %>	
		
		</div>
	</div>	
</div>

<!-- 修改類別modal start -->
<c:if test="${openModal!=null}">
<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header">
                <button id="btn" type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h3 class="modal-title" id="myModalLabel">修改行程類別名稱</h3>
            </div>
			
			<div class="modal-body">
			<!-- content start --> 
<jsp:include page="/back-end/itinerary_category/update_itc_input.jsp" />
			<!-- content end --> 
			</div>
			
			<div class="modal-footer">            
            </div>
		
		</div>
	</div>
</div>
<!-- 修改類別modal end -->
        <script>
    		 $("#basicModal").modal({show: true});
        </script>
 </c:if>


<!-- 新增類別modal start -->  	
 <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
	 			<div class="modal-header">
	                <button id="btn" type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
	                <h3 class="modal-title" id="myModalLabel">新增類別</h3>
	            </div>                   
                
                <div class="modal-body"> 
					<!-- content start --> 
					<div id="modalViewAdd">
<jsp:include page="/back-end/itinerary_category/addItc.jsp" />
					<!-- content end --> 
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>
 </div>  
<!-- 新增類別modal end -->  
<script>
$("#btnAddItc").click(function(){
	$("#addModal").modal("show")	
})
</script>
</body>
</html>