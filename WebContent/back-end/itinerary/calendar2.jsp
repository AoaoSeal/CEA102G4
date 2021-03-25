<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<style>

	#itContainer{ 
 		display:flex; 
 	} 
	
  	#calendar {  
  		dispaly:inline-block;  
  		max-width: 1150px;  
  		margin: 0 auto; 
 		margin-top:10px;  
  		margin-left:80px;  
  		matgin-bottom:50px;
  		padding: 0;	  
  		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;  
 		font-size: 14px; 
 		margin-bottom: 100px; 
  	}  
  	#colorOfCal{  
 		dispaly:inline-block;  
		margin-top:80px;  
 		margin-left:50px;  
  	}  
  	#divItc{ 
  		dispaly:inline-block;   
 		margin-top:200px;   
  		margin-left:20px;    	 
  	} 
	#btnItc {
/* 	    margin-left: 70px; */
	    width: 150px;
	    height: 45px;
	    font-size: 18px;
	    border-radius: 10px;
	    border:1px solid #26BEC9;
	    background-color: #26BEC9;
	    color: #fff;
	    opacity: 0.7;
	}	
 	.ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight {  
  	    border: 1px solid #f9dd34;  
  	    background: #F5F5DC;  
  	    color: #F5F5DC; 
      }  
   

/*     .fc-scroller { */
/*    	    overflow: hidden; */
/*    		overflow-x: hidden; */
/*    		overflow-y: hidden !important; */
/*    } */
    .fc-event{ 
 		font-size:16px; 
    } 
    
 	.fc-event, .fc-event:hover, .ui-widget .fc-event { 
 		color:#000; 
 	} 
 	
 	div.h3Div{ 
 		display:inline-block; 
 		margin-left:20px; 
 	} 

 	div.btnDiv{ 
 		display:inline-block; 
 		margin-left:650px; 
 	} 
	
 	#insertInp{ 
 		display:inline-block; 
 		margin-left:780px; 
		border-width: 2px; 
 	    font-weight: 600; 
 	    font-size: 0.8571em; 
 	    line-height: 1.35em; 
 	    text-transform: uppercase; 
 	    border: none; 
 	    border-radius: 3px; 
 	    padding: 11px 22px; 
 	    cursor: pointer; 
 	    background-color: #66615B; 
 	    color: #FFFFFF; 
 	    transition: all 150ms linear; 
 	} 
 	.wrapper {
	    height:0!important;
	}
 	.footer {
		position: relative!important;
	}



</style>

<div id="itContainer">
	<div id="divItc">
<%-- 		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary_category/listAllItc.jsp"> --%>
<!-- 			<input id="btnItc" type="submit" value="✚行程類別管理"> -->
<!-- 		</FORM> -->
		<div id='colorOfCal'>
			<img src="<%= request.getContextPath()%>/resource/images/color/c4e1e1.png" width="30" height="30">下架<br>
			<img src="<%= request.getContextPath()%>/resource/images/color/b9cfa1.png" width="30" height="30">上架<br>
			<img src="<%= request.getContextPath()%>/resource/images/color/ededed.jpg" width="30" height="30">完成<br>
			<img src="<%= request.getContextPath()%>/resource/images/color/ceb5b3.jpg" width="30" height="30">取消<br>
		</div>
	</div>
	<div id='calendar'></div>
</div>	
<!-- 新增行程modal start -->  	
 <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h3Div"><h3 class="modal-title" id="myModalLabel">新增行程 </h3></div>
                    <div class="btnDiv">
                    	 <button type="button" class="btn btn-default" data-dismiss="modal">X</button>
                    </div>                   
                </div>
                <div class="modal-body"> 
					<!-- content start --> 
					<div id="modalViewAdd">
<jsp:include page="/back-end/itinerary/addIt2.jsp" />
					<!-- content end --> 
                </div>
                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div>
</div>    
<!-- 新增行程modal end -->   
 
 
<!-- 無法新增行程modal start -->  	
 <div class="modal fade" id="cantAddModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                   <div class="h3Div"><h3 class="modal-title" id="myModalLabel">新增行程</h3></div>
                    <div class="btnDiv">
                    	 <button type="button" class="btn btn-default" data-dismiss="modal">X</button>
                    </div> 
                </div>
                <div class="modal-body"> 
					<!-- content start --> 
					<div id="modalViewAdd">
<img src="<%= request.getContextPath()%>/resource/images/icon/warning.png" width="50px">行程出發日期至少安排7日後
					<!-- content end --> 
                </div>
                <div class="modal-footer">
<!--                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
                </div>
            </div>
        </div>
    </div>
</div>    
<!-- 無法新增行程modal end -->   
 
<!-- 行程資訊modal start -->    
 <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="h3Div"><h3 class="modal-title" id="myModalLabel">行程資訊</h3></div>
                    <div class="btnDiv">						
                    	 <button type="button" class="btn btn-default" data-dismiss="modal">X</button>
                    </div> 
