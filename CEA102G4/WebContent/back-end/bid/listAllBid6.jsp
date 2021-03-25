<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bid.model.*"%>
<%@ page import="com.itinerary.model.*"%>
<% 
	BidService bidSvc = new BidService();
	List<BidVO> list = bidSvc.getAllByStatus(4);
	pageContext.setAttribute("list", list);

%>	


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>競標管理</title>



</head>
<body>

<style>




table#table-1 {
/* 	background-color: #CCCCFF; */
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 100%;
/* 	background-color: white; */
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 3px solid #CCCCFF;
}

th {
	padding: 5px;
	text-align: center;
}

td {
	overflow: hidden;
	padding: 5px;
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
}


</style>
<!-- <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> -->
<table>
	<tr>
		<td align="center">
			 <h3>所有競標列表</h3>
<%-- 			 <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/select_page.jsp"> --%>
<!-- 					<input type="submit" value="回首頁"> -->
<!-- 			</FORM> -->
		</td>

	</tr>
</table>
<table>
<tr>
<th>
<form action="${pageContext.request.contextPath}/back-end/bid/listAllBid.jsp">
<INPUT TYPE=SUBMIT VALUE="全部競標">
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid1.jsp">
<INPUT TYPE=SUBMIT VALUE="編輯中">
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid2.jsp">
<INPUT TYPE=SUBMIT VALUE="安排競標">
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid3.jsp">
<INPUT TYPE=SUBMIT VALUE="正在競標">
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid4.jsp">
<INPUT TYPE=SUBMIT VALUE="競標結束">
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid5.jsp">
<INPUT TYPE=SUBMIT VALUE="取消的競標">
</form></th>

</tr>
<tr><th><form action="${pageContext.request.contextPath}/back-end/bid/addBid.jsp">
<INPUT TYPE=SUBMIT VALUE="新增競標">
</form></th></tr>
</table>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table id="tab1" style="table-layout: fixed;">
	<tr>
		<th>競標商品編號</th>
		<th>行程編號</th>
		<th>起標價格</th>
		<th>開始時間</th>
		<th>截標時間</th>
		<th>競標記錄</th>		
		<th>得標記錄編號</th>
		<th>得標會員編號</th>
		<th>得標金額</th>
		<th>競標狀態</th>
		<th>競標管理</th>
	</tr>

	<%@ include file="/back-end/bid/page1.file" %>

	<c:forEach var="bidVO" items="${list}"
	 begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

	<tr ${(bidVO.bidNo==param.bidNo)? 'bgcolor=lightgreen':''} class="${bidVO.bidNo}"   
	
	<c:if test="${bidVO.bidStatus==2}">bgcolor="lightblue"</c:if>
	<c:if test="${bidVO.bidStatus==1}">bgcolor="lightyellow"</c:if>
	<c:if test="${bidVO.bidStatus==4}">bgcolor="#aaa"</c:if>
	<c:if test="${bidVO.bidStatus==3}">bgcolor="#bbb"</c:if>
	>
	
		<th>${bidVO.bidNo}</th>
		<th><form action="${pageContext.request.contextPath}/back-end/bid/bid.do">
				<input type="hidden" name="itNo"  value="${bidVO.itNo}">
				  <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>"> 
			   <input type="hidden" name="action" value="getOne_From06"  >
			<INPUT TYPE=SUBMIT VALUE="${bidVO.itNo}">
			</form>
