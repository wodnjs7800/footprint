<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Time Table List</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

	<div style="float:right; padding-right:100px;">
		<a href='/timetable/createtimetable'>생성</a>
	</div>
	<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>일정 이름</th>
					<th>일정 기간</th>
					<th>등록날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4">등록된 일정이 없습니다.</td>
					</c:when>
					<c:otherwise>

						<c:forEach var="dto" items="${list}">

							<tr>
								<td>${dto.ttid}</td>
								<td><%-- <a href="javascript:read('${dto.ttid}')"> --%>${dto.name}<!-- </a> --></td>
								<td>${dto.startdate}</td>
								<td>${dto.enddate}</td>
								<td>${dto.r}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</tbody>

		</table>
		<div>${paging}</div>
</body>
</html>