<!-- selectBtn status -->
					<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary/it.do">
					<div class="selectDiv">
						<select id="itStatus" name="itStatus"></select>
						<input type="hidden" name="action" value="updateStatus">
						<input type="hidden" name="itNo"  value="" id="updateStatus">		 
						<input type="submit" id="btnStatus" value="變更狀態">
					</div>			
					</FORM>										
<!-- selectBtn status -->
                </div>
                <div class="modal-body"> 
<!-- content start --> 
<div id="modalView"></div>
<!-- content end --> 
                </div>
                <div class="modal-footer">
<!--                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/itinerary/it.do">
						<input type="submit" value="編輯" id="insertInp">			   
						<input type="hidden" name="itNo"  value="" id="insertItno">
						<input type="hidden" name="action" value="getOne_For_Update">			   
					</FORM>
                </div>
            </div>
        </div>
    </div>
 <!-- 行程資訊modal end -->    
    


<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script> -->

<script>

var contextPath = "${pageContext.request.contextPath}";

// window.onload = function() {
// 	getSchedule();
// };

$(document).ready(function() {
	getSchedule();
});

function getSchedule() {
	let events = [];
	$.ajax({
		url : contextPath +"/itinerary/it.do",
		type : "POST",
		data : {
			action : "listEventsOnCal"
		},
		dataType : "JSON",
		cache:false,
		ifModified :true,
		success : function(data) {
			for (let i = 0; i < data.length; i++) {
				if(data[i].itStatus==0){ //下架
					events.push({
						id : data[i].itNo,
						start : moment(data[i].itDate).format('YYYY-MM-DD'),
						title : data[i].itName,
						color : "#C4E1E1",
						content:"<div style=font-size:16px;>"
								+data[i].itName
								+"<br>"+"領隊:"+data[i].ldName
								+"<br>"+data[i].itStartdate
								+"</div>"
					});
				}else if(data[i].itStatus==1){ //上架
					events.push({
						id : data[i].itNo,
						start : moment(data[i].itDate).format('YYYY-MM-DD'),
						title : data[i].itName,
						color : "#b9cfa1",
						content:"<div style=font-size:16px;>"
								+data[i].itName
								+"<br>"+"領隊:"+data[i].ldName
								+"<br>"+data[i].itStartdate
								+"</div>"
					});
				}else if(data[i].itStatus==2){ //完成
					events.push({
						id : data[i].itNo,
						start : moment(data[i].itDate).format('YYYY-MM-DD'),
						title : data[i].itName,
						color : "#ededed",
						content:"<div style=font-size:16px;>"
								+data[i].itName
								+"<br>"+"領隊:"+data[i].ldName
								+"<br>"+data[i].itStartdate
								+"</div>"
					});					
				}else if(data[i].itStatus==3){ //取消
					events.push({
						id : data[i].itNo,
						start : moment(data[i].itDate).format('YYYY-MM-DD'),
						title : data[i].itName,
						color : "#ceb5b3",
						content:"<div style=font-size:16px;>"
								+data[i].itName
								+"<br>"+"領隊:"+data[i].ldName
								+"<br>"+data[i].itStartdate
								+"</div>"
					});
				}
			}
			GenerateCalendar(events);
		}
	})
}


function getOneIt(itNo) {
	$.ajax({
		url : contextPath +"/itinerary/it.do",
		data : {
			action : "getOneItOnCal",
			itNo : itNo,
		},
		type : "POST",
		cache:false,
		ifModified :true,
		dataType : "json",

		success : function(data) {
console.log(data);			
			$("#modalView").empty();
			modalView(data);
			if(data.itStatus==0){
				$("#itStatus").html("<option value='0'>下架</option><option value='1'>上架</option><option value='3'>取消</option>");				
				$("input#insertItno").val(data.itNo);
				$("input#updateStatus").val(data.itNo);
				$(".selectDiv").find("#btnStatus").css('display','inline');
				$(".modal-footer").find("#insertInp").css('display','block');
			}else if(data.itStatus==1){
				$("#itStatus").html("<option value='1'>上架</option><option value='2'>結束</option><option value='3'>取消</option>");
				$("input#updateStatus").val(data.itNo);
				$(".selectDiv").find("#btnStatus").css('display','inline');
				$(".modal-footer").find("#insertInp").css('display','none');
			}else if(data.itStatus==2){
				$("#itStatus").html("<option value='2'>結束</option>");
				$(".selectDiv").find("#btnStatus").css('display','none');
				$(".modal-footer").find("#insertInp").css('display','none');
			}else if(data.itStatus==3){
				$("#itStatus").html("<option value='3'>取消</option>");
				$("input#updateStatus").val(data.itNo);
				$(".selectDiv").find("#btnStatus").css('display','none');
				$(".modal-footer").find("#insertInp").css('display','none');
			}
			$("select#itStatus").val(data.itStatus);
			$("#basicModal").modal('show');
		}
	});
}
	