</th>
		<th>${bidVO.bidPricestart}</th>
		<th>		
		<c:set var="string1" value="${bidVO.bidTimestart}"/>
		<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />		
		${string2}
		</th>
		<th>	<c:set var="string1" value="${bidVO.bidTimeend}"/>
		<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />		
		${string2}</th>
		<th><form action="${pageContext.request.contextPath}/back-end/bid/bid.do">
				<input type="hidden" name="bidNo"  value="${bidVO.bidNo}">
				  <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>"> 
			   <input type="hidden" name="action" value="getOne_From07"  >
			<INPUT TYPE=SUBMIT VALUE="競標紀錄">
			</form></th>
		<th>${bidVO.bidrecNo}</th>
		<th>${bidVO.memId}</th>
		<th>${bidVO.bidPrice}</th>
		<th>
		<c:set var="status" value="${bidVO.bidStatus}"/>
		<c:choose>
		<c:when test="${bidVO.bidStatus==0}">
	       編輯中
	    </c:when>
	    <c:when test="${bidVO.bidStatus==1}">
	       安排競標
	    </c:when>
	    <c:when test="${bidVO.bidStatus==2}">
	       競標中
	    </c:when>
	     <c:when test="${bidVO.bidStatus==3}">
	       競標結束
	    </c:when>
	      <c:when test="${bidVO.bidStatus==4}">
	  	取消
	    </c:when>
		</c:choose>
		</th>
		<th>
		<c:if test="${bidVO.bidStatus==0}">
		<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/bid/bid.do">
				<input type="submit" value="修改">			   
			   <input type="hidden" name="bidNo"  value="${bidVO.bidNo}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>"> 
			   <input type="hidden" name="action" value="getOne_For_update"  >
			   
 			</FORM>
 			
 			<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/bid/bid.do">
				<input type="submit" value="安排競標">			   
			   <input type="hidden" name="bidNo"  value="${bidVO.bidNo}">
			    <input type="hidden" name=bidStatus  value="1">
			      <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>"> 
			   <input type="hidden" name="action" value="deleteOne"  >			   
 			</FORM>
 		
 			
		<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/bid/bid.do">
				<input type="submit" value="取消競標">			   
			   <input type="hidden" name="bidNo"  value="${bidVO.bidNo}">
			    <input type="hidden" name=bidStatus  value="4">
			      <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>"> 
			   <input type="hidden" name="action" value="deleteOne"  >			   
 			</FORM>
 			
 			
 			</c:if>
 			
 			<c:if test="${bidVO.bidStatus==1}">
	
 			
 			
		<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/bid/bid.do">
				<input type="submit" value="返回編輯">			   
			   <input type="hidden" name="bidNo"  value="${bidVO.bidNo}">
			    <input type="hidden" name=bidStatus  value="0">
			      <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>"> 
			   <input type="hidden" name="action" value="deleteOne"  >			   
 			</FORM>
 			
 			<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/bid/bid.do">
				<input type="submit" value="取消標競">			   
			   <input type="hidden" name="bidNo"  value="${bidVO.bidNo}">
			    <input type="hidden" name=bidStatus  value="4">
			      <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>"> 
			   <input type="hidden" name="action" value="deleteOne"  >			   
 			</FORM>
 			
 			
 			</c:if>
 			
 			
 			
 			<c:if test="${bidVO.bidStatus==4}">
	 			<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/back-end/bid/bid.do">
					<input type="submit" value="恢復編輯">			   
				   <input type="hidden" name="bidNo"  value="${bidVO.bidNo}">
				     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>"> 
				    <input type="hidden" name=bidStatus  value="0">
				   <input type="hidden" name="action" value="deleteOne"  >
				   
	 			</FORM>
 			</c:if>
 			</th>
	
	</tr>	
	</c:forEach>
</table>
<%@ include file="/back-end/bid/page2.file" %>



<c:if test="${openModal1!=null}">
<%List<BidRecordVO> bidrlist = (List) request.getAttribute("bidrlist");%>
<style>
div.bidr{
    border: 3px solid #aaa;
    background-color: aliceblue;
    position: absolute;
/*     max-height: 100%; */
    width: 80%;
    top: 300px;
    align-items: center;
    margin-left: 10%;
    padding-right: 0px;
}
</style>

<script>


$(function() {
	
// 	alert($("div.it"));
$("div.bidr").attr('tabIndex',-1);	
$("div.bidr").blur(function(){
	$("div.bidr").hide();
	})
	
	$(".close").click(function(){

		$("div.bidr").hide();	
		
		
	})
	
	

});



</script>


<div class="bidr">

<table id="tab1" style="table-layout: fixed;">

	<tr>
		<th>競標編號</th>
		<th>競標紀錄編號</th>
		<th>競標會員</th>
		<th>競標金額</th>
		<th>競標時間</th>
		
	</tr>
	<c:if test="${ fn:length(bidrlist)==0 }">
		<tr >	
		<th colspan="5">沒有競標紀錄</th>
		</tr>
	</c:if>
	<c:if test="${ fn:length(bidrlist)!=0 }">
