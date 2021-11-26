<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>

<head>
<title>음식 목록</title>
<meta charset="utf-8">
<link href="${pageContext.request.contextPath }/css/heon.css"
	rel="stylesheet">
<script type="text/javascript">
	function read(foodno) {
		var url = "read";
		url += "?foodno=" + foodno;
		url += "&col=${col}";
		url += "&array=${array}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;

	}
</script>
</head>

<body>
	<!-- page-header-start -->
	<div
		style="background: url(/food/storage/foodmain.jpg) no-repeat center; background-size: cover; margin: 0px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
					<div class="page-section">
						<h1 class="page-title"></h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="page-breadcrumb">
		<div class="container">
			<div class="row">
				<div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<ol class="breadcrumb">
						<li><a onclick="location.href='/'">Home</a></li>
						<li>food List</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- page-header-close -->
	<!-- Testimonials-section start -->
	<div class="bg-default space-medium">
		<div class="container">
			<form action="./list">
				<nav class="navbar navbar-expand-lg navbar-light bg-light"
					style="width: 1100px; margin-bottom: 30px; background-color: rgb(255, 253, 221); ">
					<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
						<ul class="navbar-nav mr-auto mt-2 mt-lg-0" style="width: 700px;">
							<div class="col-sm-4" style="margin-top: 7px">
								<select class="form-control" name="col">
									<option value="0" <c:if test= '${col=="0"}'> selected </c:if>>전체지역보기</option>
									<option value="강원도"
										<c:if test= "${col=='강원도'}"> selected </c:if>>강원도</option>
									<option value="경기남부"
										<c:if test= "${col=='경기남부'}"> selected </c:if>>경기남부</option>
									<option value="경기북부"
										<c:if test= "${col=='경기북부'}"> selected </c:if>>경기북부</option>
									<option value="경상남도"
										<c:if test= "${col=='경상남도'}"> selected </c:if>>경상남도</option>
									<option value="경상북도"
										<c:if test= "${col=='경상북도'}"> selected </c:if>>경상북도</option>
									<option value="광주광역시"
										<c:if test= "${col=='광주광역시'}"> selected </c:if>>광주광역시</option>
									<option value="대구광역시"
										<c:if test= "${col=='대구광역시'}"> selected </c:if>>대구광역시</option>
									<option value="대전광역시"
										<c:if test= "${col=='대전광역시'}"> selected </c:if>>대전광역시</option>
									<option value="부산광역시"
										<c:if test= "${col=='부산광역시'}"> selected </c:if>>부산광역시</option>
									<option value="서울시"
										<c:if test= "${col=='서울시'}"> selected </c:if>>서울시</option>
									<option value="세종시"
										<c:if test= "${col=='세종시'}"> selected </c:if>>세종시</option>
									<option value="울산광역시"
										<c:if test= "${col=='울산광역시'}"> selected </c:if>>울산광역시</option>
									<option value="인천광역시"
										<c:if test= "${col=='인천광역시'}"> selected </c:if>>인천광역시</option>
									<option value="전라남도"
										<c:if test= "${col=='전라남도'}"> selected </c:if>>전라남도</option>
									<option value="전라북도"
										<c:if test= "${col=='전라북도'}"> selected </c:if>>전라북도</option>
									<option value="제주도"
										<c:if test= "${col=='제주도'}"> selected </c:if>>제주도</option>
									<option value="충청남도"
										<c:if test= "${col=='충청남도'}"> selected </c:if>>충청남도</option>
									<option value="충청북도"
										<c:if test= "${col=='충청북도'}"> selected </c:if>>충청북도</option>

								</select>
							</div>
							<li style="width: 100px; margin-top: 7px;"><select
								class="form-control" name="array">
									<option value="0" <c:if test= "${array=='0'}"> selected </c:if>>최신순</option>
									<option value="1" <c:if test= "${array=='1'}"> selected </c:if>>조회순</option>
									<option value="2" <c:if test= "${array=='2'}"> selected </c:if>>리뷰순</option>
							</select></li>
						</ul>
						<form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2 col-xs-10"
								style="width: 200px; margin: 8px; margin-left: 70px"
								type="search" placeholder="Search" name="word" value="${word }">
							<button class="btn btn-outline-success my-2 my-sm-0"
								style="margin-top: 8px; height: 35px" type="submit">Search</button>
						</form>
					</div>
				</nav>
			</form>
			<div>
				<button class="btn btn-outline-success my-2 my-sm-0" style="height:40px; margin-bottom:20px; margin-left: 1020px;" onclick="location.href='/food/create'">글쓰기</button>
			</div>
			<div class="testimonial-wrapper">
				<div class="row">
					<!-- Testimonials-one-start -->
					<c:choose>
						<c:when test="${empty list}">
							<p>등록된 글이 없습니다.</p>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list}" >
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 expand_img"
									onclick='location.href="javascript:read(${dto.foodno} )"'>
									<div class="testimonial-block"
										style="width: 230px; height: 280px">
										<div class="testimonial" style="width: 230px; height: 168px">
											<img src="/food/storage/${dto.fname }" class="img-thumbnail"
												style="width: 230px; height: 168px">
										</div>
										<div class="testimonial-content" style="padding: 10px">
											<h4>
												<span class="location">(${dto.local })</span>${dto.foodname }
											</h4>
											<img src="/food/storage/star.jpg"
												style="width: 18px; height: 18px; margin-bottom:4px"><b style="font-size:15px">(${dto.avg })</b>
											<div
												style="margin-top: 4px; display: flex; justify-content: right">
												<small>${dto.viewcnt } views </small>
											</div>
											<div style="display: flex; justify-content: right">
												<small>등록일:${dto.wdate }</small>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<!-- Testimonials-one-close -->
				</div>
			</div>
			<div style='display: flex; justify-content: center;'>${paging}</div>
		</div>
	</div>
</body>

</html>