function modalView(data) {
	let table = $("<table>");
	let tr = $("<tr>");
	let th = $("<th>");
	th.text("行程名稱:　");
	let td = $("<td>");
	td.text(" (" + data.itNo + ") - "+ data.itName + " - " + data.itDate);
	tr.append(th, td);
	table.append(tr);
	
	tr = $("<tr>");
	th = $("<th>");
	th.text("領隊:　");
	td = $("<td>");
	td.text(data.ldName);
	tr.append(th, td);
	table.append(tr);
	
	tr = $("<tr>");
	th = $("<th>");
	th.text("類別:　");
	td = $("<td>");
	td.text(data.itcName);
	tr.append(th, td);
	table.append(tr);
	
	tr = $("<tr>");
	th = $("<th>");
	th.text("天數:　");
	td = $("<td>");
	td.text(data.itDays+"日");
	tr.append(th, td);
	table.append(tr);
	
	tr = $("<tr>");
	th = $("<th>");
	th.text("費用:　");
	td = $("<td>");
	td.text("NT$ "+data.itPrice);
	tr.append(th, td);
	table.append(tr);
	
	tr = $("<tr>");
	th = $("<th>");
	th.text("報名起止日期:　");
	td = $("<td>");
	td.text(data.itStartdate+" ~ "+ data.itEnddate);
	tr.append(th, td);
	table.append(tr);
	
	
	tr = $("<tr>");
	th = $("<th width=120px >");
	th.text("人數/剩餘名額:　");
	td = $("<td>");
	td.text(data.itPeolim +" / "+ (data.itPeolim-data.itPeocount));
	tr.append(th, td);
	table.append(tr);
	

	

	tr = $("<tr>");
	th = $("<th>");
	th.text("介紹補充:　");
	td = $("<td>");
	td.text(data.itTextoth);
	tr.append(th, td);
	table.append(tr);
	
	
	tr = $("<tr>");
	th = $("<th>");
	th.text("介紹:　");
	td = $("<td>");
	td.text(data.itText);
	tr.append(th, td);
	table.append(tr);
	
	
	tr = $("<tr>");
	th = $("<th>");
	th.text("首圖:　");
	td = $("<td>");
	let img = $("<img src=" + contextPath + data.pic1 + " width=200 height=120>");
	td.append(img);
	img = $("<img src=" + contextPath + data.pic2 + " width=200 height=120>");
	td.append(img);
	img = $("<img src=" + contextPath + data.pic3 + " width=200 height=120>");
	td.append(img);
	img = $("<img src=" + contextPath + data.pic4 + " width=200 height=120>");
	td.append(img);
	img = $("<img src=" + contextPath + data.pic5 + " width=200 height=120>");
	td.append(img);
	tr.append(th, td);
	table.append(tr);
	
	
	table.append(tr);
	$("#modalView").append(table);
}




function toAdd(nowDate) {
	let now = moment().valueOf();
console.log(now);
console.log(contextPath);
	if (now < (moment(nowDate).valueOf() - 1000 * 60 * 60 * 24 * 7)) { //最多只能安排7日後行程
			$("#addModal").modal('show');
			$("input#date").val(nowDate);

	}else{		
		$("#cantAddModal").modal('show');
	}
}
	
	
function GenerateCalendar(events) {	
	$('#calendar').fullCalendar({
 		theme: true,
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek'
		},
		aspectRatio: 1.8,
		defaultView : 'month',
		selectable : true,
		locale: 'zh',

		editable: false,
		eventLimit: true, // allow "more" link when too many events
		moreLinkClick:"week",
		titleFormat: "YYYY/MM月",
		monthNames : [ "1", "2", "3", "4", "5", "6", "7", "8",
			"9", "10", "11", "12" ],
		buttonText : {
			today : 'Today',
			month : 'Month',
			week : 'Week',
			day : '日',
			prev : '◀',
			next : '▶',
		},	
		events : events,
		dayClick : function(date, jsEvent, view) {
			let nowDate = date.format();
			toAdd(nowDate);
		},
		eventMouseover : function(calEvent, jsEvent, view) {

			$(this).css('color', '#000');
			$(this).css('z-index', '9999');
			$(this).children().children("span").html(calEvent.content);
		},
		eventMouseout : function(calEvent, jsEvent, view) {

			$(this).css('color', '#000');
			$(this).css('z-index', '');
			$(this).children().children("span").html('');
			$(this).children().children("span").text(calEvent.title);
		},
		eventClick : function(event) {
			getOneIt(event.id);
		}
  
	});
	
};


</script>


</body>
</html>