<c:forEach var="bidrVO" items="${bidrlist}">
	<tr >
	
		<th>${bidrVO.bidNo}</th>
		<th>${bidrVO.bidrecNo}</th>
		<th>${bidrVO.memId}</th>
		<th>${bidrVO.bidPrice}  (NT)</th>
		<th>${bidrVO.bidTime}</th>

				
	</tr>	
	</c:forEach>
	</c:if>
<tr><th colspan="5"><input type="submit" value="關閉" onclick="close()" class="close">	</th></tr>
</table>
</div>


</c:if>


<c:if test="${openModal!=null}">
<%ItVO itVO = (ItVO) request.getAttribute("itVO");%>
<style>
div.it{
    border: 3px solid #aaa;
    background-color: aliceblue;
    position: absolute;
    max-height: 100%;
    width: 80%;
    top: 300px;
    align-items: center;
    margin-left: 10%;
    padding-right: 0px;
}
</style>

<script>


$(function() {
	
// 	alert($("div.it"));
$("div.it").attr('tabIndex',-1);	
$("div.it").blur(function(){
	$("div.it").hide();
	})
	
	$(".close").click(function(){

		$("div.it").hide();	
		
		
	})
	
	

});



</script>


<div class="it">

<table id="tab1" style="table-layout: fixed;">

	<tr>
		<th>編號</th>
		<th>類別</th>
		<th>領隊</th>
		<th>名稱</th>
		<th>首圖1</th>
		<th>首圖2</th>
		<th>天數</th>
		<th>介紹</th>
		<th>費用</th>
		<th>人數上限</th>
		<th>目前人數</th>
		<th>出發日期</th>
		<th>報名起始日</th>
		<th>報名結束日</th>
		<th>狀態</th>
		
	</tr>

	<tr >
	
		<th>${itVO.itNo}</th>
		
		<jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" />
		<th><c:forEach var="itcVO" items="${itcSvc.all}">			
            <c:if test="${itVO.itcNo==itcVO.itcNo}">
	                    ${itcVO.itcNo}<br><font color=#8B4513>${itcVO.itcName}</font>
             </c:if>
        </c:forEach></th>
		
		 <jsp:useBean id="ldSvc" scope="page" class="com.leader.model.LdService" />
		<th><c:forEach var="ldVO" items="${ldSvc.all}">				
            <c:if test="${itVO.ldNo==ldVO.ldNo}">
	                    ${ldVO.ldNo}<br><font color=#8B4513>${ldVO.ldName}</font>
             </c:if>
        </c:forEach></th>
		<th>${itVO.itName}</th>
		<th width="60px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=1&itNo=${itVO.itNo}&table=itinerary&column=it_pic&idname=it_no" width="60" height="60"></th>
		<th width="60px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=2&itNo=${itVO.itNo}&table=itinerary&column=it_pic2&idname=it_no" width="60" height="60"></th>	
		<th>${itVO.itDays}</th>
		<th style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis" onmousemove="removeClassType(this)">${itVO.itText}</th>
		<th>${itVO.itPrice}</th>
		<th>${itVO.itPeolim}</th>
		<th>${itVO.itPeocount}</th>
		<th>${itVO.itDate}</th>
		<th>${itVO.itStartdate}</th>
		<th>${itVO.itEnddate}</th>
		
		<c:set var="status" value="${itVO.itStatus}"/>
		<c:choose>
	    <c:when test="${itVO.itStatus==0}">
	       <th>下架</th>
	    </c:when>
	    <c:when test="${itVO.itStatus==1}">
	       <th>上架</th>
	    </c:when>
	     <c:when test="${itVO.itStatus==2}">
	       <th>行程結束</th>
	    </c:when>
	    <c:when test="${itVO.itStatus==3}">
	       <th>行程取消</th>
	    </c:when>
		</c:choose>

				
	</tr>	
<tr><th colspan="15"><input type="submit" value="關閉" onclick="close()" class="close">	</th></tr>
</table>
</div>


</c:if>

<script>


function removeClassType($this) {
    $($this).attr("title",$this.innerText);
}
</script>



</body>
</html>