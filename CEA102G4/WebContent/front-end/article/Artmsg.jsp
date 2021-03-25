<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.artmsg.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert artmsg here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head> 
<div>
<%
ArtMsgVO artMsgVO = (ArtMsgVO) request.getAttribute("artMsgVO");
%>
<jsp:useBean id="artmsgSvc" class="com.artmsg.model.ArtMsgService" />
<jsp:useBean id="memberSvc" class="com.member.model.MemberService" />
<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	

	<div id="msgSend">
		<img class='MsgImgm' src='<%=request.getContextPath()%>/AllPic.do?table=member_list&amp;picColumn=mem_pic&amp;idColumn=mem_id&amp;id='${memberVO.memId} alt=''>
		<input type="TEXT" id='artMsgText' name="artMsgText" size="45" maxlength="40" autocomplete="off" placeholder="留言...">
		<input type="hidden" id="artNo" name="artNo" value="${artVO.artNo}">
		<input type="hidden" id="memId" name="memId" value="${memberVO.memId}">
	<input type="button"class="submit"id="btn1"value="送出" required/> 
	</div>
	<div id="showMsg"></div>
	
	<script type="text/javascript">
	

	$(document).ready(function(){
		getMsg();
	});
	function getMsg(){
		$.ajax({
			url:"<%=request.getContextPath()%>/ArtmsgServlet",
			type:"POST",
			data:{
				action:"getMsgByArtNo",
				artNo : $("#artNo").val()
			},
			dataType:"json",
			
			success:function(data){
				generateThreeMsg(data);
			}
		});
	};
	function generateThreeMsg(data){
		var html = '';
		
		for(let i=0 ; i< data.length && i<3; i++){
			
		html += "<div id='oneArtMsg'>";
			html +="<img class='imgm' src='<%=request.getContextPath()%>/AllPic.do?table=member_list&amp;picColumn=mem_pic&amp;idColumn=mem_id&amp;id='data[i].memId alt=''>";
			html +="<div id='artMsgName'>";
				html += "<tr><td>"+data[i].memName+"</td>"
			html +="</div>"
			html += "<div id='artMsgText'>";
				html += "<td>"+data[i].artMsgText+"</td>"
				html += "</div>"
			html += "<div id='artMsgTime'>";
				html += "<td>"+postArticleTime(data[i].artMsgTime)+"</td>"
			html += "</div>"
		html += "</div>"
		if(i>1){
			html +="<div id='moreMsg'>"
				html +="<input type='button' id='moreMsgBtn' value='顯示更多的留言......'>"
			html +="</div>"
			
			
			}
				$("#showMsg").html(html);
				initBtn();
			}
		
	};
	

	function initBtn(){
	$("#moreMsgBtn").on("click",function(){
		getAllMsg();
	});
	}
	
	function getAllMsg(){
		$.ajax({
			url:"<%=request.getContextPath()%>/ArtmsgServlet",
			type:"POST",
			data:{
				action:"getMsgByArtNo",
				artNo : $("#artNo").val()
			},
			dataType:"json",
			
			success:function(data){
				generateMsg(data);
			}
		});
	}
	function generateMsg(data){
	var html = '';
	
	for(let i=0 ; i< data.length  ; i++){
	
	html += "<div id='oneArtMsg'>";
		html +="<img class='imgm' src='<%=request.getContextPath()%>/AllPic.do?table=member_list&amp;picColumn=mem_pic&amp;idColumn=mem_id&amp;id='data[i].memId alt=''>";
		html +="<div id='artMsgName'>";
			html += "<tr><td>"+data[i].memName+"</td>"
		html +="</div>"
		html += "<div id='artMsgText'>";
			html += "<td>"+data[i].artMsgText+"</td>"
			html += "</div>"
		html += "<div id='artMsgTime'>";
			html += "<td>"+postArticleTime(data[i].artMsgTime)+"</td>"
		html += "</div>"
	html += "</div>"
	
		}

	$("#showMsg").html(html);
	};
	
	$('#artMsgText').keyup(function (event) {
	      if (event.keyCode == 13) {
	         $("#btn1").click();
	     }
	 });
	$("#msgSend").on("click","#btn1",function(){
		var artMsgText = $("#artMsgText").val();
		var artNo =$("#artNo").val();
		var memId =$("#memId").val();
		if($("#artMsgText").val()==''){
			alert("請輸入留言");
		return;}
		
		if($("#memId").val()=='<input type=')
			alert("請先登入會員");
		$.ajax({
			url:"<%=request.getContextPath()%>/ArtmsgServlet",
			type:"POST",
			data:{
				artMsgText : artMsgText,
				action : "insert",
				artNo : artNo,
				memId : memId
				
			},
			success:function(data){
				getMsg();
				$("#artMsgText").val("");
				
			}
			
		});

	});
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
        	return exceedWeek+'週前';                   
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
	
	
 
</div>
</html>