<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/star-rating.min.css" media="all" rel="stylesheet" type="text/css" />
<script src="http://apps.bdimg.com/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="js/star-rating.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resource/jquery/jquery-3.5.1.min.js"></script>
<!-- Font Awesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
<style>
.wrapper {
    float: right;
    position: relative;
    right: 50%;
    margin-top: 50px;
}

.star-wrapper {
    float: right;
    position: relative;
    right: -50%;
}

#comment {
    margin-left: 830px;
    width: 270px;
    height: 100px;
    margin-top: 200px;
    resize: none;
}

.title:hover {
    color: gold;
    transform: scale(1.1);
    transition: 1s;
}

label title {
	display: none;
}

input.star{
  display: none;
}

label.star {
  float: right; 
  padding: 5px;
  font-size: 36px;
  color: #000;
  transition: all .25s;
}

input.star:checked ~ label.star:before {
  content:'\e006';
  color: gold;
  transition: all .5s;
}

label.star:hover{
  color: gold;
  transform: scale(1.3);
}

label.star:before{
  content:'\e007';
  font-family: 'Glyphicons Halflings';
}

span.title5, span.title4, span.title3, span.title2, span.title1{
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the titile */
  position: absolute;
  z-index: 1;
}

#btnFeedback {
	margin-left: 1030px;
    margin-top: 20px;
    width: 90px;
    height: 45px;
    font-size: 18px;
    border-radius: 10px;
    border:1px solid #26BEC9;
    background-color: #26BEC9;
    color: #fff;
    opacity: 0.7;
}
 </style>

</head>
<div>

     <div id="content">
      <FORM  NAME='form1'METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do">
	        <div class="wrapper">
	            <div class="star-wrapper">
	                <h2 class="title">STAR RATINGS!</h2>              
	                <input class="star star5" id="radio5" type="radio" name="ldScore" value="5">
	                <label class="star star5" for="radio5"></label>
	                <span class="title5">很滿意!</span>
	                <input class="star star4" id="radio4" type="radio" name="ldScore" value="4">
	                <label class="star star4" for="radio4"></label>
	                <span class="title4">還不錯</span>
	                <input class="star star3" id="radio3" type="radio" name="ldScore" value="3">
	                <label class="star star3" for="radio3"></label>
	                <span class="title3">普通</span>
	                <input class="star star2" id="radio2" type="radio" name="ldScore" value="2">
	                <label class="star star2" for="radio2"></label>
	                <span class="title2">差強人意</span>
	                <input class="star star1" id="radio1" type="radio" name="ldScore" value="1">
	                <label class="star star1" for="radio1"></label>
	                <span class="title1">加油</span>
	            </div>
	        </div>
	        <div id="textarea">
	            <textarea name="fbText" id="comment" placeholder="Comment"></textarea>
	        </div>
	        <input type="hidden" name="rmNo" value="insert_feedback">
	        <input type="hidden" name="action" value="insert_feedback">
			<input type="submit" id="btnFeedback" value="送出評價">
	   </FORM>     
    </div>
    <script>
        $(document).ready(function() {
            $(".star5").mouseover(function() {
                $(".title5").css("margin-left", "100px");
                $(".title5").css("margin-top", "60px");
                $(".title5").css("visibility", "visible");
            });
            $(".star5").mouseout(function() {
                $(".title5").css("visibility", "hidden");
            });
            $(".star4").mouseover(function() {
                $(".title4").css("margin-left", "80px");
                $(".title4").css("margin-top", "60px");
                $(".title4").css("visibility", "visible");
            });
            $(".star4").mouseout(function() {
                $(".title4").css("visibility", "hidden");
            });
            $(".star3").mouseover(function() {
                $(".title3").css("margin-left", "60px");
                $(".title3").css("margin-top", "60px");
                $(".title3").css("visibility", "visible");
            });
            $(".star3").mouseout(function() {
                $(".title3").css("visibility", "hidden");
            });
            $(".star2").mouseover(function() {
                $(".title2").css("margin-left", "40px");
                $(".title2").css("margin-top", "60px");
                $(".title2").css("visibility", "visible");
            });
            $(".star2").mouseout(function() {
                $(".title2").css("visibility", "hidden");
            });
            $(".star1").mouseover(function() {
                $(".title1").css("margin-left", "20px");
                $(".title1").css("margin-top", "60px");
                $(".title1").css("visibility", "visible");
            });
            $(".star1").mouseout(function() {
                $(".title1").css("visibility", "hidden");
            });

        });
    </script>
</div>
</html>