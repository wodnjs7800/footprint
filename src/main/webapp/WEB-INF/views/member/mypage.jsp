<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*,com.study.member.*" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

 <script type="text/javascript">
  function read(id){
	  var url = "${root}/member/read";
	  url += "?id="+id;
	  
	  location.href=url;
	  
  }
  </script>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<!-- Testimonials-section start -->
<div class="bg-default space-medium">
<div style='width:1200px;margin:0 auto;margin-top:50px;'>
	<ul class="nav nav-tabs">
	<li class='active'><a href="#tabmenu_01" data-toggle="tab">내정보</a></li>
		
		
	</ul>
	
	<div class="tab-content">
	<div class="tab-pane fade in active" id="tabmenu_01">
		<p>
		<div class="container">

<h3 class="col-sm-offset-2 col-sm-10">${dto.mname}의 회원정보</h3>
 <table class="table table-bordered">
 <tr>
 	<td colspan="2" style="text-align: center">
 		<img src="/member/storage/${dto.fname}" 
 		width="250px" height="250px" class="img-rounded" >
 	</td>
 </tr>
 <tr>
 	<th>아이디</th>
 	<td>${dto.id}</td>
 </tr>
 <tr>
 	<th>성명</th>
 	<td>${dto.mname}</td>
 </tr>
 <tr>
 	<th>전화번호</th>
 	<td>${dto.tel}</td>
 </tr>
 <tr>
 	<th>이메일</th>
 	<td>${dto.email}</td>
 </tr>
 <tr>
 	<th>우편번호</th>
 	<td>${dto.zipcode}</td>
 </tr>
 <tr>
 	<th>주소</th>
 	<td>${dto.address1} ${dto.address2}</td>
 </tr>
 <tr>
 	<th>포인트</th>
 	<td>${dto.point}</td>
 </tr>
 
 </table>




		
		
	
</p>
</div>
</div>	
		
</div>
 </div>
</div>
		
</body>
</html>