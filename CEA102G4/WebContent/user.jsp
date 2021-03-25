<%@ page import="java.sql.*"%>

<html>

<head>

<script type="text/javascript">
	//先检验能不能运行起来，能不能连上，自动推送数据，先不做数据显示

	//客户端就会与服务器进行连接
	//  var wsUri = getRootUri() + "/websocket";

	var MyPoint = "/websocket";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	//         var webSocket = new WebSocket("ws://192.168.1.120:8081/websocket");
	//         var webSocket = new WebSocket("ws://localhost:8081/websocket");
	console.log(endPointURL);
	var webSocket = new WebSocket("ws://localhost:8081/CEA102G4/websocket");

	//这里只是调试用

	//连接失败时回调

	webSocket.onerror = function(event) {

		makeDataOnWeb("error");

	};

	//这里只是调试用

	//连接成功时回调，真的会执行括号中的代码！

	webSocket.onopen = function(event) {

		makeDataOnWeb("conn success");

	};

	webSocket.onmessage = function(event) {

		makeDataOnWeb(event.data);

	};

	//这里只是调试用

	webSocket.onclose = function(event) {

		makeDataOnWeb("conn close");

	};

	function makeDataOnWeb(data) {
		console.log(data);
		var a = data;

		var divNode = document.getElementById("view");

		var liNode = document.createElement("li");

		liNode.innerHTML = a;

		divNode.appendChild(liNode);

		           divNode.insertBefore(liNode, divNode.children[0]);

// 		不能用insertAfter，好像不是这么用的

// 		           var divNode = document.getElementById("view");

// 		           var trNode = document.createElement("tr");

// 		           var td1 = document.createElement("td");

// 		           var td2 = document.createElement("td");

// 		           var td3 = document.createElement("td");

// 		           td1.innerHTML = a;

// 		           td2.innerHTML = a;

// 		           td3.innerHTML = a;

// 		           trNode.appendChild(td1)

// 		           trNode.appendChild(td2)

// 		           trNode.appendChild(td3)

// 		           var head = document.getElementById("head");

// 		           document.write(a+"<br>");//直接写

// 		           document.getElementsById("a").innerHTML="fadfadfa";//不输出任何内容

	};
</script>

</head>



<body>



	<%@page contentType="text/html; utf8"%>

	<%@page language="java"%>

	<%@page import="java.sql.*"%>

	<%@page pageEncoding="UTF-8"%><!--解决中文乱码-->



	<div id="view"></div>



</body>


</html>