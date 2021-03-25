<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%-- 此測試頁，練習採用 EL 的寫法取值 --%>
<jsp:useBean id="memberDAO" scope="session"
	class="com.member.model.MemberDAO" />


<!DOCTYPE html>
<html lang="zh-TW">


<head>

<!-- 這段是為了每次到新的頁面就刷新一次VO確保錢包餘額是最即時的 -->
		<%
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
		
		if(memberVO!=null){
			int mem_id = memberVO.getMemId();
			MemberService memberSvc = new MemberService();
			MemberVO memberVO3 = memberSvc.getOneMem(mem_id);
			request.getSession().setAttribute("memberVO", memberVO3);	
		}
		%>
<!-- 這段是為了每次到新的頁面就刷新一次VO確保錢包餘額是最即時的 -->		

<title>${memberFunction}TiBaMountain登山複合平台</title>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<LINK rel="SHORTCUT ICON" HREF="http://www.mydomain.com/myicon.ico"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/chat/chatbox.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/add.js"></script>
<script src="${pageContext.request.contextPath}/resource/js/follow.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/style2.css">

<input id="PageContext" type="hidden"
	value="${pageContext.request.contextPath}" />
<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<header>
	<div>
		<a
			href="${pageContext.request.contextPath}/front-end/front_end_index.jsp"
			class="logo"> <img class="logoimg"
			src="${pageContext.request.contextPath}/resource/images/logo.png"
			alt=""></a>
	</div>
	<div class="menuToggle" onclick="menuToggle();"></div>
	<ul class="navigation">
		<li><a
			href="${pageContext.request.contextPath}/front-end/front_end_index.jsp">首頁</a></li>
		<li><a
			href="${pageContext.request.contextPath}/front-end/itinerary/listAllIt.jsp">行程</a></li>
		<li><a
			href="${pageContext.request.contextPath}/front-end/bid/bid_index.jsp">競標</a></li>
		<li><a
			href="${pageContext.request.contextPath}/front-end/goods/listAllGoods2.jsp">商城</a></li>
		<li><a
			href="${pageContext.request.contextPath}/front-end/article/listAllArt.jsp">社群</a></li>
<!-- 		<li><a -->
<%-- 			href="${pageContext.request.contextPath}/front-end/test.jsp">ajax追蹤測試</a></li> --%>
	</ul>
	<c:if test="${memberVO.memId==null}">
		<ul class="navigationright">
			<li><a href="${pageContext.request.contextPath}/front-end/mem.do?action=logoin" >登入 / 註冊</a></li>
	</c:if>
	<c:if test="${memberVO.memId !=null }">
		<ul class="navigationright">
			<li><a href="${pageContext.request.contextPath}/front-end/member/member_all_message.jsp"><img class="imgmessage"
					src="${pageContext.request.contextPath}/resource/images/message1.png"
					alt=""></a></li>
			<li><a
				href="${pageContext.request.contextPath}/front-end/member/member_all_follow.jsp"
				display="none"><img class="imgh"
					src="${pageContext.request.contextPath}/resource/images/heart.png"
					alt=""></a></li>
			<li><a href="${pageContext.request.contextPath}/front-end/tra/select_page.jsp">
					<p class="bal">
						錢包餘額<br> <span class="memtraBal">${memberVO.traBal}</span>
					</p>
			</a></li>
			<li><a
				href="${pageContext.request.contextPath}/front-end/member/member_index.jsp">
					<img class="imgm"
					src="${pageContext.request.contextPath}/${memberVO.allPic}" alt="">

			</a></li>
		</ul>
	</c:if>


	<input type="hidden" class="memberidsave" id="${memberVO.memId}">
	
	
	   <div class="fabs">
        <div class="chat">
            <div class="chat_header">
                <div class="chat_option">
                    <div class="header_img">
                        <img src="${pageContext.request.contextPath}/resource/images/noPic.jpg" />
                    </div>
                    <span id="chat_head">線上客服人員-小貓</span><br><span class="online">(Online)</span>
                    <span id="chat_fullscreen_loader" class="chat_fullscreen_loader"><i class="fullscreen zmdi zmdi-window-maximize"></i></span>
                </div>
            </div>
            <div id="chat_converse" class="chat_conversion chat_converse">
                <!-- <a id="chat_first_screen" class="fab"><i class="zmdi zmdi-arrow-right"></i></a> -->
                <p>可以開始與客服對話</p>
                
            </div>
  <!-- 訊息框 -->
            <div class="fab_field">
				<input id="message" class="chat_field chat_message" type="text" placeholder="　Send a message" onkeydown="if (event.keyCode == 13) ZoesendMessage();"/> 
				<i class="zmdi zmdi-mail-send" id="" onclick="ZoesendMessage();"></i>
