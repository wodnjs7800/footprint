<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function showMePlan() {
		let date = document.getElementById("date").value;
		let url = "/timetable/read";
		url += "?ttid=${dto.ttid}";
		url += "&id=${dto.id}";
		url += "&date=" + date;

		location.href = url;
	}
</script>
</head>
<body>
	<!-- create랑 같음. 일정 날짜만 변경 할 수 있음. -->
	<div style="float: right; padding-left: 100px; padding-right: 100px;">
		<p>
			<a onclick="">일정추가</a>&nbsp;&nbsp; <a onclick="">일정표 수정</a>&nbsp;&nbsp;
			<a onclick="">일정표 삭제</a>
		</p>
	</div>
	<div style="padding-left: 100px; padding-right: 100px; width: 100%%">
		<table style="width: 100%">
			<thead>
				<tr>
					<th colspan="8" style="font-size: 22px; text-align: center">${dto.name }</th>
				</tr>

				<c:forEach var="i" begin="1" end="${days }" step="1">
					<table style="border=1 solid red;">
						<tr>
							<th colspan="37">${i}일차</th>
						</tr>
						<tr>
							<c:forEach var="time" begin="360" end="1440" step="30">

								<c:choose>
									<c:when test="${time%60 == 0 }">
										<td><f:formatNumber value="${time/60}" pattern="#" />:00</td>
									</c:when>
									<c:otherwise>
										<td><f:formatNumber value="${(time/60)-0.5 }" pattern="#" />:30</td>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="time" begin="360" end="1440" step="30">
								<td>
									gg
								</td>
							</c:forEach>
						</tr>
					</table>		
				</c:forEach>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
</html>