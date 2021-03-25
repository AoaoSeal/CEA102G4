<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
=========================================================
* Paper Dashboard 2 - v2.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-dashboard-2
* Copyright 2020 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8" />
<!-- 	<link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png"> -->
<!-- 	<link rel="icon" type="image/png" href="./assets/img/favicon.png"> -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>
	  Paper Dashboard 2 by Creative Tim
	</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />

	<link href="<%=request.getContextPath()%>/resource/dashboard/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
	<!-- bootstrap -->
	<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/bootstrap3.3.7/css/bootstrap.min.css">
	<link href='<%= request.getContextPath()%>/resource/fullcalendar/fullcalendar.css' rel='stylesheet' />
	<script src='<%= request.getContextPath()%>/resource/fullcalendar/fullcalendar.min.js'></script>
	<link href='<%= request.getContextPath()%>/resource/fullcalendar/fullcalendar.css' rel='stylesheet' />
	<link href='<%= request.getContextPath()%>/resource/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />	
	<script src='<%= request.getContextPath()%>/resource/fullcalendar/lib/moment.min.js'></script>
	<script src='<%= request.getContextPath()%>/resource/fullcalendar/lib/jquery.min.js'></script>
	<script src='https://fullcalendar.io/js/fullcalendar-3.1.0/lib/moment.min.js'></script>
	<script src='https://fullcalendar.io/js/fullcalendar-3.1.0/lib/jquery.min.js'></script>
	<script src='https://fullcalendar.io/js/fullcalendar-3.1.0/lib/jquery-ui.min.js'></script>
	<script src='https://fullcalendar.io/js/fullcalendar-3.1.0/fullcalendar.min.js'></script>
	<script src="<%= request.getContextPath()%>/resource/bootstrap3.3.7/js/bootstrap.min.js"></script>




<script src="<%=request.getContextPath()%>/resource/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/resource/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath()%>/resource/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.css">

<!--     測試要不要     -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">	
<link href='<%= request.getContextPath()%>/resource/fullcalendar/lib/cupertino/jquery-ui.min.css' rel='stylesheet' />
<!-- jquery -->
<script src="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.js"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/resource/css/paper-dashboard.css?v=2.0.1">
<!--   Core JS Files   -->

<script src="<%=request.getContextPath()%>/resource/dashboard/js/core/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/resource/dashboard/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chart JS -->
<script src="<%=request.getContextPath()%>/resource/dashboard/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="<%=request.getContextPath()%>/resource/dashboard/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script src="<%=request.getContextPath()%>/resource/dashboard/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
<!-- ==========================別打開============================== -->
<%--     <script src="<%=request.getContextPath()%>/resource/dashboard/js/core/bootstrap.min.js"></script> --%>
<%--     <script src="<%=request.getContextPath()%>/resource/dashboard/js/core/jquery.min.js"></script> --%>
<!-- ==========================別打開============================== -->


<style>
	.icon{
			width:12%;
		}
	body{
			background-color:#f4f3ef;
		}

</style>
</head>

<body class="">
<!--       側邊欄                 -->
 <div class="wrapper ">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
<!--         <a href="https://www.creative-tim.com" class="simple-text logo-mini"> -->
          <div class="logo-image-small">
            <img src="${pageContext.request.contextPath}/resource/images/logo.png"
				alt="">
          </div>
      </div>
      