<!-- 				<input id="message" class="chat_field chat_message" type="text" placeholder="　Send a message"/>  -->
<!-- 				<i class="zmdi zmdi-mail-send" id="" ></i> -->
            </div>
        </div>
        <a id="prime" class="fab"><i class="prime zmdi zmdi-comment-outline"></i></a>
    </div>
    <script src='http://code.jquery.com/jquery-1.11.3.min.js'></script>
<!--     <script src="js/index.js"></script> -->
          
</header>
</head>
<body>
	<sitemesh:write property='body' />

    
</body>



<c:if test="${openModal!=null}">

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">
           <c:if test="${openlogin!=null}">     
                	會員登入
                </c:if>
          <c:if test="${openadd!=null}">
               	 會員註冊
				</c:if>
                
                
                </h3>
            </div>
			
			<div class="modal-body">
			
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
<c:if test="${openlogin!=null}">
<jsp:include page="/front-end/member/member_login.jsp" />
</c:if>
<c:if test="${openadd!=null}">
<jsp:include page="/front-end/member/member_add.jsp" />
</c:if>
<!-- =========================================以上為原listOneEmp.jsp的內容========================================== -->
			</div>
			
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
<!--                 <button type="button" class="btn btn-primary">Save changes</button> -->
            </div>
		
		</div>
	</div>
</div>
<style>

</style>

        <script>
    		 $("#basicModal").modal({show: true});
        </script>
 </c:if>

	<style>
 .modal .modal-dialog {
    -webkit-transform: none;
    transform: none;
    margin-top: 250px;
}

	
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resource/js/slick.js"></script>

	 <script>
     hideChat(1);

     $('#prime').click(function() {
         toggleFab();
         
         
     });
     //Toggle chat and links
     function toggleFab() {
     	
     		Zoeconnect();
     	
         $('.prime').toggleClass('zmdi-comment-outline');
         $('.prime').toggleClass('zmdi-close');
         $('.prime').toggleClass('is-active');
         $('.prime').toggleClass('is-visible');
         $('#prime').toggleClass('is-float');
         $('.chat').toggleClass('is-visible');
         $('.fab').toggleClass('is-visible');
         
     }
     $('#chat_fullscreen_loader').click(function(e) {
         $('.fullscreen').toggleClass('zmdi-window-maximize');
         $('.fullscreen').toggleClass('zmdi-window-restore');
         $('.chat').toggleClass('chat_fullscreen');
         $('.fab').toggleClass('is-hide');
         $('.header_img').toggleClass('change_img');
         $('.img_container').toggleClass('change_img');
         $('.chat_header').toggleClass('chat_header2');
         $('.fab_field').toggleClass('fab_field2');
         $('.chat_converse').toggleClass('chat_converse2');
     });

     function hideChat(hide) {
//      	if (ZoewebSocket.readyState===1){
//      		Zoedisconnect();
     		
//      	}
     	
         switch (hide) {
         
             case 0:
                 $('#chat_converse').css('display', 'none');
                 $('#chat_body').css('display', 'none');
                 $('#chat_form').css('display', 'none');
                 $('.chat_login').css('display', 'block');
                 $('.chat_fullscreen_loader').css('display', 'none');
                 $('#chat_fullscreen').css('display', 'none');
                 break;
             case 1:
                 $('#chat_converse').css('display', 'block');
                 $('#chat_body').css('display', 'none');
                 $('#chat_form').css('display', 'none');
                 $('.chat_login').css('display', 'none');
                 $('.chat_fullscreen_loader').css('display', 'block');
                 break;    
         }
     }
      
	
	
	
	
	
	
	
	 memId = $(".memberidsave").attr("id");
	
// 	 $('#prime').click(function() {
//          toggleFab();
//          Zoeconnect();
//      });
	 
	 
// 	$( document ).ready(function() {
// 		memId = $(".memberidsave").attr("id");
		
// 	});


	$(window).on("unload", function(e) {
		
		Zoedisconnect();
		
		
		});
	
	
	
	var MyPoint = "/FriendWS/member/"+memId;
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

