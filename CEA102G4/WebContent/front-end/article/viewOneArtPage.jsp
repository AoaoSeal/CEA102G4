<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.*"%>
<%@ page import="com.art.model.*"%>
<%@ page import="com.artmsg.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<%
	ArticleVO artVO = (ArticleVO) request.getAttribute("artVO");
	ArtMsgVO artMsgVO = (ArtMsgVO) request.getAttribute("artMsgVO");
	
%>
<jsp:useBean id="artCount" class="com.artcount.model.ArtCountService" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>


<body>


<div class="viewOne">

		<div class="viewArtCount">	
				<div id=viewHeart>
					<div class="heart">
							<p class="pheart">0</p>
							<img class="${artVO.artNo}" name="imgheart" src="" >
					</div>
				</div>	
					
			<div id="likeCount"></div>
			<div id="likeArticle"></div>
		</div>	
			<input type="hidden" id="memberId" value="${memberVO.memId}">
			<input type="hidden" id="likebutton" 
			value="${artCount.ifmemberCount(memberVO.memId,artVO.artNo)}">
			
			<c:if test="${memberVO.memId==artVO.memId}">
			<div id="viewOneUpdate">
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/art/art.do" style="margin-bottom: 0px;">
					<input class ="submit" type="submit" value="修改文章"> <input type="hidden" name="artNo" value="${artVO.artNo}">
				    <input  type="hidden" name="action" value="getOne_For_Update">
				</FORM>
					<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front-end/art/Article" style="margin-bottom: 0px;">
							<input class ="submit" type="submit" value="刪除此文章">
							 <input type="hidden"name="artNo" value="${artVO.artNo}"> 
							 <input type="hidden"name="artStatus" value="2"> 
							 <input type="hidden" name="action" value="updateStatusFront">
						</FORM>
			</div>
			</c:if>
							<c:set var="string1" value="${artVO.artTime}" />
							<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />
						<div id="viewOneTime">
							發表時間 : ${string2}	
						</div>
			<div id="viewOneTitle">
				<h1>${artVO.artTitle}</h1>
			</div>
		<div class=viewPic>
			<img class="pic"
				src="<%=request.getContextPath()%>/art/artpic.do${artVO.picSrc}">
		</div>
			<div id="review-detail">
				<div id="article-tip-text">
					本文為網友的心得，以下內容不代表TibaMountain立場。
				</div>
			</div>
			<div id="article-tip-text">
			${artVO.artText}
			</div>
			
	
	
	
	
	<jsp:include page="Artmsg.jsp" />
	
</div>	
	<script type="text/javascript">
	
	
	
	$(document).ready(function(){
		
		getArtCount();
		if($("#memberId").val()==''){
			like();			
		}
		else if($("#likebutton").val()=='false')
			like();
		else 
			unlike();
	});
	
	$("#likeArticle").on("click","#btnlike",function(){
		var artNo = $("#artNo").val();
		var memId = $("#memId").val();
		if($("#memberId").val()=='')
			alert("請先登入會員");
		console.log("test");
		$.ajax({
			url:"<%=request.getContextPath()%>/art/artcount.do",
			type:"POST",
			data:{
				action : "like",
				artNo : artNo,
				memId : memId
			},
			dataType:"text",
			success:function(data){
				artCount(data);
				unlike();
			}
		})
	})
	$("#likeArticle").on("click","#btnunlike",function(){
		var artNo = $("#artNo").val();
		var memId = $("#memId").val();
	
		
		$.ajax({
			url:"<%=request.getContextPath()%>/art/artcount.do",
			type:"POST",
			data:{
				action : "unlike",
				artNo : artNo,
				memId : memId
			},
			dataType:"text",
			success:function(data){
				artCount(data);
				like();
			
				
			}
		})
	})
	function getArtCount(){
		var artNo =${artVO.artNo}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/art/artcount.do",
			type:"POST",
			data:{
				action : "getArtCount",
				artNo : artNo
			},
			dataType:"text",
			success:function(data){
				artCount(data);
			}
		})
	}
	function artCount(data){
		var html = '';
		html +="<div id=\"likeCount\">";
		html += data;
		html +="</div>";
		$("#likeCount").html(html);
	}
	function like(){
		var html = '';
		html +="<input type=\"hidden\" id=\"artNo\" value=\"";
		html += ${artVO.artNo}
		html +="\"><input type=\"hidden\" id=\"memId\" value=\"";
		html +=${memberVO.memId}
		html +="\"><img class='artCountpic' id='btnlike' src='<%=request.getContextPath()%>/resource/images/Article/like.png' >"
		$("#likeArticle").html(html);
	}
	function unlike(){
		var html = '';
		html +="<input type=\"hidden\" id=\"artNo\" value=\"";
		html += ${artVO.artNo}
		html +="\"><input type=\"hidden\" id=\"memId\" value=\"";
		html +=${memberVO.memId}
		html +="\"><img class='artCountpic' id='btnunlike' src='<%=request.getContextPath()%>/resource/images/Article/bluelike.png' >"
		$("#likeArticle").html(html);
	}


	</script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/styleWen.css">
</body>
</html>