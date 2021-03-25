<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
<style>
@media screen and (min-width: 981px){
  
	html{
		font-size: 62.5%;
	}
}

@media screen and (min-width: 481px) and (max-width: 980px){
  
	html{
		font-size: 9px;
	}
}

@media screen and (max-width: 480px){
  
	html{
		font-size: 8px;
	}
}

body{
    background: radial-gradient(rgb(253, 253, 253), rgb(248, 248, 248));
  	font-family: -apple-system, BlinkMacSystemFont, "Roboto", "Open Sans", "Helvetica Neue", "Segoe UI", sans-serif;
	font-size: 1.6rem;
	margin: 0;
}

.demo{
	min-height: 470px;
  box-sizing: border-box;
  position: relative;

  padding-left: 1rem;
  padding-right: 1rem;

	display: flex;
	justify-content: center;
	align-items: center;
}

.footer{
    padding: 2rem;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;  
}

a{
  color: #000;
}

a:focus{
	outline: 2px solid #fdde60;
}

a:hover{
    text-decoration: none;
}

.melnik909{
  margin-left: 2rem;
}

/*
 * CSS payment card
 */

.payment-card{
	width: 60rem;
}

.payment-card__footer{
	text-align: center;
	margin-top: 2rem;
}

.bank-card{
	position: relative;
}

@media screen and (min-width: 481px){

    .bank-card{
    	height: 30rem;
    }

    .bank-card__side{
    	border-radius: 10px;
    	border: 1px solid transparent;
		  position: absolute;
		  width: 65%;
    }

    .bank-card__side_front{
    	background-color: #f0f0ee;
    	padding: 5%;
    	box-shadow: 0 0 10px #f4f4f2;
    	border-color: #a29e97;

    	top: 0;
    	left: 0;
    	z-index: 3;
    }

    .bank-card__side_back{
    	background-color: #e0ddd7;
    	padding: 24.5% 5% 11%;
    	box-shadow: 0 0 2rem #f3f3f3;

    	text-align: right;
    	border-color: #dad9d6;

		  top: 12%;
    	right: 0;
    }

    .bank-card__side_back:before{
    	content: "";
    	width: 100%;
    	height: 25%;
    	background-color: #8e8b85;

    	position: absolute;
    	top: 14%;
    	right: 0;
    }
}

@media screen and (max-width: 480px){

    .bank-card__side{
        border: 1px solid #a29e97;
        background-color: #f0f0ee;
        padding-left: 5%;
        padding-right: 5%;
    }

    .bank-card__side_front{
        border-radius: 10px 10px 0 0;
        border-bottom: none;
        padding-top: 5%;
    }

    .bank-card__side_back{
        border-radius: 0 0 10px 10px;
        border-top: none;
        padding-bottom: 5%;
    }
}

.bank-card__inner{
	margin-bottom: 4%;
}

.bank-card__inner:last-child{
	margin-bottom: 0;
}

.bank-card__label{
	display: inline-block;
	vertical-align: middle;
}

.bank-card__label_holder, .bank-card__label_number{
	width: 100%;
}

@media screen and (min-width: 481px){

    .bank-card__month, .bank-card__year{
        width: 25%;
    }
}

@media screen and (max-width: 480px){

    .bank-card__month, .bank-card__year{
        width: 48%;
    }
}

@media screen and (min-width: 481px){

    .bank-card__cvc{
        width: 25%;
    }
}

@media screen and (max-width: 480px){

    .bank-card__cvc{
        width: 100%;
        margin-top: 4%;
    }
}

.bank-card__hint{
	position: absolute;
	left: -9999px;
}

.bank-card__caption{
	text-transform: uppercase;
	font-size: 1.1rem;
  margin-left: 1%;
}

.bank-card__field{
	box-sizing: border-box;
	border: 3px solid #d0d0ce;
	width: 100%;

	padding: 1rem;
	font-family: inherit;
	font-size: 100%;
}

