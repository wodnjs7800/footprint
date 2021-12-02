<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:choose>
	<c:when
		test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
		<c:set var="str">관리자 페이지 입니다.</c:set>
	</c:when>
	<c:when
		test="${not empty sessionScope.id && sessionScope.grade != 'A'}">
		<c:set var='str'>안녕하세요  ${sessionScope.id } 님!</c:set>
	</c:when>
	<c:otherwise>
		<c:set var="str">기본 페이지 입니다.</c:set>
	</c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--     The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!--     <meta name="description" content="Want to start your travel agency online and need website for your travel business? Start with travel agency responsive website template. Its absolutely free."> -->
<!--     <meta name="keywords" content="travel, tour, tourism, honeymoon pacakage, summer trip, exotic vacation, destination, international, domestic website template, holiday, travel agecny responsive website template"> -->
<!--     <title>Tour and Travel Agency - Responsive Website Template</title> -->
<!--     Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/font-awesome.min.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
.kakaoChat {
	position: fixed;
	right: 15px;
	bottom: 15px;
	width: 80px;
	height: 80px;
	z-index: 99;
}
</style>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<a href="/naver_chatting"><img class="kakaoChat expand_img"
		src="${pageContext.request.contextPath }/images/naverChat/naverChat.jpg" /></a>
      <!-- header-section start -->
      <div class="top-bar">
        <div class="container">
            <div class="row">
                <div class="col-md-4 hidden-sm col-sm-12">            
                </div>
                <div class="col-md-8 hidden-sm hidden-xs">
                     <div class="navigation">
                            <div id="navigation">
                       <ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${empty sessionScope.id }">
							<li><a href="${root}/member/agree"><span
									class="glyphicon glyphicon-user"></span> Sign Up</a></li>
							<li><a href="${root}/member/login"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:when>
						<c:when
							test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
							<li><a href="${root}/admin/travellist"><span
									class="glyphicon glyphicon-list"></span> 여행요청</a></li>
							<li><a href="${root}/admin/foodlist"><span
									class="glyphicon glyphicon-log-out"></span> 맛집요청</a></li>
							<li><a href="${root}/admin/list"><span
									class="glyphicon glyphicon-list"></span> 회원목록</a></li>
							<li><a href="${root}/member/logout"><span
									class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${root}/cart/list">
						<span class="glyphicon glyphicon-shopping-cart"></span>즐겨찾기</a>
									</li>									
							<li><a href="${root}/timetable/list"><span
									class="glyphicon glyphicon-list"></span> 일정표</a></li>
							<li><a href="${root}/member/update"><span
									class="glyphicon glyphicon-edit"></span> 회원수정</a></li>
							<li><a href="${root}/member/mypage"><span
									class="glyphicon glyphicon-user"></span> 마이페이지</a></li>		
							<li><a href="${root}/member/logout"><span
									class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <div class="header-wrapper">
        <div class="header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-2 col-sm-12 col-xs-12">
                        <a href="${root}/"><img src="${root}/images/homelogo.jpg"></a>
                    </div>
                    <div class="col-lg-8 col-md-10 col-sm-12 col-xs-12">
                        <div class="navigation">
                            <div id="navigation">
                                <ul>
                                    <li class="active"><a href="${root}/" title="Home">홈</a></li>
                                    <li><a href="/travel/list" title="travel_list">여행</a> </li>
                                    <li><a href="/food/list" title="food_list">맛집</a> </li>
                                    <li class="has-sub"><a title="Blog ">커뮤니티</a>
                                        <ul>
                                            <li><a href="/notice/list" title="Notice">공지사항</a></li>
                                            <li><a href="/naver_chatting" title="Q&a ">Q&A</a></li>
                                        </ul>
                                    </li>
                                      
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="background: url(${pageContext.request.contextPath }/images/top.jpg) no-repeat center; background-size: cover; margin: 0px;">
        <div class="container" >
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
                    <div class="page-section">
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>