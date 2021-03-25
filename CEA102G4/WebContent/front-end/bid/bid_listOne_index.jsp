<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.itinerary.model.*"%>




<html>
<!-- <head> -->
<title>行程競標</title>

</head>
<body>
	<c:set var="bidNo" value="${bidVO.bidNo}" scope="session" />
	<input type="hidden" class="bidNo" name="bidNo"  value="${bidVO.bidNo}">
	<!-- 每個front-end頁面都要有這行code -->
	<%
	String uri = request.getServletPath();

	request.getSession().setAttribute("uri", uri);

	%>
	<!-- 每個front-end頁面都要有這行code -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/onoff.css">
		<style>
				.nowmessagego{
				    z-index: 1;
				    margin-top: 15%;
				    background-color: #00000059;
				    height: 400px;
				    width: 100%;
				    position: fixed;
					left: 2500px;
				}
				.nowmessagetext{
					    border: 5px solid rgb(255, 1, 87);
					    border-radius: 10px;
					    z-index: 1;
					    left: 2500px;
					    margin-top: 2%;
					    margin-left: 30%;
					    background-color: #fff;
					    height: 300px;
					    min-width: 40%;
					    width: 40%;
					    position: fixed;
					    text-align: center;
				}
				
				
				
				.nowmessagetext h2{
				    font-size: 2rem;
    				margin: 20px;
				
				
				}
				.nowmessagetext h2 span{
				color:rgb(255, 165, 0);
				    font-size: 2rem;
    				margin: 20px;
				
				
				}
				.nowmessagetext h2 .span2{
				color:rgb(255 1 87);
				    font-size: 2rem;
    				margin: 20px;
				
				
				}
				.nowmessagetext input[type="submit"] {

   
				    padding: 5px 15px;
				    background: #ff0157;
				    font-size: 1.5rem;
				    border: 0 none;
				    width: 300px;
				    cursor: pointer;
				    -webkit-border-radius: 5px;
				}
				
				.nowmessagetext a.btna {
					    padding: 5px 15px;
					    background: #ff0157;
					    font-size: 1.5rem;
					    border: 0 none;
					    width: 300px;
					    cursor: pointer;
					    -webkit-border-radius: 5px;
					    color: white;
					}
				</style>
				
				<script>
				$('body').click(function(e) {
				       if(e.target.id != 'chat-main'||e.target.id != 'chat-main2')
				          if($('.nowmessagego').is(':visible')) {

				             $('.nowmessagego').hide();
				          }
				});


				
				</script>
				

				
				
				
				
	<section class="bid" id="bid">
		<div class="content">
			<div class=bidleft>
				<div class="imgBx">

					<img
						src="${pageContext.request.contextPath}/itinerary/itPic.do?itNo=${bidVO.itNo}"
						alt="">


				</div>
				
				
				<div class="bidleft2">
					<div class="bidlefttop">

						<jsp:useBean id="itSvc" scope="page"
							class="com.itinerary.model.ItService" />
						<jsp:useBean id="ldSvc" scope="page"
							class="com.leader.model.LdService" />
						<c:forEach var="itVO" items="${itSvc.all}">
						<c:if test="${itVO.itNo== bidVO.itNo}">
							<c:forEach var="ldVO" items="${ldSvc.all}">
							
								<c:if test="${itVO.ldNo==ldVO.ldNo}">

								<div class="leaderimgm">
									<img class="imgm"
										src="<%= request.getContextPath()%>/leader/ldPic.do?ldNo=${ldVO.ldNo}"
										alt="">
										<div class="memtext" hidden>
												<img class="textimg"
													src="${pageContext.request.contextPath}/leader/ldPic.do?ldNo=${ldVO.ldNo}"
													alt="">
												<div class="memnick">
													<h5>${ldVO.ldName}</h5>

												</div>

												<div class="memstatus">
													<h5>領隊</h5>
												</div>
												<div class="memfollow">

													<button>
														<img
															src="${pageContext.request.contextPath}/resource/images/info.png"
															alt="">
													</button>

													<div class="heart2">
														<p class="pheart">0</p>
														<img class="${ldVO.ldNo}" name="imgheart" src="">
													</div>
												</div>
										</div>
										
									<div>

										<h4 class="leadername">領隊:&nbsp;&nbsp;&nbsp;${ldVO.ldName}</h4>
									</c:if>	
							</c:forEach>
						


					</div>
				</div>
				<div>

					<div class="itgo">
						<h1>${itVO.itName}</h1>
							</c:if>
						</c:forEach>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front-end/itinerary/it.do">
							<input type="hidden" class="itNo" name="itNo" value="${bidVO.itNo}"> <input
								type="hidden" name="action" value="getOne_For_Display">
							<input class="submit" type="submit" value="查看行程">
							<!-- 					<button>查看詳情</button> -->
						</FORM>
					</div>
					<h4>競標內容:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;此行程名額乙位</h4>
					<c:set var="string1" value="${bidVO.bidTimestart}" scope="session"/>
					<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />
					<c:set var="string3" value="${bidVO.bidTimeend}" />
					<c:set var="string4" value="${fn:substringBefore(string3,'.0')}" />
					<h4>
						競標時間:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="bidstarttime">${string2}</span>
					</h4>
					<h4>
						結標時間:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="bidendtime">${string4}</span>
					</h4>
					<h4>
						起標價格:&nbsp;&nbsp;&nbsp;&nbsp;NT $ <span class="bidPricestart">${bidVO.bidPricestart}</span>
					</h4>

				</div>


			</div>

			<div class="bidleftdown">
				<div class="price">

					<h4>
						目前競標價格:&nbsp;&nbsp;&nbsp;NT $ <span class="now_firstprice">${bidVO.bidPricestart}</span>&nbsp;&nbsp;&nbsp;
					</h4>


				</div>
				<div class="biddingdiv">

					<h3 class="now_firstprice">${bidVO.bidPricestart}</h3>
					<h4>+</h4>
					<input type="number" class="biddingtext" placeholder="填入增加金額">
					<input type="submit" class="biddingbut" value="競標"
						onclick="sendMessageK();">
				</div>
				<div class="autobiddiv">
					<div class="indiv">
						<h4>自動競標&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+</h4>
						<input type="number" class="autobiddtext" placeholder="每次增加金額" value="100">


						<div class="switch">
							<input class="switch-checkbox" id="switchID1" type="checkbox"
								name="switch-checkbox"> <label class="switch-label"
								for="switchID1"> <span class="switch-txt" turnOn="開"
								turnOff="關"></span> <span class="switch-Round-btn"></span>
							</label>
						</div>


					</div>
					<div class="indiv">
						<h4>金額上限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h4>
						<input type="number" class="autopricetext" placeholder="填入金額上限" >
						<h4 class="autoerroe">請先填入金額</h4>
					</div>
				</div>


			</div>
		</div>
		</div>
		<div class="bidright">

			<div class="reciprocal">


				<h4>
					剩餘時間:&nbsp;&nbsp;&nbsp;<span class="timeout">即將開始競標</span>&nbsp;&nbsp;&nbsp;
				</h4>
				<h4>目前得標</h4>



			</div>
			<div class="member_bid"></div>

			<div class="heart">
				<p class="pheart">0</p>
				<img class="2004" name="imgheart" src="" width=40px height=40px>
			</div>
		</div>





		</div>
	</section>
