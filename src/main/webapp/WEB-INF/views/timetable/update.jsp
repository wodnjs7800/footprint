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
<!-- create랑 같음. 일정 날짜만 변경 할 수 있음. -->
<div style="float:left; padding:100px; width:30%;">
	<table class="table table-striped">
		<thead>
			<tr>
				<th>사진
				<th>이름/주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="list" items="${list }">
				<tr>
					<td rowspan="2"></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div style="float:left; padding:100px; width:70%">
	<h1>createplan에서 저장한 내용 표출</h1>
	<h2>read에서는 즐겨찾기 빼고 이것만 보여줄 예정</h2>
</div>
</body>
</html>