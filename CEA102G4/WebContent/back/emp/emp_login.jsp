<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入頁面</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<%= request.getContextPath()%>/resource/dashboard/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">


<style>

.bg-login-image {
    background: url(<%= request.getContextPath()%>/resource/images/IMG_2445.PNG);
    background-position: center;
    background-size: cover;
}


</style>

	<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

<head>


    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                   <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/emp/emp.do">
				<div class="form-group">
					<label for="uname"></label> <input type="text" class="form-control"
						id="username" placeholder="電子信箱" name="empEmail" required style="width: 25em">
				</div>

				<div class="form-group">
					<label for="uname"></label> <input type="password"
						class="form-control" id="password" placeholder="密碼" name="empPass"
						required style="width: 25em">
				</div>
				<input type="hidden" name="action" value="emp_Login">
				<input type="submit" class="btn btn-primary" value="登入">
				</button>

				
			</form>
                                    <hr>
<!--                                     <div class="text-center"> -->
<!--                                         <a class="small" href="forgot-password.html">Forgot Password?</a> -->
<!--                                     </div> -->
<!--                                     <div class="text-center"> -->
<!--                                         <a class="small" href="register.html">Create an Account!</a> -->
<!--                                     </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<%= request.getContextPath()%>/resource/dashboard/css/vendor/jquery/jquery.min.js"></script>
    <script src="<%= request.getContextPath()%>/resource/dashboard/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="<%= request.getContextPath()%>/resource/dashboard/css/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="<%= request.getContextPath()%>/resource/dashboard/css/js/sb-admin-2.min.js"></script>

</body>

</html>