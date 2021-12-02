<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>

<link href="${pageContext.request.contextPath }/css/heon.css"
	rel="stylesheet">	
<script type="text/javascript">

	function readf(foodno) {
		var url = "../food/read";
		url += "?foodno=" + foodno;
		url += "&nowPage=1";
		location.href = url;
		
	}
	function readt(travelno) {
		var url = "../travel/read";
		url += "?travelno=" + travelno;
		url += "&nowPage=1";
		location.href = url;
		
	}
	function deleteC(cartno) {
		var url = "/cart/delete";
		url += "?cartno="+cartno;
		location.href = url;
	}
</script>
</head>
<body>

<<<<<<< HEAD
<div class="page-breadcrumb">
		<div class="container">
			<div class="row">
				<div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<ol class="breadcrumb">
						<li><a onclick="location.href='/'">Home</a></li>
						<li>즐겨찾기</li>
					</ol>
				</div>
			</div>
		</div>
	</div>   
<c:choose>   
<c:when test="${empty list}">
   <div class="row">
   <h2>등록된 즐겨찾기가 없습니다</h2> 
   <p><img src="/images/default.jpg" class="img-thumbnail"  width="236" height="306"></p>
   </div>
</c:when>
<c:otherwise>
<c:set var="list" value="${list}"/>
      <c:set var='i' value='${0}'/>
     <c:set var='j' value='${0}'/>
	<div class="row">
 	<h3>맛집</h3>	
 		<c:forEach var="dto"  items="${list}" varStatus='status' >	
    		<c:if test="${dto.opt=='f' and i<4}">
    			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 expand_img"
				 >
					<div class="testimonial-block"
					style="width: 230px; height: 280px">
						<div class="testimonial" style="width: 230px; height: 168px">
							<img src="/food/storage/${dto.ffname }" class="img-thumbnail"
							style="width: 230px; height: 168px" onclick='location.href="javascript:readf(${dto.foodno} )"'>
						</div>
							<div class="testimonial-content" style="padding: 10px">
								<h4 class="hiddenx">
								${dto.foodname } <button type="button" class="btn btn-outline-success my-2 my-sm-0" style="margin-left: 5px;height:30px" onclick="deleteC('${dto.cartno}')">X</button>
								</h4>																												
							</div>							
						</div>
												
					</div>
					
    <c:set var='i' value='${i=i+1}'/>
    </c:if>
     
 </c:forEach>
 
</div>
 <div class="row" >
  <h3>여행</h3>
  	<c:forEach var="dto"  items="${list}" varStatus='status' >
     	<c:if test="${dto.opt=='t' and j<4}">
   			<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 expand_img"
				 >
					<div class="testimonial-block"
					style="width: 230px; height: 280px">
						<div class="testimonial" style="width: 230px; height: 168px">
							<img src="/travel/storage/${dto.ffname }" class="img-thumbnail"
							style="width: 230px; height: 168px" onclick='location.href="javascript:readt(${dto.travelno} )"'>
						</div>
							<div class="testimonial-content" style="padding: 10px">
								<h4 class="hiddenx">
								${dto.travelname } <button type="button" class="btn btn-outline-success my-2 my-sm-0" style="margin-left: 5px;height:30px" onclick="deleteC('${dto.cartno}')">X</button>								
								</h4>																												
							</div>							
						</div>										
					</div>
					
    <c:set var='j' value='${j=j+1}'/>
    
    </c:if>
 </c:forEach>
 
</div>
<button type="reset" class="btn" onclick="history.back()" style="height:40px; float:right;">뒤로</button>
${paging}
</c:otherwise>
</c:choose>
</div>
</body>
</html>