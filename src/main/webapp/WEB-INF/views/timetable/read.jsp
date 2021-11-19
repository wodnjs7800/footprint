<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function showMePlan(){
		let date = document.getElementById("date").value;
		let url = "/timetable/read";
		url += "?ttid=${dto.ttid}";
		url += "&id=${dto.id}";
		url += "&date="+date;
		
		location.href = url;
	}
</script>
</head>
<body>
	<!-- create랑 같음. 일정 날짜만 변경 할 수 있음. -->
	<div style="padding-left: 100px; padding-right: 100px; width: 100%;">
		<form class="form-horizontal" action="/timetable/create"
					method="post" name='frm' enctype="multipart/form-data"
					onsubmit="return inCheck(this)">
					<input type="date" min="${dto.startdate }" max="${dto.enddate }" value="${date }" id="date" onchange="showMePlan()">
					<input type="button" value="수정">
					<input type="button" value="삭제">
		</form>
	</div>
	<div style="padding-left: 100px; padding-right: 100px; width: 100%%">
		<table style="width:100%">
			<thead>
			<tr><th colspan="8" style="font-size:22px; text-align:center">${dto.name }</th></tr>
			</thead>
			<tbody>
			<tr>
			<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="8">등록된 일정이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>

						<c:forEach var="dto" items="${list}">

							<tr>
								<td>${dto.ttid}</td>
								<td><a href="javascript:read('')">${dto.name}</a></td>
								<td>${dto.startdate}</td>
								<td>${dto.enddate}</td>
								<td>${dto.r}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tr>
			</tbody>
		</table>
	</div>
</body>
</html>