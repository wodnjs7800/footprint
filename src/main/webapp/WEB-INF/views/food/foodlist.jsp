<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>

<head>
<title>음식 등록 요청</title>
<meta charset="utf-8">
<link href="${pageContext.request.contextPath }/css/heon.css"
	rel="stylesheet">
<script type="text/javascript">
	function foodUpdate(foodno) {
		var url = "foodupdate";
		url += "?foodno=" + foodno;
		url += "&nowPage=${nowPage}";
		url += "&oldfile=${dto.fname}";
		location.href = url;

	}
</script>
<style>
.hiddenx{
	overflow: hidden;
	white-space: nowrap;
	word-break: break-all;
	text-overflow: ellipsis;
	height:20px;
}
</style>
</head>

<body>
	<!-- Testimonials-section start -->
	<div class="bg-default space-medium">
        <div class="container">
        <h1 align="center" style="margin-bottom:60px">음식 등록 요청 페이지</h1>
			<div class="testimonial-wrapper">
				<div class="row">
					<!-- Testimonials-one-start -->
					<c:choose>
						<c:when test="${empty list}">
							<b style="margin-left:50px; font-size:20px">등록된 글이 없습니다.</b>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list}" >
								<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 expand_img"
									onclick='location.href="javascript:foodUpdate(${dto.foodno} )"'>
									<div class="testimonial-block"
										style="width: 230px; height: 280px">
										<div class="testimonial" style="width: 230px; height: 168px">
											<img src="/food/storage/${dto.fname }" class="img-thumbnail"
												style="width: 230px; height: 168px">
										</div>
										<div class="testimonial-content" style="padding: 10px">
											<h4 class="hiddenx">
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
