<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.art.model.*"%>
<%@ page import="com.artcount.model.*"%>
<%
	ArticleService artSvc = new ArticleService();
	List<ArticleVO> list = artSvc.getAll();
	pageContext.setAttribute("list", list);
	
	List<ArticleVO> listc =(ArrayList)request.getAttribute("listc");
	if(listc!=null)
		pageContext.setAttribute("list", listc);
	
	
	%>
	
<jsp:useBean id="memberSvc" class="com.member.model.MemberService" />
<jsp:useBean id="artCount" class="com.artcount.model.ArtCountService" />
<jsp:useBean id="artcSvc" class="com.artc.model.ArtcService" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>瀏覽文章頁面</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



</head>
<body>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">

<style>

div .jumbotron{
	background-image: url(/CEA102G4/resource/images/salmen-bejaoui-cerpzCd5amg-unsplash.jpg);
	background-size: cover;
	height: 470px;
	 background-attachment: fixed;
}
.bg-light {
    background-color: #f8f9fa7a!important;
}
.display-4 {
    margin-top: 80px;
    font-size: 3.5rem;
    font-weight: 300;
    line-height: 1.2;
}
</style>



	<div class="container-fluid">
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1 class="display-4" style="text-align: center">TI BA MOUNTAIN 社群</h1>
				<p class="lead " style="text-align: center"></p>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<!-- 					<a class="navbar-brand" href="#">商城主頁</a> -->
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
<!-- 						<ul class="navbar-nav mr-auto"> -->
							<div id="artcquick1"><A class="a2"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17001">心得</A></div>
							<div id="artcquick2"><A class="a2"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17002">知識</A></div>
							<div id="artcquick3"><A class="a2"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17003">裝備</A></div>
							<div id="artcquick4"><A class="a2"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17004">新聞</A></div>
							<div id="artcquick5"><A class="a2"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17005">其他</A></div>
							
									<FORM  METHOD="post" ACTION="<%=request.getContextPath()%>/art/art.do">
									<b style="font-size: 1rem;font-weight: bolder;margin-left: 30px;">搜尋文章:</b> <input type="text" name="artTitle" style="margin-right: 30px"><button class="btn btn-outline-success my-2 my-sm-0"
									type="hidden" name="action" value="finkByTitle" > 送出</button>
								<jsp:useBean id="gcSvc" scope="page"
									class="com.gc.model.GcService" />
								


<!-- 								<button class="btn btn-outline-success my-2 my-sm-0" -->
<!-- 									type="hidden" name="action" value="listGoods_ByCompositeQuery">送出</button> -->
							</FORM>
						</ul>

					</div>
				</nav>


<!-- 				<div class="row"> -->
					

					
<!-- 				</div> -->
			</div>
		</div>
	</div>
	
	<%@ include file="page1.file"%>
	<div id=listError>
		<c:if test="${not empty errorMsgs}">
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
	<c:if test="${not empty memberVO}">
		<div class="addArticle">
			<a  class ="a"href="<%=request.getContextPath()%>/front-end/article/addArt.jsp">我要分享+</a>
		</div>
	</c:if>
<div id="artChatRoom">
	<textarea id="artMessagesArea" class="panel message-area" readonly></textarea>
	<div class="panel input-area">
			<input id="artUserName" class="text-field" type="hidden" readonly  value="${memberVO.memId==null ? '' : memberSvc.getOneMem(memberVO.memId).memNick}"/> 
		<div id="artChatMsg">
			<input id="artMessage" class="text-field" type="text" placeholder="artMessage" onkeydown="if (event.keyCode == 13) artSendMessage();" /> 
		</div>
		<div id="artChatbtn">
			<input type="submit" id="artSendMessage" class="button"  value="send" onclick="artSendMessage();" /> 
<!-- 		<input type="button" id="artConnect" class="button" value="artConnect" onclick="artConnect();" />  -->
<!-- 		<input type="button" id="disartConnect" class="button" value="DisartConnect" onclick="disartConnect();" /> -->
		</div>
	</div>
</div>
	
			

	<div id="artIndexPage">
	<div class="selectTitle">
		<div class="articleArt"><A class="a1"href="<%=request.getContextPath()%>/front-end/article/listAllArt.jsp">社群文章</A></div>
		<div class="followPeople"><A class="a1"href="<%=request.getContextPath()%>/front-end/article/listAllByMember.jsp">我的收藏</A></div>
		<div class="myArticle"><A class="a1"href="<%=request.getContextPath()%>/front-end/article/listAllBySelf.jsp">我的文章</A></div>
	</div>