<!--       側邊欄                 -->
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active ">
         	 <a href="<%= request.getContextPath()%>/back-end/back_end_index.jsp">				
              <p><img src="${pageContext.request.contextPath}/resource/images/icon/mountains.png"
				alt="" class="icon">　後台首頁</p>
            </a>
          </li>
          <li>
            <a href="<%= request.getContextPath()%>/back-end/member/listAllMem.jsp">
              <p><img src="${pageContext.request.contextPath}/resource/images/icon/user.png"
   				 alt="" class="icon">　會員管理</p>
            </a>
          </li>
          <li>
            <a href="<%= request.getContextPath()%>/back-end/itinerary/calendar2.jsp">				
              <p><img src="${pageContext.request.contextPath}/resource/images/icon/mountains.png"
				alt="" class="icon">　行程管理</p>
            </a>
          </li>
          <li>
            <a href="<%= request.getContextPath()%>/back-end/itinerary_category/listAllItc.jsp">				
              <p><img src="${pageContext.request.contextPath}/resource/images/icon/folder.png"
				alt="" class="icon">　行程類別管理</p>
            </a>
          </li>
          <li>
            <a href="<%= request.getContextPath()%>/back-end/leader/select_page.jsp">
              <p><img src="${pageContext.request.contextPath}/resource/images/icon/guide.png"
				alt="" class="icon">　領隊管理</p>
            </a>
          </li>
           <li>
            <a href="<%= request.getContextPath()%>/back-end/bid/listAllBid.jsp">
              <p><img src="${pageContext.request.contextPath}/resource/images/icon/auction.png"
    			alt="" class="icon">　競標管理</p>
            </a>
          </li>
 			  <li>
            <a href="<%= request.getContextPath()%>/back-end/article/select_art.jsp">
              <p><img src="${pageContext.request.contextPath}/resource/images/icon/article.png"
    			alt="" class="icon">　文章管理</p>
            </a>
          </li>
          <li>
            <a href="<%= request.getContextPath()%>/back-end/tra/select_page.jsp">
              <p><img src="${pageContext.request.contextPath}/resource/images/icon/purse.png"
    			alt="" class="icon">　交易審核</p>
            </a>
          </li>
          <li>
            <a href="<%= request.getContextPath()%>/back/chat_back.jsp">
              <p><img src="${pageContext.request.contextPath}/resource/images/icon/chat.png"
				alt="" class="icon">　線上客服</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
<!--       側邊欄                 -->    
    <div class="main-panel" style="height: 100vh;">
<!-- Navbar header -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
<!--               <button type="button" class="navbar-toggler"> -->
<!--                 <span class="navbar-toggler-bar bar1"></span> -->
<!--                 <span class="navbar-toggler-bar bar2"></span> -->
<!--                 <span class="navbar-toggler-bar bar3"></span> -->
<!--               </button> -->
            </div>
<!--             <a class="navbar-brand" href="javascript:;">Title</a> -->
          </div>
<!--           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--             <span class="navbar-toggler-bar navbar-kebab"></span> -->
<!--             <span class="navbar-toggler-bar navbar-kebab"></span> -->
<!--             <span class="navbar-toggler-bar navbar-kebab"></span> -->
<!--           </button> -->
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
            <form>
              <div class="input-group no-border">
<!--                 <input type="text" value="" class="form-control" placeholder="Search..."> -->
                <div class="input-group-append">
<!--                   <div class="input-group-text"> -->
<!--                     <i class="nc-icon nc-zoom-split"></i> -->
<!--                   </div> -->
                </div>
              </div>
            </form>
<!--             <ul class="navbar-nav"> -->
<!--               <li class="nav-item btn-rotate dropdown"> -->
<!--                 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!--                   <i class="nc-icon nc-bell-55"></i> -->
<!--                   <p> -->
<!--                     <span class="d-lg-none d-md-block">Some Actions</span> -->
<!--                   </p> -->
<!--                 </a> -->
<!--                 <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink"> -->
<!--                   <a class="dropdown-item" href="#">Action</a> -->
<!--                   <a class="dropdown-item" href="#">Another action</a> -->
<!--                   <a class="dropdown-item" href="#">Something else here</a> -->
<!--                 </div> -->
<!--               </li> -->
<!--             </ul> -->
          </div>
        </div>
      </nav>
<!-- End Navbar header -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
          
          <sitemesh:write property='body' />
          
          
<!--             <h3 class="description">Your content here</h3> -->
          </div>
        </div>
      </div>   
    </div>
  </div>
 
</body>

</html>