.bank-card__field:focus{
	outline: none;
	border-color: #fdde60;
}

.bank-card__separator{
	font-size: 3.2rem;
	color: #c4c4c3;

	margin-left: 3%;
	margin-right: 3%;
	display: inline-block;
	vertical-align: middle;
}

@media screen and (max-width: 480px){

    .bank-card__separator{
        display: none;
    }
}

@media screen and (min-width: 481px){

    .bank-card__footer{
        background-image: url("https://stas-melnikov.ru/demo-icons/mastercard-colored.svg"), url("https://stas-melnikov.ru/demo-icons/visa-colored.svg");
        background-repeat: no-repeat;
        background-position: 78% 50%, 100% 50% ;
    }
}

@media screen and (max-width: 480px){

    .bank-card__footer{
        display: flex;
        justify-content: space-between;
    }
}

.payment-card__button{

	background-color: #ada093;
	transition: background-color .4s ease-out;

	border-radius: 5px;
	border: 3px solid transparent;
	cursor: pointer;
	padding: 1rem 6.5rem;

	font-size: 100%;
	font-family: inherit;
	color: #fff;
}

.payment-card__button:focus{
	outline: none;
	border-color: #fdde60;
}

.payment-card__button:hover, .payment-card__button:focus{
	background-color: #8e8b85;
}
</style>



<!-- 每個front-end頁面都要有這行code -->
	<%
	String uri = request.getServletPath();
	System.out.println("jsp=" + uri);
	request.getSession().setAttribute("uri", uri);
	%>
	<!-- 每個front-end頁面都要有這行code -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">
	<div></div>
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">請輸入付款資訊</h2>
		</div>
<div class="demo">
		<form class="payment-card">
			<div class="bank-card">
				<div class="bank-card__side bank-card__side_front">
					<div class="bank-card__inner">
						<label class="bank-card__label bank-card__label_holder">
							<span class="bank-card__hint">持卡人姓名</span>
							<input type="text" class="bank-card__field" placeholder="持卡人姓名"  name="holder-card" required>
						</label>
					</div>
					<div class="bank-card__inner">
						<label class="bank-card__label bank-card__label_number">
							<span class="bank-card__hint">卡號(16碼)</span>
							<input type="text" class="bank-card__field" placeholder="卡號(16碼)" pattern="[0-9]{16}" name="number-card" required>
						</label>
					</div>
					<div class="bank-card__inner">
						<span class="bank-card__caption">到期年/月</span>
					</div>
					<div class="bank-card__inner bank-card__footer">
						<label class="bank-card__label bank-card__month">
							<span class="bank-card__hint">月</span>
							<input type="text" class="bank-card__field" placeholder="MM" maxlength="2" pattern="[0-9]{2}" name="mm-card" required>
						</label>
						<span class="bank-card__separator">/</span>
						<label class="bank-card__label bank-card__year">
							<span class="bank-card__hint"></span>
							<input type="text" class="bank-card__field" placeholder="YY" maxlength="2" pattern="[0-9]{2}" name="year-card" required>
						</label>
					</div>
				</div>
				<div class="bank-card__side bank-card__side_back">
					<div class="bank-card__inner">
						<label class="bank-card__label bank-card__cvc">
							<span class="bank-card__hint">CVC</span>
							<input type="text" class="bank-card__field" placeholder="CVC" maxlength="3" pattern="[0-9]{3}" name="cvc-card" required>
						</label>
					</div>
				</div>
			</div>
			<div class="payment-card__footer">
			<form METHOD="post"
				ACTION="<%=request.getContextPath()%>/front-end/tra/tra.do"
				name="form1" enctype="multipart/form-data">
			<input type="submit" class="payment-card__button" value="確定支付">
			<input type="hidden" name="action" value="pay">
			</form>
			</div>
		</form>
	</div> 
	<script src="https://stas-melnikov.ru/codepen/ga.js"></script>
	
</body>
</html>