<!-- <div id="artcquick"> -->
<%-- 	<div id="artcquick1"><A class="a1"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17001">心得</A></div> --%>
<%-- 	<div id="artcquick2"><A class="a1"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17002">知識</A></div> --%>
<%-- 	<div id="artcquick3"><A class="a1"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17003">裝備</A></div> --%>
<%-- 	<div id="artcquick4"><A class="a1"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17004">新聞</A></div> --%>
<%-- 	<div id="artcquick5"><A class="a1"href="<%=request.getContextPath()%>/art/art.do?action=getArtByArtc&artcNo=17005">其他</A></div> --%>
<!-- </div> -->
<!-- <div class="select"> -->
<%-- 				<FORM  METHOD="post" ACTION="<%=request.getContextPath()%>/art/art.do"> --%>
<!-- 					<b>搜尋文章:</b> <input type="text" name="artTitle"> <input -->
<!-- 					type="hidden" name="action" value="finkByTitle"> <input -->
<!-- 					type="submit" value="搜尋"> -->
<!-- 				</FORM> -->
<!-- 			</div> -->
	<section class="menu" id="menu">
	<div class="artbox">
		<c:forEach var="articleVO" items="${(empty ListArticle) ? list : ListArticle}" varStatus="art"
			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<c:if test="${articleVO.artStatus==1}">
			<c:if test="${articleVO.memId==memberVO.memId}">
			<div class="box">
			
				<A href="<%=request.getContextPath()%>/art/art.do?action=getOneArt&artNo=${articleVO.artNo}">
				<div class="artc">
					<c:forEach var="artcVO" items="${artcSvc.all}">
						<c:if test="${articleVO.artcNo==artcVO.artcNo}">
	         	         ${artcVO.artcName}
             		   	</c:if>
					</c:forEach>
				</div>
				<div class="text">
					<div class="artTitle">
						<b>${articleVO.artTitle}</b>	
					</div>
				</div>	
				<div class="artText" >
					${articleVO.artText}
				</div>
				<div class="imgBx">
					<img class="titlePic" src="<%=request.getContextPath()%>/art/artpic.do${articleVO.picSrc}">
					</div>
							<c:set var="string1" value="${articleVO.artTime}" />
							<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />
							<c:set var="string3" value="${fn:substringAfter(string2,'2021-')}" />
				<div class="time">
				<input type="hidden" class="ArtTimeh" value="${articleVO.artTime}"> 
				<div class="ArtTime"></div>
					文章發表時間:${string3}
						<div id="artMemPic">
					<img class='imgm' src='<%=request.getContextPath()%>/AllPic.do?table=member_list&amp;picColumn=mem_pic&amp;idColumn=mem_id&amp;id='${articleVO.memId}>
				</div>
				<div id="artmemName">
					${memberSvc.getOneMem(articleVO.memId).memName}
				</div>
				</div>
					
				
				</a>
				
					<div class="artCount">
					
					<p class="artCountText">
				
						${artCount.getArtCount(articleVO.artNo)}
					
					</p>
					
					
				<img class='artCountpic'  src='<%=request.getContextPath()%>/resource/images/Article/like.png' > 
				</div>
			
				<div class="heart">
							<p class="pheart">0</p>
							<img class="${articleVO.artNo}" name="imgheart" src="" >
					</div>
				
			</div>
			</c:if>
			</c:if>
			</c:forEach>
		</div>
	</section>
	
	<%@ include file="page2.file"%>

	</div>
<script type="text/javascript">
$(document).ready(function(){
	
	
	
	$(".ArtTimeh").each(function(){
		let str = postArticleTime($(this).val());
		$(this).next().text(str);
	});
	
	
	
});
</script>
<script type="text/javascript">

