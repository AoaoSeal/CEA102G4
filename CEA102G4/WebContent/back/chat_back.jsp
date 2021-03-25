<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/css/chat/chatbox_back.css" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.chat-panel {
	    height: 500px;
	    overflow-y: scroll;
	}
	
	#sidecontent{
		flex-direction:column-reverse;
		display:flex;
	}
	
	.friend-drawer{
	  position: relative;
	}
		
	
	.dataCount::after{
		position: absolute; 
		content: attr(data-count); 
		top: calc(0%); 
		right: 0px; 
		font-size: 20px; 
		text-align: center; 
		height: 30px; 
		width: 30px; 
		border-radius: 16px; 
		color: #fff; 
		background-color: red; 
    
/* 		content: attr(data-count); */
/* 		position: absolute; */
/* 		font-size: 14px; */
/* 		text-align: center; */
/* 		line-height: 16px; */
/* 		height: 16px; */
/* 		width: 16px; */
/* 		border-radius: 16px; */
/* 		color: #fff; */
/* 		top: calc(0%); */
/* 		right: 0px;  */
/* 		background-color: #02F78E; */

	}
	.friend-drawer1 {
            padding: 10px 15px;
            display: flex;
            vertical-align: baseline;
            background: #fff;
            transition: .3s ease;

            &--grey {
                background: #eee;
            }
	.friend-drawer1 {
	  position: relative;
	}
	
     .chat-bubble {
     	width:150px!important;
         margin: 10px 20px!important;
     }
      

</style>
<style id="css"></style>
<title>backkk</title>
</head>

<body onload="connect();" onunload="disconnect();">

<!-- 	<h3 id="statusOutput" class="statusOutput"></h3> -->
<!-- 	<div id="row"></div> -->
<!-- 	<div id="messagesArea" class="panel message-area" ></div> -->
<!-- 	<div class="panel input-area"> -->
<!-- 		<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" />  -->
<!-- 		<input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" />  -->
<!-- 		<input type="button" id="connect" class="button" value="Connect" onclick="connect();" />  -->
<!-- 		<input type="button" id="disconnect" class="button" value="Disconnect" onclick="disconnect();" /> -->
<!-- 	</div> -->
     <div class="container pr-0 pl-0">
        <div class="row no-gutters">
            <!--整個側邊欄 START-->
            <div class="col-md-4 border">
                <div class="settings-tray">
                    <img class="profile-image" src="<%= request.getContextPath()%>/resource/images/logo.png" alt="Profile img">
                    TibaMountain客服系統
                </div>
                <div class="search-box">
                    <div class="input-wrapper">
                        <i class="material-icons">search</i>
                        <input placeholder="Search here" type="text">
                    </div>
                </div>
                <!-- 側邊欄 START -->
                <div id="sidecontent">
                
<!--                 <div class="friend-drawer friend-drawer--onhover"> -->
<!--                     <img class="profile-image" src="img/heart.png" alt=""> -->
<!--                     <div class="text"> -->
<!--                         <h6 id="sidelist">Robo Cop</h6> -->
<!--                         <p class="text-muted">Hey, you're arrested!</p> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <hr> -->
                </div>
            </div>
            <!-- 側邊欄 END -->
            <!--整個側邊欄 END-->
            
            
            <!--整個聊天區 START-->
            <div class="col-md-8 border">
                <div class="settings-tray">
                    <div class="friend-drawer1 no-gutters friend-drawer--grey">
                        <img class="profile-image" src="<%= request.getContextPath()%>/resource/images/heart.png" alt="">
                        <div class="text">
                            <h6 id="memberName"></h6>
                            <p class="text-muted">正在與您對話....</p>
                        </div>
                    </div>
                </div>
                <!-- 對話內容 START -->
                <div class="chat-panel" id="messagesArea">
<!--                     <div class="row no-gutters"> -->
<!--                         <div class="col-md-3"> 會員 -->
<!--                             <div class="chat-bubble chat-bubble--left"> -->
<!--                                 Hello dude! -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
<!--                  <div class="row no-gutters"> -->
<!--                         <div class="col-md-3 offset-md-9">admin -->
<!--                             <div class="chat-bubble chat-bubble--right"> -->
<!--                                 Hello dude! -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
                    <!--     
                <!-- 對話內容 END -->
                <div class="row">
                    <div class="col-12">
                        <div class="chat-box-tray">
<!--                             <i class="material-icons">sentiment_very_satisfied</i> -->
                            <input id="message" type="text" placeholder="Send a message" onkeydown="if (event.keyCode == 13) sendMessage();">
                            <i class="material-icons" id="" onclick="sendMessage();">send</i>
                        </div>
                    </div>
                </div>
                <!-- </div> -->
            </div>
            <!--整個聊天區 END-->
        </div>
    </div>
<%@ include file="/resource/file/back-end.file" %>
</body>
<script>
var admId=6666;
var memId = 1007;

	var MyPoint = "/FriendWS/admin/"+admId;
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

// 	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = "admin";
	var selfName = "admin";
	var webSocket;

	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
		console.log("Connect Success!");
// 			getHistory();
// 			document.getElementById('sendMessage').disabled = false;
// 			document.getElementById('connect').disabled = true;
// 			document.getElementById('disconnect').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			if ("history" === jsonObj.type) {			
console.log(jsonObj);		
				messagesArea.innerHTML = '';
				// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
				var messages = JSON.parse(jsonObj.message);
				for (var i = 0; i < messages.length; i++) {
					var historyData = JSON.parse(messages[i]);
					if(historyData.sender===self){					
						var div = document.createElement('div');
						div.className = "row no-gutters";
						let html="<div class='col-md-3 offset-md-9'>";
						html+="<div class='chat-bubble chat-bubble--right'>"+historyData.message+"</div></div></div>";
						div.innerHTML= html;
						messagesArea.append(div);
					}else{
						var div = document.createElement('div');
						div.className = "row no-gutters";
						let html="<div class='col-md-3'>";
						html+="<div class='chat-bubble chat-bubble--left'>"+historyData.message+"</div></div></div>";
						div.innerHTML= html;
						messagesArea.append(div);
					}								
				}
				messagesArea.scrollTop = messagesArea.scrollHeight;

//====================================================================
// 				messagesArea.innerHTML = '';
// 				var ul = document.createElement('ul');
// 				ul.id = "area";
// 				messagesArea.appendChild(ul);
// 				// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
// 				var messages = JSON.parse(jsonObj.message);
// 				for (var i = 0; i < messages.length; i++) {
// 					var historyData = JSON.parse(messages[i]);
// 					var showMsg = historyData.message;
// 					var li = document.createElement('li');
// 					// 根據發送者是自己還是對方來給予不同的class名, 以達到訊息左右區分
// 					historyData.sender === self ? li.className += 'me' : li.className += 'friend';
// 					li.innerHTML = showMsg;
// 					ul.appendChild(li);
// 				}
// 				messagesArea.scrollTop = messagesArea.scrollHeight;
//====================================================================
			
			} else if ("chat" === jsonObj.type) {
				if(jsonObj.sender===self){					
					var div = document.createElement('div');
					div.className = "row no-gutters";
					let html="<div class='col-md-3 offset-md-9'>";
					html+="<div class='chat-bubble chat-bubble--right'>"+jsonObj.message+"</div></div></div>";
					div.innerHTML= html;
					messagesArea.append(div);
				}else{
				if( $(".sidelist").text().indexOf(jsonObj.sender)!=-1){
					//列表裡已經有此會員
					$("#"+jsonObj.sender).children().children(".text-muted").text(jsonObj.message);
					$("#"+jsonObj.sender).css("order",getMaxOrder());
					let count = +$("#"+jsonObj.sender).attr("data-count");
					if(jsonObj.sender != $("#memberName").text()){
						$("#"+jsonObj.sender).attr("data-count",1+count);
						$("#"+jsonObj.sender).addClass("dataCount");
					}
				}else{
					//列表裡無此會員
					var div = document.createElement('div');
					div.className = "friend-drawer friend-drawer--onhover";
					div.id=jsonObj.sender;
					div.style.order = getMaxOrder();
					div.style.backgroundColor = "#f5f5f5";
					div.style.borderBottom = "1px solid #dcdcdc";
 					div.setAttribute("data-count",1);
 					$(div).addClass("dataCount");
 					

					let html="<img class='profile-image' src='img/heart.png'>";
// 					html+="<div class='dataCount'>";
					html+="<div class='text'>";
					html+="<h6 class='sidelist'>"+jsonObj.sender+"</h6>";
					html+="<p class='text-muted'>"+jsonObj.message+"</p></div></div></div>";
					div.innerHTML=html;
					console.log(div);
					
// 					$(".dataCount").attr("data-count",1);					
					$("#sidecontent").append(div);

				}
				if($("#memberName").text()==jsonObj.sender){
						console.log("in");	
						var div = document.createElement('div');
						div.className = "row no-gutters";
						let html="<div class='col-md-3'>";
						$("#memberName").text(jsonObj.sender);
						$("#sidelist").text(jsonObj.sender);
						$("#sidelist").next().text(jsonObj.message);
					
						html+="<div class='chat-bubble chat-bubble--left'>"+jsonObj.message+"</div></div></div>";
						div.innerHTML= html;
						messagesArea.append(div);
					}
				}
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} 			
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	
	$("#sidecontent").on("click",".friend-drawer",function(){
		$(this).attr("data-count",0);

 		$(this).removeClass("dataCount");
		let memId = $(this).children().children(".sidelist").text();
		$("#memberName").text(memId);
		getHistoryForTitle(memId);
		
		
	})


	
	function getMaxOrder(){
		let maxOrder = +0;
		for (let i = 0 ;i < $(".friend-drawer").length;i++){
			let order = +$(".friend-drawer").eq(i).css("order");
			if(order > maxOrder){
				maxOrder = +order;
			}
		}
		return (1+maxOrder);
	}
	
	
	function sendMessage() {
		var inputMessage = document.getElementById("message");
// 		var friend = statusOutput.textContent;
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
// 		} else if (friend === "") {
// 			alert("Choose a friend");
		} else {
			var jsonObj = {
				"type" : "chat",
				"sender" : "admin",
				"receiver" :"member"+memId ,
				"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
// 	// 有好友上線或離線就更新列表
// 	function refreshFriendList(jsonObj) {
// 		var friends = jsonObj.users;
// 		var row = document.getElementById("row");
// 		row.innerHTML = '';
// 		for (var i = 0; i < friends.length; i++) {
// 			if (friends[i] === self) { continue; }
// 			row.innerHTML +='<div id=' + i + ' class="column" name="friendName" value=' + friends[i] + ' ><h2>' + friends[i] + '</h2></div>';
// 		}
// 		addListener();
// 	}
// 	// 註冊列表點擊事件並抓取好友名字以取得歷史訊息
// 	function addListener() {
// 		var container = document.getElementById("row");
// 		container.addEventListener("click", function(e) {
// 			var friend = e.srcElement.textContent;
// 			updateFriendName(friend);
// 			var jsonObj = {
// 					"type" : "history",
// 					"sender" : self,
// 					"receiver" : friend,
// 					"message" : ""
// 				};
// 			webSocket.send(JSON.stringify(jsonObj));
// 		});
// 	}
	function getHistory() {
		var jsonObj = {
				"type" : "history",
				"sender" : "admin",
				"receiver" : "member"+memId,
				"message" : ""
			};
		webSocket.send(JSON.stringify(jsonObj));
	}
	
	function getHistoryForTitle(memId) {
		var jsonObj = {
				"type" : "history",
				"sender" : "admin",
				"receiver" : memId,
				"message" : ""
			};
		webSocket.send(JSON.stringify(jsonObj));
	}
	function disconnect() {
		webSocket.close();
// 		document.getElementById('sendMessage').disabled = true;
// 		document.getElementById('connect').disabled = false;
// 		document.getElementById('disconnect').disabled = true;
	}
	
// 	function updateFriendName(name) {
// 		statusOutput.innerHTML = name;
// 	}
</script>
</html>