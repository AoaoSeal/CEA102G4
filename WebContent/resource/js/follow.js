let PageContext = "";


$(window).on('load',function() {
	let countfollow = 0;
	
		var setfollow =new Set();
		var jsonObjfollow;
					PageContext = $("#PageContext").val();
			
					// =====================以下控制追蹤數==========================
					let _id = "";

					$("[name='imgheart']").each(function() {

						let _id = $(this).attr("class");
						setfollow.add(_id);

//							console.log("countfollow="+countfollow);
					});
					
					
					var arrfolloe =[];
					
					var arrfolloe = Array.from(setfollow) 
//console.log("arrfolloe="+arrfolloe);
					var jsonarrfolloe = JSON.stringify(arrfolloe);//轉成JSON

					
					
					$.ajax({
					url : PageContext + "/FollowCount.do",
					type : "POST",

					dataType : 'json',
					data : {'mydata':jsonarrfolloe},
					success : function(data) {

					var res = $.each(data, function(index, value){ showtxt(index, value); })

					}

				});

				function showtxt( _id,data) {
					if(_id.trim()!=""){
						$("img." + _id).prev().text(data);
					}
					
		
				}
				
				
				// =====================以下控制愛心==========================
//			console.log("488="+_id);
					
				let mem_id = $(".memberidsave").attr("id");
				console.log(mem_id);
				_id = "";
//				console.log("57"+mem_id);
				if (mem_id != "") {
					
						$.ajax({
							url : PageContext
									+ "/SearchFollow.do",
							type : "POST",
							dataType : 'json',
							data : {
								mem_id : mem_id,
								_id : jsonarrfolloe,
							},
							success : function(data) {
// 								console.log("504="+_id);	
								 var res = $.each(data, function(index, value){show(mem_id,index,value);})

								
								
	
							}
						});
						
						
						PageContext = $("#PageContext").val();
					
						
				function show(mem_id,_id,data) {
//					console.log(mem_id+"=="+_id+"=="+data);
//					var src = (data == "true") ? PageContext + '/resource/images/heart.png': PageContext + '/resource/images/heartNo.png';
					if(data){
//						console.log(mem_id+"=="+_id+"=="+data);
//						console.log(data);
						if(_id.trim()!="")
						$("img." + _id).attr('src',PageContext + '/resource/images/heart.png');
					}else{
//						console.log(mem_id+"=="+_id+"=="+data);
//						console.log(data);
						if(_id.trim()!="")
						$("img." + _id).attr('src',PageContext + '/resource/images/heartNo.png');
					}
					
					
					
				}
				
		
		} else {
	
			setfollow.forEach(function(_id){
				if(_id.trim()!="")
				$("img." + _id).attr('src',PageContext +'/resource/images/heartNo.png');
			})
			
			
		}
				
				
				
				
				
				
				$("[name='imgheart']").each(function() {
					
					
									let _id = $(this).attr("class");
									if (mem_id != _id) {
										
									} else {
										if(_id.trim()!=""){
										$("img." + _id).attr('src',PageContext + '/resource/images/heart.png');
										$("img." + _id).css("opacity","0.3");
										}
									}
								});
				
					
});

// ====================================以下是ajax愛心追蹤測試



$(document).on('click',"img[name='imgheart']",function() {
	PageContext = $("#PageContext").val();
			let mem_id = $(".memberidsave").attr("id");
			let _id = $(this).attr("class");
//console.log("mem_id="+mem_id+"  "+"_id="+_id);
			if (mem_id != null && mem_id != _id && mem_id != "") {
				$.ajax({
					url : PageContext + "/Follow.do",
					type : "POST",
					serchall : false,
					data : {
						mem_id : mem_id,
						_id : _id,
					},
					success : function(data) {
						
						show(data, mem_id, _id)
					}
				});

				function show(data, mem_id, _id) {
//					console.log("160="+data);
					var src = (!('true'.indexOf(data))) ? PageContext
							+ '/resource/images/heart.png' : PageContext
							+ '/resource/images/heartNo.png';
					if(_id.trim()!="")
					$("img." + _id).attr('src', src);

//					$("img." + _id).parent().children("p");

					

							showtxt(data, _id);
					

					function showtxt(data, _id) {

						let countnow = parseInt($("img." + _id).prev(".pheart").html());
						$("img." + _id).prev(".pheart").empty();
//						console.log("176 ="+countnow);
						if(!('true'.indexOf(data))){
//							console.log("177 true="+countnow);
							data = countnow+1;
//							console.log("179 true="+data);
				
							$("img." + _id).prev(".pheart").html(data);
						}else{
//							console.log("182 false="+countnow);
							data = countnow-1;
//							console.log("184 false="+data);
							
							$("img." + _id).prev(".pheart").html(data);
						
						};
					}

				}

			} else if (mem_id === _id) {

			} else {

//				alert("使用追蹤功能，請先登入會員");
				$(".logoinpage").hide();
				$(".addmempage").hide();
				$(".modal-backdrop.in").hide();
				// 				alert("有");
				$(".logoinpage").show();
				$(".modal-backdrop").show();
			}
		})	

