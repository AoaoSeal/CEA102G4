<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.art.model.*"%>
<%@ page import="com.member.model.*" %>
<%
ArticleVO artVO = (ArticleVO) request.getAttribute("artVO"); 
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>修改文章 - update_art_input.jsp</title>






</head>
<body bgcolor='white'>

<style>

  .pic{
	width: 150px;
	height:150px;
}
</style>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/ckeditor2/ckeditor.js"></script>


<!-- <h3>資料修改:</h3> -->

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
	<div class="addView">
	<FORM METHOD="post" enctype="multipart/form-data"
		ACTION="<%=request.getContextPath()%>/art/art.do" name="form1">
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
		<div id="addTop">
			文章分類:
			<input  type="radio" name="artcNo" value="17001" checked>心得
			<input  type="radio" name="artcNo" value="17002">知識
			<input  type="radio" name="artcNo" value="17003">裝備
			<input  type="radio" name="artcNo" value="17004">新聞
			<input  type="radio" name="artcNo" value="17005">其他
			<br>
				文章標題:
				<input type="TEXT" name="artTitle" size="20	" autocomplete="off" placeholder="請輸入標題"
				required value="<%=(artVO == null) ? "" : artVO.getArtTitle()%>" />
			<br>
			預覽圖片:
				<input type="file" id="myArtFile" name="artPic" size="45"
					value="<%=(artVO == null) ? "預覽圖片" : artVO.getArtPic()%>" />
			<div id="myArtpreview"><img src="<%=request.getContextPath()%>/art/artpic.do${artVO.picSrc}"></div>
			<br>
		</div>
		 <input type="hidden" name="myArtfilename" id="filename">

		
	<div id="addCkedit">
		<div class=ckedit>
			文章內容:
			<textarea id="ldExpr" name="artText" cols="32" rows="50" required>${artVO.getArtText()}</textarea>
		</div>
	</div>	
	<div id="addButton">
			
				<input type="hidden"name="location" value="<%=request.getServletPath()%>"> 
				<input type="hidden" name="artNo" value="${artVO.artNo}">	
		 		<input type="hidden" name="action" value="Update"> 
				<input class="submit" type="submit" value="確認修改">
		</div>	
	</FORM>

</div>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/styleWen.css">
<script>
$(document).ready(function() {
	   CKEDITOR.replace('ldExpr');
	   console.log("ready!");
	  });
</script>
 <script type="text/javascript">

      
        
        $(document).ready(function(){
        	init2();
        })
        
        
        function init2() {

            let myFile = document.getElementById("myArtFile");
            let filename = document.getElementById("myArtfilename");
            let preview = document.getElementById('myArtpreview');

            myFile.addEventListener('change', function(e) {
                let files = e.target.files;
                if (files) {
                    let file = files[0];
                    if (file.type.indexOf('image') > -1) {


                        let reader = new FileReader();
                        reader.addEventListener('load', function(e) {
                            console.log(e);
                            let result = e.target.result;
                            console.log(result);
                            let img = document.createElement('img');
                            img.setAttribute('src', result);
                            $("#myArtpreview").empty();
                            preview.append(img);
                        });
                        reader.readAsDataURL(file); 
                    } else {
                        alert('請上傳圖片！');
                    }
                }
            });
        }
    </script>
</body>

<%-- 

<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=empVO.getHiredate()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
--%>
</html>