function generateMsg(data){
	var html = '';
	
	for(let i=0 ; i< data.length ; i++){
	
	html += '';
	
	
		}

	$("#showMsg").html(html);
	};

	function postArticleTime(artTime){
	
        var time = Date.parse(artTime);
        var date = new Date();
        var msgTime = (date.getTime() - time);
        var min = 60 * 1000;
        var hour = min * 60;
        var day = hour * 24;
        var week = day * 7;

        var exceedWeek = Math.floor(msgTime / week);
        var exceedDay = Math.floor(msgTime / day);
        var exceedHour = Math.floor(msgTime / hour);
        var exceedMin = Math.floor(msgTime / min);
        if(exceedWeek > 0){
        	return exceedWeek+'週前'                    
                }else{
                    if(exceedDay < 7 && exceedDay > 0){
                        return exceedDay + '天前';
                    }else{
                        if(exceedHour < 24 && exceedHour > 0){
                            return exceedHour + '小時前';
                        }else if(exceedMin>1){
                            return exceedMin + '分鐘前';
                        }else{
                        	return '1分鐘前';
                        }
                    }
                }
            }
	Date.prototype.format = function (e) {
        var a = function (m, l) {
            var n = ""
                , k = (m < 0)
                , j = String(Math.abs(m));
            if (j.length < l) {
                n = (new Array(l - j.length + 1)).join("0")
            }
            return (k ? "-" : "") + n + j
        };
        if ("string" != typeof e) {
            return this.toString()
        }
        var b = function (k, j) {
            e = e.replace(k, j)
        };
        var f = this.getFullYear()
            , d = this.getMonth() + 1
            , i = this.getDate()
            , g = this.getHours()
            , c = this.getMinutes()
            , h = this.getSeconds();
        b(/yyyy/g, a(f, 4));
        b(/yy/g, a(parseInt(f.toString().slice(2), 10), 2));
        b(/MM/g, a(d, 2));
        b(/M/g, d);
        b(/dd/g, a(i, 2));
        b(/d/g, i);
        b(/HH/g, a(g, 2));
        b(/H/g, g);
        b(/hh/g, a(g % 12, 2));
        b(/h/g, g % 12);
        b(/mm/g, a(c, 2));
        b(/m/g, c);
        b(/ss/g, a(h, 2));
        b(/s/g, h);
        return e
    };
</script>
<script>
$(document).ready(function(){
	artConnect();
	console.log("artgood");
});
	var MyPoint2 = "/TogetherWS/james";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL2 = "ws://" + window.location.host + webCtx + MyPoint2;

	var statusOutput = document.getElementById("statusOutput");
	var webSocket2;

	function artConnect() {
		// create a websocket
		webSocket2 = new WebSocket(endPointURL2);

		webSocket2.onopen = function(event) {
			console.log("onopen");
// 			updateStatus("WebSocket artConnected");
			document.getElementById('artSendMessage').disabled = false;
// 			document.getElementById('artConnect').disabled = true;
// 			document.getElementById('disartConnect').disabled = false;
		};

		webSocket2.onmessage = function(event) {
			var artMessagesArea = document.getElementById("artMessagesArea");
			var jsonObj = JSON.parse(event.data);
			var artMessage = jsonObj.artUserName + ": " + jsonObj.artMessage + "\r\n";
			artMessagesArea.value = artMessagesArea.value + artMessage;
			artMessagesArea.scrollTop = artMessagesArea.scrollHeight;
		};

		webSocket2.onclose = function(event) {
// 			updateStatus("WebSocket DisartConnected");
		};
	}

	var inputartUserName = document.getElementById("artUserName");
	inputartUserName.focus();

	function artSendMessage() {
		var artUserName = inputartUserName.value.trim();
		if (artUserName === "") {
			alert("Input a user name");
			inputartUserName.focus();
			return;
		}

		var inputartMessage = document.getElementById("artMessage");
		var artMessage = inputartMessage.value.trim();

		if (artMessage === "") {
			alert("Input a artMessage");
			inputartMessage.focus();
		} else {
			var jsonObj = {
				"artUserName" : artUserName,
				"artMessage" : artMessage
			};
			webSocket2.send(JSON.stringify(jsonObj));
			inputartMessage.value = "";
			inputartMessage.focus();
		}
	}

	function disartConnect() {
		webSocket2.close();
		document.getElementById('artSendMessage').disabled = true;
// 		document.getElementById('artConnect').disabled = false;
// 		document.getElementById('disartConnect').disabled = true;
	}

// 	function updateStatus(newStatus) {
// 		statusOutput.innerHTML = newStatus;
// 	}
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/styleWen.css">
</body>
</html>