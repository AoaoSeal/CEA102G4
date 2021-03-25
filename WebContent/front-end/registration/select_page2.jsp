<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itinerary.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Bootstrap 的 CSS -->
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap-reboot.min.css"> --%>
<%--     <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap-grid.min.css"> --%>
<style>

body {
    background-color: #f5f5f5;
    font-size: 16px;
    line-height: 1.7;
    font-family: Helvetica Neue,Helvetica,Arial,sans-serif;
    font-weight: 400;
    letter-spacing: .5px;
    color: #333;
    margin: 0 auto;
    overflow-x: hidden;
}

.row1{
	position: relative;
 	float:left;
	width:400px;
}

.row2{
	position: relative;
	width:400px;
}


input { 
    display: block;
    width: 70%;
    height:40px;
/*     height: calc(1.5em + .75rem + 2px); */
    padding: .375rem .75rem;
    border: 1px solid #ced4da;
    border-radius: 8px;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
    cursor: text;
    margin-bottom: 20px;
}

 
select { 
	height: 45px; 
    padding: 10px 12px; 
    font-family: inherit; 
    font-size: 16px; 
    line-height: 2; 
    letter-spacing: .5px; 
    border-radius: 4px; 
    background-color: #fff; 
    opacity: 1; 
 } 

input:focus{  
 	border-style:solid;  
 	border-color: #26BEC9;   
  	box-shadow: 0 0 10px #26BEC9;  
 } 
  
 .text-must{ 
 	color:red; 
 }  

 .btnCom { 
 	margin-top:20px;
  	width:120px; 
 	height:60px; 
    background: #26BEC9; 
    border: 0px solid #eee; 
    border-radius: 6px; 
    font-size: 18px; 
    color:#fff; 
 } 



div.errorMsgs{
	margin-bottom:50px;
	margin: auto;	
}

div.container {
/*    	border:1px solid red;    */

	margin-bottom:50px;
	margin-left:600px;	
}



div.container div.col-10{
 	border:2px solid black; 
	background: #fff;
	width:850px;
	border-radius: 6px;
	margin-top:30px;
}

div.container div.col-5{
/*  	border:1px solid green;  */
	font-size:20px;
	margin-top:20px;
	margin-left:10px;
	margin-bottom:20px;
}

div.container div.col-10 div.row1, div.container div.col-10 div.row2 {
/*    	border:1px solid blue;    */
	margin:10px;
	font-size:18px;
	min-height: 1px;
	margin-bottom:20px;
	margin-left:50px;
}

div.container div.col-1{
/*   	border:1px solid blue;   */
  	margin-left: 700px;

}
div.container div.itTitle{
/*  	border:1px solid blue;  */
	margin-top:150px;
	margin-left:10px;
	font-size:32px;
	
}

</style>

<div class="errorMsgs">
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>		
			</c:forEach>
		</ul>
	</c:if>
</div>	
<c:set var="memId" value="${param.memId}" scope="session" />
<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do">
<div class="container">
	<div class="itTitle">
		 <jsp:useBean id="itSvc" scope="page" class="com.itinerary.model.ItService" />
		 <b>● 報名行程:${itSvc.getOneIt(param.itNo).itName} </b>
	</div>
	<div class="itrow justify-content-around">		
		<div class="col-10 buyer1" id="buyer1">		
		<div class="col-5">
			<div class="txt">
              	  參加者資料資料　
            </div>
		</div>
		<hr>
			<div class="row justify-content-around">

				<div class="row1">
                    <div class="form-item">
                        <label>姓名<span class="text-must">*</span></label><br>
                        <input placeholder="孫小美" name="attName" type="text">
                    </div>
                </div>


				<div class="row2">
                    <div class="form-item">
                        <label>聯絡電話<span class="text-must">*</span></label><br>
                        <input placeholder="09**-******" name="attPhone" type="text">
                    </div>
                </div>
			
			</div>	
			<div class="row justify-content-around">

				<div class="rowBirth row1">
                    <div class="form-item">
                        <label>出生日期<span class="text-must">*</span></label><br>
                        <input name="attBirth" type="text" class="date1">
                    </div>
                </div>


				<div class="row2" id="peoCount">
                    <div class="form-item">
                        <label>報名人數<span class="text-must">*</span></label><br>
                        <select id="mySelect" name="peoCount" onchange="myFunction()">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>

			</div>	
			<div class="row justify-content-around">

				<div class="row1">
                    <div class="form-item">
                        <label>緊急聯絡人姓名<span class="text-must">*</span></label><br>
                        <input placeholder="" name="emerName" type="text">
                    </div>
                </div>
		

				<div class="row2">
                    <div class="form-item">
                        <label>緊急連絡人電話<span class="text-must">*</span></label><br>
                        <input placeholder="09**-******" name="emerPhone" type="text">
                    </div>
                </div>

			</div>						
		</div>
	</div>

	
	<div class="itrow justify-content-around buyer2" id="buyer2">
	</div>
	
	<div class="itrow">
		<div class="col-1  offset-md-9">
			<div class="btnCom1">
				<input type="hidden" name="itNo" value="${param.itNo}">
		        <input type="hidden" name="action" value="insert">
		        <input type="submit" value="確認報名" class="btnCom" onclick="check()">
	    	</div>
		</div>
	</div>
</div>
</FORM>

    <!-- Bootstrap的 (jQuery、Popper) -->
    <script src="<%=request.getContextPath()%>/resource/jquery/jquery-3.5.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/popper/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>
    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.full.js"></script>

 


<script>

	function myFunction() {
		$("#buyer2").html("");
		let amount = document.getElementById("mySelect").value;
		let buyer = document.getElementsByClassName("buyer1")[0];		
		for(let i = 1 ; i< amount ; i++){
			let newBuyer = buyer.cloneNode(true);
			$("#buyer2").append(newBuyer);
			
			$('.date1').datetimepicker({
			       theme: '',              
			       timepicker:false,       
			       step: 1,                
			       format:'Y-m-d',         
				   value: '',              
		    });
		}
		$("#buyer2").find("#peoCount").css('display','none');
// 		$("#buyer2").find(".rowBirth").css('right','200px');
	}
	
	
     $.datetimepicker.setLocale('zh');
    $('.date1').datetimepicker({
	       theme: '',              
	       timepicker:false,       
	       step: 1,                
	       format:'Y-m-d',         
		   value: '',              
    });
    

</script>		
</body>
</html>