// 	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("chat_converse");
	var self = "member"+memId;
	var selfName = 'Tom';
	var ZoewebSocket;

	function Zoeconnect() {
		// create a websocket
		ZoewebSocket = new WebSocket(endPointURL);

		ZoewebSocket.onopen = function(event) {
			
			console.log("Connect Success!");			
			getHistory();
			document.getElementById('chat_converse').scrollTop = 9999999;

		};

		ZoewebSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			if ("history" === jsonObj.type) {
				messagesArea.innerHTML = '';
				var ul = document.createElement('ul');
				ul.id = "area";
				messagesArea.appendChild(ul);
				
				// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
				var messages = JSON.parse(jsonObj.message);
				for (var i = 0; i < messages.length; i++) {
					var historyData = JSON.parse(messages[i]);
					if(historyData.sender===self){					
						var span = document.createElement('span');
						span.className = "chat_msg_item chat_msg_item_user";
						let html="<div class='chat_avatar'>";
						html+="<img src='img/heart.png'></div>";
						html+="<div class='text'>"+historyData.message+"</div></div>";
						span.innerHTML= html;
						ul.appendChild(span);
					}else{
						var span = document.createElement('span');
						span.className = "chat_msg_item chat_msg_item_admin";
						let html="<div class='chat_avatar'>";
						html+="<img src='img/noPic.jpg'></div>";
						html+="<div class='text'>"+historyData.message+"</div></div>";
						span.innerHTML= html;
						ul.appendChild(span);
					}
					
				}
				messagesArea.scrollTop = messagesArea.scrollHeight;
				
			} else if ("chat" === jsonObj.type) {
				var ul = document.createElement('ul');
				ul.id = "area";
				messagesArea.appendChild(ul);
				if(jsonObj.sender===self){
					var span = document.createElement('span');
					span.className = "chat_msg_item chat_msg_item_user";
					let html="<div class='chat_avatar'>";
					html+="<img src='img/heart.png'></div>";
					html+="<div class='text'>"+jsonObj.message+"</div></div>";
					span.innerHTML= html;
					ul.appendChild(span);
					messagesArea.scrollTop = messagesArea.scrollHeight;
				}else{
					var span = document.createElement('span');
					span.className = "chat_msg_item chat_msg_item_admin";
					let html="<div class='chat_avatar'>";
					html+="<img src='img/noPic.jpg'></div>";
					html+="<div class='text'>"+jsonObj.message+"</div></div>";
					span.innerHTML= html;
					ul.appendChild(span);
					messagesArea.scrollTop = messagesArea.scrollHeight;
				}
				messagesArea.scrollTop = messagesArea.scrollHeight;

			} 
			
		};

		ZoewebSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	function ZoesendMessage() {
		var inputMessage = document.getElementById("message");
// 		var friend = statusOutput.textContent;
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else {
			var jsonObj = {
				"type" : "chat",
				"sender" : "member"+memId,
				"receiver" : "admin",
				"message" : message
			};
			ZoewebSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	

	function getHistory() {
		var jsonObj = {
				"type" : "history",
				"sender" : "member"+memId,
				"receiver" : "admin",
				"message" : ""
			};
		ZoewebSocket.send(JSON.stringify(jsonObj));
	}
	
	function Zoedisconnect() {
		ZoewebSocket.close();

	};
	

</script>
<script>

$(document).ready(function() {
	$(".memimgBx .imgm").click(function() {
		$(".memtext").not($(this).next(".memtext")).hide("fast");
		$(this).next(".memtext").toggle("fast");

	});
});
	$('.variable').slick({
		dots : true,
		infinite : true,
		autoplay : true,
		autoplaySpeed : 2000,
		speed : 300,
		slidesToShow : 1,
		centerMode : true,
		variableWidth : true
	});
	

	PageContext =$("#PageContext").val();

</script>


<c:if test="${memberVO.memId==null}">
	<script type="text/javascript">
	
	$(document).ready(function() {
// 		$("#basicModal").modal({
		// 				show : true
// 		});

		function close() {
// 			$("#basicModal").modal({
			// 					show : false
// 			});
			// 				$("link").remove();
		}
		$(".modal-backdrop.in").hide();
		// 			$(".logoinpage").hide();
		// 			$(".addmempage").hide();

		$(".logoin").click(function() {
			$(".logoinpage").hide();
			$(".addmempage").hide();
			$(".modal-backdrop.in").hide();
			// 				alert("有");
			$(".logoinpage").show();
			$(".modal-backdrop").show();
$(".modal-backdrop").css({"visibility": "initial"});

		})
		$("#adda").click(function() {

			// 				alert("有");
			$(".logoinpage").hide();
			$(".modal-backdrop.in").hide();
			showaddmempage();

		})

	
		
		$(".btn-default").click(function() {

			$(".logoinpage").hide();
			$(".addmempage").hide();
			$(".modal-backdrop.in").hide();
		})

	});

	function showaddmempage() {
		$(".addmempage").show();
		$(".modal-backdrop").show();
	}
	
	
	
	
	</script>
</c:if>

<script type="text/javascript">
	window.addEventListener('scroll', function() {
		const header = document.querySelector('header');
		header.classList.toggle('sticky', window.scrollY > 0);
		const memberToggle = document.querySelector("#memberToggle");
		const memberFunction = document.querySelector(".memberFunction");

	});

	function menuToggle() {
		const menuToggle = document.querySelector(".menuToggle");
		const navigation = document.querySelector(".navigation");
		menuToggle.classList.toggle('active');
		navigation.classList.toggle('active');
	}

	
</script>


<footer class="footer">
	<div class="copyrightText">
		<p>
			Copyright 2021 <a href="#">Ti Ba Mountain</a>. All right Reserved
		</p>
	</div>
</footer>
</html>