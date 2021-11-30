<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
<div class="container">
<h3></h3>
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
  
    <div class="col-sm-3">
      
      <a href="/food/read/${dto.foodno }">
       <p><img src="/food/storage/${dto.ffname }" class="img-thumbnail"  width="236" height="306"></p></a>
        <p>${dto.foodname }</p>
        
    </div>
    <c:set var='i' value='${i=i+1}'/>
    </c:if>
     
 </c:forEach>
 
</div>


 <div class="row">
  <h3>여행</h3>
  <c:forEach var="dto"  items="${list}" varStatus='status' >
     <c:if test="${dto.opt=='t' and j<4}">
    <div class="col-sm-3">
     
       <a href="/travel/read/${dto.travelno }">
       <p><img src="/travel/storage/${dto.tfname }" class="img-thumbnail"  width="236" height="306"></p></a>
        <p>${dto.travelname }</p>
    </div>
    
    <c:set var='j' value='${j=j+1}'/>
    </c:if>
 </c:forEach>
</div>
${paging}
</c:otherwise>

</c:choose>
 
</div>

</body>
</html>