<script src="//cdn.jsdelivr.net/jquery.shadow-animation/1/mainfile"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script type="text/javascript">


	$(document).ready(function() {
		$(".memimgBx .imgm").click(function() {
			$(".memtext").not($(this).next(".memtext")).hide("fast");
			$(this).next(".memtext").toggle("fast");

		});
	});
	$(document).ready(function() {
		$(".leaderimgm .imgm").click(function() {
			$(".memtext").not($(this).next(".memtext")).hide("fast");
			$(this).next(".memtext").toggle("fast");

		});
	});


	
	//=======================以下自動競標================
var autotimeoutID;
$(document).ready(function(){
	$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
	
	$("#switchID1").on('change', function(){
		
		//console.log($("#switchID1").prop('checked'));
		let key = $("#switchID1").prop('checked'); 
		
		if(key){
			$('.autobiddtext').prop('disabled', true).css("background", "#ddd");
			$('.autopricetext').prop('disabled', true).css("background", "#ddd");
			$('.biddingtext').prop('disabled', true).css("background", "#ddd");
			$('.biddingbut').prop('disabled', true).animate({backgroundColor: "#e101ff" },'slow');
			$('.biddingbut').val("自動競標中");
			$('.autoerroe').html("開始自動競標");
			console.log("結束後經過238");
			$('.autobiddiv').animate({boxShadow: '10px 10px 10px rgb(0 0 0 / 50%)'},'slow');
			
			$('.autobiddiv').animate({backgroundColor: "#e101ff" },'slow');
			//開啟自動競標
			
		 autotimeoutID = window.setInterval(function() {	
			let thismemid = $(".memberidsave").attr("id");
			let name = $(".bid_firstmem").attr("name");
			console.log("結束後經過247");
			
			
			if(thismemid != name ){
				
// 				//console.log("有近來進標")
				sendAutoMessageauto=function () {
					$(".memberidsave").val();
					let now_firstprice = $("span.now_firstprice").text();

					let addprice =$(".autobiddtext").val();
					//console.log(parseInt(now_firstprice) + parseInt(addprice)>parseInt(now_firstprice));
					
					
					var jsonObj = {
						"type"   : "biding",
						"bid_no" : $(".bidNo").val(),
						"mem_id" : $(".memberidsave").attr("id"),
						"bid_price" : parseInt(now_firstprice) + parseInt(addprice)
						};
					
						if (webSocketK.readyState===1) {
							webSocketK.send(JSON.stringify(jsonObj));
							$('.autobiddiv').animate({backgroundColor: "#ff0157" },2000);
							$('.autobiddiv').animate({backgroundColor: "#e101ff" },2000);
						}
					}
				sendAutoMessageauto();
			
				
			}
				
		}, 2000);
			
			
			
			
			
		}else{
			window.clearInterval(autotimeoutID);
			let thismemid = $(".memberidsave").attr("id");
			let name = $(".bid_firstmem").attr("name");
			console.log("有近來關閉");
			$('.autobiddiv').stop(true);
			console.log("結束後經過290");
			$('.autobiddiv').animate({boxShadow: '0px 0px 0px rgb(0 0 0 / 50%)'},'slow');
			$('.autobiddiv').animate({backgroundColor: "#3394fb" },'slow');
			
			if(thismemid != "" ){
			
				if(thismemid != name ){
					$('.autobiddtext').prop('disabled', false).css("background", "#fff");
					$('.autopricetext').prop('disabled', false).css("background", "#fff");
					
					$('.biddingtext').prop('disabled', false).css("background", "#fff");
					$('.biddingbut').prop('disabled', true).css("background", "#ddd");
					$('.biddingbut').val("競標");
					
				}else{
					$('.autobiddtext').prop('disabled', false).css("background", "#fff");
					$('.autopricetext').prop('disabled', false).css("background", "#fff");
					
					$('.biddingtext').prop('disabled', true).css("background", "#ddd");
					$('.biddingbut').prop('disabled', true).css("background", "#3394fb");
					$('.biddingbut').val("目前最高");
					
				}
				
				
				
			}
		}
		
		
		
	});
	
	
	let bal ;
//第二個自動競標最高價格
//	 //console.log();
	  $(".autopricetext").focus(function(){
	    $(this).css("background-color","#FFFFCC");
	    
	    
	   
	    $.ajax({
			url : PageContext + "/ConfirmBal.do",
			type : "POST",
			dataType : 'text',
			
			data : {
				mem_id : $(".memberidsave").attr("id"),
			},
			success : function(data) {
				////console.log(data);
				bal=data;
			}
			
			
			

		});

	    $(this).css("background-color","#D6D6FF");
// 	    ////console.log("301");
		   let autopricetext = $(".autopricetext").val();
		   let now_firstprice = $("span.now_firstprice").text();  
		   
		   ////console.log("304="+autopricetext);
		   if(autopricetext!=""){
		  
			   if(parseInt(bal)>=parseInt(autopricetext) ){
				   
// 				   //console.log(bal+"=="+(parseInt(now_firstprice) + parseInt(addprice)));
				   
// 				   $('.biddingbut').attr('disabled', false).css("background", "#ff0157").val("競標");
				   $('.autoerroe').html("錢包餘額充足");
				   $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
				   
				   
			   }else{
				   
// 				   $('.biddingbut').prop('disabled', true).css("background", "#ff0000");
////console.log("357");
					$('.autoerroe').html("錢包餘額不足");
					$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
				   
			   }
		   
		   }else{
			   
// 			   $('.biddingbut').prop('disabled', true).css("background", "#ddd");
			   $('.autoerroe').html("請先填入金額");
			   $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
		   }
		    
		    
	   	    
	  });
	  $(".autopricetext").blur(function(){
		    $(this).css("background-color","#fff");
		
		    let autopricetext = $(".autopricetext").val();
		    ////console.log("395="+autopricetext);
		    addprice = $('.autobiddtext').val();
		    now_firstprice = $("span.now_firstprice").text();
		    
		   
		   if(autopricetext!=""){
		 
			   if(parseInt(bal)>=parseInt(autopricetext) && (parseInt(autopricetext)-parseInt(addprice))>=parseInt(now_firstprice)){
// 				   console.log("396=自動錢包"+bal+"   "+autopricetext+"   "+now_firstprice);
// 				   console.log("396=自動錢包");
		    	  $('.autoerroe').html("可以自動競標");
		    	  $('.switch-checkbox').prop('disabled', false).css("background", "#ddd");
		    	 
		    	}else if(parseInt(bal)<=parseInt(autopricetext)){
		    		
// 		    		console.log("396=超出錢包");
		    		 $('.autoerroe').html("超出錢包金額");
			    	 $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
		    		
		    	}else if((parseInt(autopricetext)-parseInt(addprice))>=parseInt(now_firstprice)){
		    		console.log("396=金額太低");
		   	 			    	
		    	 $('.autoerroe').html("金額上限太低");
		    	 $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
				
		   		 }
		    }else{
		    	 $('.autoerroe').html("請先填入金額");
		    	 $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
		    	
		    }
		  });
	  
	  
	  
	  
	
	  $(".autopricetext").keyup(function(){
		    $(this).css("background-color","#D6D6FF");
		    let autopricetext = $(".autopricetext").val();
		    ////console.log("395="+autopricetext);
		    addprice = $('.autobiddtext').val();
		    now_firstprice = $("span.now_firstprice").text();
		    
		    console.log("432=keyup");
		    console.log("autopricetext="+autopricetext);
		    console.log("addprice="+addprice);
		    console.log("now_firstprice="+now_firstprice);
		   if(autopricetext!=""){
		 
			   if(parseInt(bal)>=parseInt(autopricetext) && (parseInt(autopricetext)-parseInt(addprice))>=parseInt(now_firstprice)){
// 				   console.log("432=可以自動");
				   console.log("396=自動錢包"+bal+"   "+autopricetext+"   "+now_firstprice);
			    	  $('.autoerroe').html("可以自動競標");
			    	  $('.switch-checkbox').prop('disabled', false).css("background", "#ddd");
			    	 
			    	}else if(parseInt(bal)<=parseInt(autopricetext)){
			    		
			    		console.log("396=超出錢包");
			    		 $('.autoerroe').html("超出錢包金額");
				    	 $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
			    		
			    	}else if((parseInt(autopricetext)+parseInt(addprice))<parseInt(now_firstprice)){
			    		console.log("401=金額太低" +bal+"   "+autopricetext+"   "+now_firstprice);
			   	 			    	
			    	 $('.autoerroe').html("金額上限太低");
			    	 $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
					
			   		 }
			    }else{
			    	 $('.autoerroe').html("請先填入金額");
			    	 $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
			    	
			    }
		    
		    
		    
		    
		  });






	
	
	
	
	
//第一個自動輸入增加多少	
//	 //console.log();
	  $(".autobiddtext").focus(function(){
	    $(this).css("background-color","#FFFFCC");
	    
	    
	   
	    $.ajax({
			url : PageContext + "/ConfirmBal.do",
			type : "POST",
			dataType : 'text',
			
			data : {
				mem_id : $(".memberidsave").attr("id"),
			},
			success : function(data) {
				////console.log(data);
				bal=data;
				
				$(".autobiddtext").css("background-color","#D6D6FF");
//		 	    //console.log("301");
				   let addprice = $(".autobiddtext").val();
				   let now_firstprice = $("span.now_firstprice").text();  
				   ////console.log("304="+addprice);
				   ////console.log("305="+bal);
				   if(addprice!=""){
					   if(parseInt(bal)>=(parseInt(now_firstprice) + parseInt(addprice))){
						   
//		 				   //console.log(bal+"=="+(parseInt(now_firstprice) + parseInt(addprice)));
						   
//		 				   $('.biddingbut').attr('disabled', false).css("background", "#ff0157").val("競標");
						   $('.autoerroe').html("錢包餘額充足");
						   $('.switch-checkbox').prop('disabled', false).css("background", "#ddd");
						   
					   }else{
						   
//		 				   $('.biddingbut').prop('disabled', true).css("background", "#ff0000");
						$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
		////console.log("506");
							$('.autoerroe').html("錢包餘額不足");
						   
					   }
				   
				   }else{
					   
//		 			   $('.biddingbut').prop('disabled', true).css("background", "#ddd");
					   $('.autoerroe').html("請填入金額");
				   }
			}
			
			
		});

	    
		    
		    
	   	    
	  });
	  $(".autobiddtext").blur(function(){
		    $(this).css("background-color","#fff");
		    let now_firstprice = $("span.now_firstprice").text();
		    addprice = $(".autobiddtext").val();
		    ////console.log("529=");
		    ////console.log(parseInt(bal)+">="+(parseInt(now_firstprice) +"+"+ parseInt(addprice)));
		    ////console.log(parseInt(bal)>=(parseInt(now_firstprice) + parseInt(addprice)));
		    
		    if(addprice!=""){
		    if(parseInt(bal)>=(parseInt(now_firstprice) + parseInt(addprice))){
		    	
		    	  $('.autoerroe').html("錢包餘額充足");
		    	  $('.switch-checkbox').prop('disabled', false).css("background", "#ddd");
		    }else{
		    	////console.log("529");
		    	 $('.autoerroe').html("錢包餘額不足");
		    	 $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
				
		    }
		    }else{
		    	 $('.autoerroe').html("請先填入金額");
		    	 $('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
		    	
		    }
		  });
	  
	  
	  
	  
	
	  $(".autobiddtext").keyup(function(){
		    $(this).css("background-color","#D6D6FF");
		    
		    addprice = $(".autobiddtext").val();
		    ////console.log("548="+(parseInt(now_firstprice) + parseInt(addprice)));
		    now_firstprice = $("span.now_firstprice").text();  
		   ////console.log("551="+parseInt(bal)>=(parseInt(now_firstprice) + parseInt(addprice)));
		   if(addprice!=""){
		  
			   if(parseInt(bal)>=(parseInt(now_firstprice) + parseInt(addprice))){


				   $('.autoerroe').html("錢包餘額充足");
				   $('.switch-checkbox').prop('disabled', false).css("background", "#ddd");
			   }else{
				   ////console.log("560");
				   $('.autoerroe').html("錢包餘額不足");
			   }
		   
		   }else{

			   $('.autoerroe').html("請先填入金額");
		   }
		    
		    
		    
		    
		  });
	
	
	
	
	
	
	//=======================以上自動競標================
		
		
		
		

// 	 //console.log();
	  $(".biddingtext").focus(function(){
	    $(this).css("background-color","#FFFFCC");
	    	   
	    $.ajax({
			url : PageContext + "/ConfirmBal.do",
			type : "POST",
			dataType : 'text',
			
			data : {
				mem_id : $(".memberidsave").attr("id"),
			},
			success : function(data) {
// 				//console.log(data);
				bal=data;
			}
			
			
			

		});

	    $(this).css("background-color","#D6D6FF");
	    
		   let addprice = $(this).val();
		   let now_firstprice = $("span.now_firstprice").text();  
		   
		   if(addprice!=""){
		  
			   if(parseInt(bal)>=(parseInt(now_firstprice) + parseInt(addprice))){
				   
// 				   //console.log(bal+"=="+(parseInt(now_firstprice) + parseInt(addprice)));
				   
				   $('.biddingbut').attr('disabled', false).css("background", "#ff0157").val("競標");
					$('.biddingbut').val("競標");
				   
			   }else{
				   
				   $('.biddingbut').prop('disabled', true).css("background", "#ff0000");
				   ////console.log("626");
					$('.biddingbut').val("餘額不足");
				   
			   }
		   
		   }else{
			   
			   $('.biddingbut').prop('disabled', true).css("background", "#ddd");
				$('.biddingbut').val("競標");
		   }
		    
		    
	   	    
	  });
	  let addprice;
	  let now_firstprice;
	  $(".biddingtext").blur(function(){
	    $(this).css("background-color","#fff");
	    
	    
	    if(parseInt(bal)>=(parseInt(now_firstprice) + parseInt(addprice))){
	    
	    	  $('.biddingbut').attr('disabled', false).css("background", "#ff0157").val("競標");
				$('.biddingbut').val("競標");
	    }else{
	    	
	    	
	    	
	    	$('.biddingbut').prop('disabled', false).css("background", "#ddd");
			$('.biddingbut').val("競標");
	    }
	    
	  });
	
	
	  $(".biddingtext").keyup(function(){
	    $(this).css("background-color","#D6D6FF");
	    
	    addprice = $(this).val();
	    now_firstprice = $("span.now_firstprice").text();  
	   
	   if(addprice!=""){
	  
		   if(parseInt(bal)>=(parseInt(now_firstprice) + parseInt(addprice))){
			   
// 			   //console.log(bal+"=="+(parseInt(now_firstprice) + parseInt(addprice)));
			   
			   $('.biddingbut').attr('disabled', false).css("background", "#ff0157").val("競標");
				$('.biddingbut').val("競標");
			   
		   }else{
			   
			   $('.biddingbut').prop('disabled', true).css("background", "#ff0000");
			   ////console.log("679");
				$('.biddingbut').val("餘額不足");
			   
		   }
	   
	   }else{
		   
		   $('.biddingbut').prop('disabled', true).css("background", "#ddd");
			$('.biddingbut').val("競標");
	   }
	    
	    
	    
	    
	  });
	  
	  
	  
	  
	  
	});







$(window).on('load', function(){
	connectK();
	
		var starttime = $(".bidstarttime").html();
		var endtime = $(".bidendtime").html();
	    var time = new Date();
	    var nowTime = time.getTime(); 
	    var time3 = new Date(starttime);

	    

	    var startTimeget = time3.getTime();

	
	    //=========================================
	    var time = new Date();
	    var nowTime = time.getTime(); 
	    var time2 = new Date(endtime);



	    var endTimeget = time2.getTime();

	    var offsetTime = (endTimeget - nowTime) / 1000;
	    var sec = parseInt(offsetTime % 60);
	    var min = parseInt((offsetTime / 60) % 60);
	    var hr = parseInt(offsetTime / 60/60);
//	     //console.log(hr+min+sec);
	    
//		    //console.log("384="+parseInt(hr+min+sec));
		if(parseInt(hr+min+sec)<=0){
			window.clearInterval(autotimeoutID);
			window.clearInterval(timeoutID);
			clearTimeout(setTimeout);
			var str =  "競標結束";
		    $(".timeout").html(str);
			$('.biddingtext').prop('disabled', true).css("background", "#ddd");
			$('.autobiddtext').prop('disabled', true).css("background", "#ddd");
			$('.autopricetext').prop('disabled', true).css("background", "#ddd");
			$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
			$(".bid_othermem").css("background", "#ddd");
			$('.biddingbut').prop('disabled', true).css("background", "#ddd");
		    $('.biddingbut').val("競標");
			$(".bid .content").css("background", "#999");
			$('.autobiddiv').stop(true);	
			$("#switchID1").prop('checked',false); 
			$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");										
			$('.autoerroe').html("競標結束");	

	 		sendMessageEnd=function () {
	 			$(".memberidsave").val();
	 			

	 				let addprice =$(".biddingtext").val();

	 						var jsonObj = {
	 							"type"   :"endBid",
	 							"bid_no" : $(".bidNo").val()
	 						};
	 						if (webSocketK.readyState===1) {
	 						webSocketK.send(JSON.stringify(jsonObj));
	 						disconnectK();
	 						}
	 						
	 				}

//		 		if((Math.floor(nowTime/1000)+1) == Math.floor(endTimeget/1000)){
//		 			//console.log("417="+(Math.floor(nowTime/1000)+1) == Math.floor(endTimeget/1000));
	 		sendMessageEnd();
//				}
	 		
			
			
			
		}else if (nowTime < startTimeget){
			
			
			$(".timeout").html("即將競標");
			
			
		}else{
	    
	    
	    if(sec.toString().length==1){
	    	
	    	sec ="0"+sec
	    }
		if(min.toString().length==1){
	    	
		min ="0"+min
	    }
		if(hr.toString().length==1){
	    	
			hr ="0"+hr
		    }
		 var str = hr + ":" + min + ":" + sec;
		    $(".timeout").html(str);
		
		}
	    
	   //=================================== 
	    
	    
	    
	    

	if(nowTime >= startTimeget){
		connectK();

		
		var timeoutID = window.setInterval(function() {



		    var time = new Date();
		    var nowTime = time.getTime(); 
		    var time2 = new Date(endtime);



		    var endTimeget = time2.getTime();

		    var offsetTime = (endTimeget - nowTime) / 1000;
		    var sec = parseInt(offsetTime % 60);
		    var min = parseInt((offsetTime / 60) % 60);
		    var hr = parseInt(offsetTime / 60/60);
//		     //console.log(hr+min+sec);
		    
// 		    //console.log("384="+parseInt(hr+min+sec));
			if(parseInt(hr+min+sec)<=0){
				window.clearInterval(autotimeoutID);
					window.clearInterval(timeoutID);
					clearTimeout(setTimeout);
					var str =  "競標結束";
					
					
					
				    $(".timeout").html(str);
					$('.biddingtext').prop('disabled', true).css("background", "#ddd");
					$('.autobiddtext').prop('disabled', true).css("background", "#ddd");
					$('.autopricetext').prop('disabled', true).css("background", "#ddd");
					$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
					$(".bid_othermem").css("background", "#ddd");
					$('.biddingbut').prop('disabled', true).css("background", "#ddd");
				    $('.biddingbut').val("競標");
					$(".bid .content").css("background", "#999");
											
					$('.autoerroe').html("競標結束");	
					
					
					$('.autobiddiv').stop(true,true);
					$("#switchID1").prop('checked',false); 
					console.log("3有來關閉\動畫");
					$('.autobiddiv').animate({boxShadow: '0px 0px 0px rgb(0 0 0 / 50%)'},'slow');
					$('.autobiddiv').animate({backgroundColor: "#3394fb" },'slow');		  
					console.log("3有來關閉\動畫完成");
					
		 		sendMessageEnd=function () {
		 			$(".memberidsave").val();
		 			

		 				let addprice =$(".biddingtext").val();

		 						var jsonObj = {
		 							"type"   :"endBid",
		 							"bid_no" : $(".bidNo").val()
		 						};
		 						if (webSocketK.readyState===1) {
		 							webSocketK.send(JSON.stringify(jsonObj));
		 							
		 							disconnectK();//結束webSocket
		 						}
		 				}

		 		sendMessageEnd();
		 		
		 		
// 		 		let countopen =0;		 		
		 		
// 			if(countopen==0){
			 		
// 		 		webSocket.onmessage = function(event) {

					

// 		 			console.log("typeof data="+ typeof event.data);
// 		 			var jsonObj = JSON.parse(event.data);
// 		 			var size = Object.keys(jsonObj).length;
// 		 			console.log("size data="+ typeof event.data);

// 				};
				
// 			}
				
				
			}else{
		    
		    
		    if(sec.toString().length==1){
		    	
		    	sec ="0"+sec
		    }
			if(min.toString().length==1){
		    	
			min ="0"+min
		    }
			if(hr.toString().length==1){
		    	
				hr ="0"+hr
			    }
			 var str = hr + ":" + min + ":" + sec;
			    $(".timeout").html(str);
			
			}
			   
		    
		}, 500);
		
	
		let thismemid = $(".memberidsave").attr("id");

		if(thismemid == "" ){
			
			$('.biddingtext').prop('disabled', true).css("background", "#ddd");
			$('.autobiddtext').prop('disabled', true).css("background", "#ddd");
			$('.autopricetext').prop('disabled', true).css("background", "#ddd");
			$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
			
			
		}else{
			$('.biddingtext').prop('disabled', false).css("background", "#fff");
			$('.autobiddtext').prop('disabled', false).css("background", "#fff");
			$('.autopricetext').prop('disabled', false).css("background", "#fff");
			$('.switch-checkbox').prop('disabled', true).css("background", "#fff");
			
		}
	
	}else if(nowTime >= endtime){
		window.clearInterval(timeoutID);
		$('.biddingtext').prop('disabled', true).css("background", "#ddd");
		$('.autobiddtext').prop('disabled', true).css("background", "#ddd");
		$('.autopricetext').prop('disabled', true).css("background", "#ddd");
		$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
		$(".bid_othermem").css("background", "#ddd");
		$('.biddingbut').prop('disabled', true).css("background", "#ddd");
	    $('.biddingbut').val("競標");
		$(".bid .content").css("background", "#999");
		
		}else{
			$('.biddingtext').prop('disabled', true).css("background", "#ddd");
			$('.autobiddtext').prop('disabled', true).css("background", "#ddd");
			$('.autopricetext').prop('disabled', true).css("background", "#ddd");
			$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
			$(".bid_othermem").css("background", "#ddd");
			$('.biddingbut').prop('disabled', true).css("background", "#ddd");
		    $('.biddingbut').val("競標");
			$(".bid .content").css("background", "#fff");
			
			
			
		}
		
		
		
	
	
	});
	$(window).on('unload', function(){
		
		window.clearInterval(timeoutID);
		clearTimeout(setTimeout);
	disconnectK();
	});	

	
	var MyPointK = "/websocketK/"+$(".bidNo").val();
	var hostK = window.location.host;
	var pathK = window.location.pathname;
	var webCtxK = pathK.substring(0, pathK.indexOf('/', 1));
	var endPointURLK = "ws://" + window.location.host + webCtxK + MyPointK;
	
	var webSocketK;

	function connectK() {
		heartCheck.reset().start();
		webSocketK = new WebSocket(endPointURLK);
		
		var starttime = $(".bidstarttime").html();
	    var time = new Date();
	    var nowTime = time.getTime(); 
	    var time3 = new Date(starttime);
	    var startTimeget = time3.getTime();
		
		
		

		webSocketK.onopen = function(event) {
			
			sendMessageStart=function () {
	 			$(".memberidsave").val();
	 			

	 				let addprice =$(".biddingtext").val();

	 						var jsonObj = {
	 							"type"   :"startBid",
	 							"bid_no" : $(".bidNo").val()
	 						};
	 						if (webSocketK.readyState===1) {
	 							if(nowTime > startTimeget){ 								
	 							
	 							webSocketK.send(JSON.stringify(jsonObj));
	 							
	 							}
	 						}
	 				}

	 	
			sendMessageStart();
		
			
			makeDataOnWeb(event.data);

		};
let countttt = 0;
		webSocketK.onmessage = function(event) {
			heartCheck.reset().start(); 
			let Acountttt = 0;
			if(event.data=="poung"){
// 				//console.log(event.data);
				return;
			}
			
			var jsonObj = JSON.parse(event.data);
			
			if(jsonObj.hasOwnProperty("other") && countttt == 0){
				++countttt;
				console.log("結束後來了 ="+ countttt+"次")
				console.log("jsonObj ="+ jsonObj)
				console.log("jsonObj ="+ jsonObj.other)
			
				
				if(jsonObj.mem_id == $(".memberidsave").attr("id")){			
	 				
				
					let str1 ='<div class="nowmessagego"> <div class="nowmessagetext" id="chat-main">'
							    + '<h2>恭喜!! <span>'+ jsonObj.mem_nick +'</span> 競標得標!!</h2>'
								+'<h2><span class="span2">< '+ jsonObj.it_name +' > </span>行程名額乙位</h2>' 
								+'<h2>得標金額為:  NT $ <span> '+jsonObj.bid_price+ '</span>  已從錢包扣款</h2> '
								+'<button class="pricebarbtn"><a class="btna" href="/CEA102G4/front-end/bid/bid_select_page.jsp?itNo='+$(".itNo").val() +'">填寫行程報名資料</a></button>'
// 								+'<form method="post" action="/CEA102G4/front-end/bid/bid.do"> '
// 								+'<input type="hidden" name="itNo" value="'+ $(".bidNo").val() +'">'
// 								+'<input type="hidden" name="action" value="getOne_For_Display">'
// 								+'<input class="submit" id="chat-main2"type="submit" value="填寫行程報名資料"></form></div></div> '
								;

								$(str1).insertBefore(".bid");
								
								$(".nowmessagego").animate({left:'0px'},300);
								$(".nowmessagetext").animate({left:'0px'},500);
									
				}else{
					
					
					let str2 ='<div class="nowmessagego">'					
								+'<div class="nowmessagetext" id="chat-main2">'
								+'<br><br><br>'
								+'<h2>競標 <span class="span2">< '+ jsonObj.it_name +' ></span> 已結束 </h2>'
								+'<h2> 感謝會員參加競標</h2></div></div>';
					
					$(str2).insertBefore(".bid");
					$(".nowmessagego").animate({left:'0px'},300);
					$(".nowmessagetext").animate({left:'0px'},500);
				}	
								
								
								
								
			
			
			}else if(countttt == 0){
				
				makeDataOnWeb(jsonObj);
								
			}
			
			
									
// 		}

			
			

		};


	sendMessageK=function () {
$(".memberidsave").val()
	let now_firstprice = $("span.now_firstprice").text();
// 	alert(now_firstprice);
	let addprice =$(".biddingtext").val();

			var jsonObj = {
				"type"   : "biding",
				"bid_no" : $(".bidNo").val(),
				"mem_id" : $(".memberidsave").attr("id"),
				"bid_price" : parseInt(now_firstprice) + parseInt(addprice)
			};
			if (webSocketK.readyState===1) {
				webSocketK.send(JSON.stringify(jsonObj));
			}
	}

	function disconnectK() {
		webSocketK.close();

	}

	function updateStatus(newStatus) {
		statusOutput.innerHTML = newStatus;
	}


	}
let lastautokey = false;
	function makeDataOnWeb(jsonObj) {
		
// 		console.log(typeof data)
		let autopricetext;
		if (typeof jsonObj !== 'undefined') {
			
// 		var jsonObj = JSON.parse(data);
		var size = Object.keys(jsonObj).length;
		console.log(Object.other+"  "+size);
		
	if(size!=0){
		
		
		if(jsonObj[0].bid_no==$(".bidNo").val()){	
			var message ="";
			for(var k in jsonObj) {
	
				if(k==0){
					var arr = jsonObj[k].bid_time.split(' ');

					let thismemid = $(".memberidsave").attr("id");
					  autopricetext = $(".autopricetext").val();
					  addprice = $(".autobiddtext").val();
					let auto = parseInt(autopricetext);

					    
					  if(parseInt(jsonObj[0].bid_price)>=auto-parseInt(addprice)){
					  
						  console.log("第一層"+parseInt(jsonObj[0].bid_price)+"<="+auto)
						  
						 if(parseInt(jsonObj[0].bid_price)<(auto+parseInt(addprice))){
							 
							 console.log("第二層"+parseInt(jsonObj[0].bid_price)+"<="+auto+"+"+addprice)
							 
							  $('.autobiddiv').stop(true);
							  window.clearInterval(autotimeoutID);
							  autotimeoutID=null;
								let thismemid = $(".memberidsave").attr("id");
								let name = $(".bid_firstmem").attr("name");
									
								$("#switchID1").prop('checked',false); 
								$('.switch-checkbox').prop('disabled', true).css("background", "#ddd");
								
								$('.autobiddtext').prop('disabled', false).css("background", "#fff");
								$('.autopricetext').prop('disabled', false).css("background", "#fff");
								$('.autoerroe').html("競標價格超出上限");
								
								$('.autobiddiv').animate({boxShadow: '0px 0px 0px rgb(0 0 0 / 50%)'},'slow');
								$('.autobiddiv').animate({backgroundColor: "#3394fb" },'slow');		  
						  }
						  
						  
						
						  
					  }

					  
					parseInt(autopricetext)
					if(thismemid != "" ){
					
						if(thismemid == jsonObj[k].mem_id ){
							
							if(!($("#switchID1").prop('checked'))){
							
							$('.biddingtext').prop('disabled', true).css("background", "#ddd");
							$('.biddingbut').prop('disabled', true).css("background", "#3394fb");
							$('.biddingbut').val("目前最高");
							}
						}else{
							
							
							
							if(!($("#switchID1").prop('checked'))){
								
							$('.biddingtext').prop('disabled', false).css("background", "#fff");
							$('.biddingbut').prop('disabled', true).css("background", "#ddd");
							$('.biddingbut').val("競標");
									
							}						
						}
					
						
						
						
					}else{
	
						$('.biddingbut').prop('disabled', true).css("background", "#ddd").val("競標");
						$('.biddingbut').val("競標");
						
						
					}
					
					message+='<div class="member_bid">'+
						'<div class="bid_firstmem" name="'+jsonObj[k].mem_id+'">'+
						'<img class="imgm"src="/CEA102G4/AllPic.do?table=member_list&amp;picColumn=mem_pic&amp;idColumn=mem_id&amp;id='+jsonObj[k].mem_id+'">'						
						+'<p class="p1">'+jsonObj[k].mem_nick+'</p>'+
						'<p class="p3">NT $</p><p class="p2">'+jsonObj[k].bid_price+'</p>'+'<p class="p3">'+arr[1]+'</p></div>';
				
						}else{
							var arr = jsonObj[k].bid_time.split(' ');
	// 						//console.log(arr[1]);
							message+='<div class="bid_othermem"><p class="p1">'+jsonObj[k].mem_nick+
							'</p><p class="p3">NT $</p><p class="p2">'+jsonObj[k].bid_price+'</h3><p class="p3">'+arr[1]+'</p></div>'
																												
						}
				}
			$(".now_firstprice").animate({color:"#04ff00"},100);
			$(".member_bid").html(message);
			$(".bid_firstmem").animate({right:'0px'},200);
			$(".bid_firstmem").animate({backgroundColor:"#ff0157"},500);
			
			$(".now_firstprice").stop(true);
			$(".now_firstprice").html(jsonObj[0].bid_price).animate({color:"#ffa500"},'slow');
	
			
			}
		}}

	};
	
	function disconnectK() {
		webSocketK.close();

	}
	
	
	
	var heartCheck = {
		    timeout: 60000,        
		    timeoutObj: null,
		    serverTimeoutObj: null,
		    reset: function(){
		        clearTimeout(this.timeoutObj);
		        clearTimeout(this.serverTimeoutObj);
		        return this;
		    },
		    start: function(){
		        var self = this;
		        this.timeoutObj = setTimeout(function(){

		        	webSocketK.send("ping");
// 		            //console.log("ping!");
		            self.serverTimeoutObj = setTimeout(function(){
		            	webSocketK.close();     
		            }, self.timeout)
		        }, this.timeout)
		    }
	}

</script>
	<style>
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none !important;
	margin: 0;
}
</style>
</body>
</html>