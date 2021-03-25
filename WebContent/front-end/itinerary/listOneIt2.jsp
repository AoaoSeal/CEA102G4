<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itinerary.model.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Examples</title>
    
</head>

<body>
<%   
String uri = request.getServletPath();
System.out.println("jsp="+uri);
request.getSession().setAttribute("uri",uri);
 %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/slick-theme.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/slick.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/style.css">
	
     <style>
      body {
      margin: 0;
      padding: 0;
    }

    .slider {
        width: 90%;
        margin: 10px auto;
    }

    .slick-slide {
      margin: 0px 2px;
    }

    .slick-slide img {
      width: 760px;
      height: 500px;
      margin-right: 10px;
    }

    .slick-prev:before,
    .slick-next:before {
      color: black;
    }
    
    .slick-slide {transition: all ease-in-out .3s;
      opacity: 0.4;
    }
    
    .slick-active {
      opacity: 0.6;
    }

    .slick-current {
      opacity: 1;
    }   	
    
    	
.itcicon {
    width: 4%;
}
	.heart img {
            width: 40px;
            object-fit: cover;
    }
	.itname, .heart{
		display: inline-block;
	}

	.itallcontent{
		padding-left: 100px;
		width:90%;
	}
	
.itcno, .it-information, .ittext {
    font-size: 1.2rem;
} 
	
	.itdays, .ldno, .itprice, .itpeople {
		display: inline-block;
		width:20%;
	}
	
	.icon {
    width: 13%;
}

 	a.btna {
     color: #fff;
     cursor: pointer;
     text-decoration: none;
     font-size: 1.5rem;
     }

	.itpricebar {
    position: absolute;
    right: 150px;
    top: 30px;
}
	.itpricebar button{
		width: 130px;
		height: 60px;
		background: #26BEC9;
		border: 0px solid #eee;
		border-radius: 6px;
		color:#fff;
		font-size: 28px;
	}
	.pricebarbtn{
		opacity:0.9;
		cursor: pointer;
	}
	.pricebarbtn:hover{
		opacity:1;
	}
	
.viewOne {
    /* padding: 100px; */
    position: relative;
    margin-top: 50px;
    width: 80%;
    min-width: 1000px;
    margin-left: 10%;
    box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%), 0 6px 20px 0 rgb(0 0 0 / 19%);
    padding: 15px 15px;
    background-color: white;
    margin-bottom: 50px;
    padding-bottom: 60px;
}

.itdays, .ldno, .itprice, .itpeople {
    display: inline-block;
    width: 23%;
}
.heart {
    position: absolute;
    margin-left: 30px;
}
</style>

    <section class="variable slider">
        <div class="items">
            <a href="#"><img src="${pageContext.request.contextPath}/itinerary/pic.do?pic=1&itNo=${itVO.itNo}&table=itinerary&column=it_pic&idname=it_no" width="100%"></a>
        </div>
        <div class="items">
            <a href="#"><img src="${pageContext.request.contextPath}/itinerary/pic.do?pic=2&itNo=${itVO.itNo}&table=itinerary&column=it_pic2&idname=it_no" width="100%"></a>
        </div>
        <div class="items">
            <a href="#"><img src="${pageContext.request.contextPath}/itinerary/pic.do?pic=3&itNo=${itVO.itNo}&table=itinerary&column=it_pic3&idname=it_no" width="100%"></a>
        </div>
        <div class="items">
            <a href="#"><img src="${pageContext.request.contextPath}/itinerary/pic.do?pic=4&itNo=${itVO.itNo}&table=itinerary&column=it_pic4&idname=it_no" width="100%"></a>
        </div>
        <div class="items">
            <a href="#"><img src="${pageContext.request.contextPath}/itinerary/pic.do?pic=5&itNo=${itVO.itNo}&table=itinerary&column=it_pic5&idname=it_no" width="100%"></a>
        </div>
    </section>
 <div class="viewOne">
 
 <div class="itallcontent">
	<%	ItVO itVO = (ItVO) request.getAttribute("itVO"); %>
	<c:set var="itNo" value="${itVO.itNo}" scope="session" />
	<div class="itname">
		<h1>${itVO.itName}</h1>
	</div>
<div class="heart">
							<p class="pheart">?</p>
							<img class="${itVO.itNo}" name="imgheart" src="" >
						</div>
	

	<div class="itcno">
		<jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" />
		<img src="${pageContext.request.contextPath}/resource/images/icon/mountains.png" class="itcicon">
		<c:forEach var="itcVO" items="${itcSvc.all}">			
	            <c:if test="${itVO.itcNo==itcVO.itcNo}">${itcVO.itcName}</c:if>
	    </c:forEach>
	</div>
	
	<hr><br>
	
	<div class="it-information">
		<div class="itdays">
			<span><img src="${pageContext.request.contextPath}/resource/images/icon/clock.png" class="icon">
			天數${itVO.itDays}</span>
		</div>
		
	
		<div class="ldno">
			<jsp:useBean id="ldSvc" scope="page" class="com.leader.model.LdService" />
			<span><img src="${pageContext.request.contextPath}/resource/images/icon/guide.png" class="icon">				
			<c:forEach var="ldVO" items="${ldSvc.all}">				
	            <c:if test="${itVO.ldNo==ldVO.ldNo}">領隊-${ldVO.ldName}</c:if>
	        </c:forEach>		
			</span>
		</div>
		
		<div class="itprice">
			<span><img src="${pageContext.request.contextPath}/resource/images/icon/coin.png" class="icon">
			TWD$ ${itVO.itPrice}元</span>
		</div>
		
		<div class="itpeople">
			<span><img src="${pageContext.request.contextPath}/resource/images/icon/group.png" class="icon">
			目前人數:${itVO.itPeocount}/上限:${itVO.itPeolim} 人</span>
		</div>
	</div><br>
	<hr><br>
	<div class="ittext">
		${itVO.itText}
	</div><br>   
	<hr>
	<br>
	<br>
</div>
<div class="itpricebar">
	<c:set var="status" value="${itVO.itPeocount}" />
		<c:choose>
	    <c:when test="${itVO.itPeocount > itVO.itPeolim || itVO.itPeocount == itVO.itPeolim}">
	       	 <button class="pricebarbtn" disabled>人數已額滿</button> 					       
	    </c:when>

	     <c:when test="${itVO.itPeocount < itVO.itPeolim}">
	       	<button class="pricebarbtn" ><a class="btna" href="${pageContext.request.contextPath}/front-end/registration/select_page2.jsp?itNo=${itVO.itNo}">立即報名</a></button>					     
	    </c:when>
		</c:choose>
	
</div>
</div>

<script>

var memId = -1
<c:if test = "${!empty memberVO}">
memId = ${memberVO.memId}
</c:if>

// function checkLogin(){
// 	$(".pricebarbtn").attr(disabled, true)
// 	if (memId==-1){
// 		alert("請登入會員");
// 	}else{
// 		alert("已經登入會員");
// 	}
// }

$(".btna").click(function(e){
	e.preventDefault();
	if (memId==-1 || memId.length==0){

// 		$("#basicModal").modal({show: true});
		window.location.href="${pageContext.request.contextPath}/front-end/mem.do?action=logoin"
	}else{
		window.location.href="${pageContext.request.contextPath}/front-end/registration/select_page2.jsp?itNo=${itVO.itNo}";
	}
});

</script>        
</body>

</html>