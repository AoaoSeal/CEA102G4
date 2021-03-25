<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Follow</title>

</head>
<body>
	<div class="allcontent">
		<p class="membertitle">追蹤</p>

		<br>
		<hr>
		<br>

	</div>
	<div class="allcontent">
	
		<ul class="membernavigation">
			<li><a href="javascript:" name="allfollow" class="10" >會員</a></li>
			<li><a href="javascript:" name="allfollow" class="12">領隊</a></li>
			<li><a href="javascript:" name="allfollow" class="13">行程</a></li>
			<li><a href="javascript:" name="allfollow" class="20">競標</a></li>
			<li><a href="javascript:" name="allfollow" class="25">商品</a></li>
			<li><a href="javascript:" name="allfollow" class="16">文章</a></li>
		</ul>

	</div>
	<hr>
	<div class="allcontentBox">
		</div>


<script>
$(window).on('load',function() {
	
	//=====設定哪一頁的網址
//	console.log($(".uri").val());
	
	
	let uri = $(".login").attr("href")+"&uri="+$(".uri").val();
	$(".login").attr("href",uri);
//	console.log(uri);
			$("a.10").css({"border-bottom":"3px #ff0157 solid", "padding-bottom":"3px"});
			PageContext = $("#PageContext").val();
			let _id = "";
			$.ajax({
				url : PageContext + "/SearchFollowByMemberID.do",
				type : "POST",
				dataType : 'JSON',

				data : {
					mem_id : $(".memberidsave").attr("id"),
					_id : 10,
				},
				success : function(data) {
					console.log("11");
					makebox(data);
				}
			});
			function makebox(data) {
				for ( var k in data) {
//					console.log(k, data[k][0].this_id);
					this_id = data[k][0].this_id;
					bt = data[k][0].bt;
					btx1 = data[k][0].btx1;
					pic = data[k][0].pic;
					let last = "<div class=\"box\">" + "<div class=\"imgBx\">"
							+ "<img " + "src=" + PageContext + pic + ">"
							+ "</div>" + "<div class=\"text\">" + "<h3>" + bt
							+ "</h3>" + "<h4>" + btx1 + "</h4>" + "</div>"
							+ "<div class=\"but\">"
							+ "<button name = \"imgheart\" class=\"" + this_id
							+ "\">取消追蹤</button></div></div>";
					$(".allcontentBox").append(last);
				}
			}
			;
		});
$(function() {

	$('body').on('click',"[name='allfollow']",function() {

				PageContext = $("#PageContext").val();

				
				let _id = $(this).attr('class');
				console.log(_id);
//				console.log($(".memberidsave").attr("id"))
				$("[name='allfollow']").each(function() {
					$("[name='allfollow']").css({"border-bottom":"0px #ff0157 solid", "padding-bottom":"3px"});
					
				});
				
				$(this).css({"border-bottom":"3px #ff0157 solid", "padding-bottom":"3px"});
//				console.log(_id);
				$.ajax({
					url : PageContext + "/SearchFollowByMemberID.do",
					type : "POST",
					dataType : 'JSON',
					
					data : {
						mem_id : $(".memberidsave").attr("id"),
						_id : _id,
					},
					success : function(data) {
						console.log(data);
						makebox(data);
					}

				});

				
				
				
				function makebox(data) {
					
					$(".allcontentBox").empty();

					for ( var k in data) {
//						console.log(k, data[k][0].this_id);
						this_id = data[k][0].this_id;
						bt = data[k][0].bt;
						btx1 = data[k][0].btx1;
						pic = data[k][0].pic;

						let last = "<div class=\"box\">"
								+ "<div class=\"imgBx\">" + "<img " + "src="
								+ PageContext + pic + ">" +

								"</div>" + "<div class=\"text\">" + "<h3>" + bt
								+ "</h3>" + "<h4>" + btx1 + "</h4>" +

								"</div>" + "<div class=\"but\">"
								+ "<button name = \"imgheart\" class=\""
								+ this_id + "\">取消追蹤</button></div></div>";
						
						
						$(".allcontentBox").append(last);

					}

				}
				;

			});
});
$(document).on('click',"button[name='imgheart']",function() {
	
	let mem_id = $(".memberidsave").attr("id");
	let _id = $(this).attr("class");

	if (mem_id != null && mem_id != _id) {
		$.ajax({
			url : PageContext + "/Follow.do",
			type : "POST",
			serchall : false,
			data : {
				mem_id : mem_id,
				_id : _id,
			},
			success : function(data) {

			}
		});
	}
	$.ajax({
		url : PageContext + "/SearchFollowByMemberID.do",
		type : "POST",
		dataType : 'JSON',
		data : {
			mem_id : $(".memberidsave").attr("id"),
			_id : _id,
		},
		success : function(data) {
							
		}
	});

	$(this).parents("div.box").remove();
	function makebox(data) {

	}
	;
})
</script>
</body>

</html>