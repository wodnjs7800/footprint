<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Time Table List</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function read(ttid, startdate, enddate){
		let sd = startdate;
		let ed = enddate;
		let arrsd = sd.split('-');
		let arred = ed.split('-');
		let da1 = new Date(arrsd[0], arrsd[1], arrsd[2]);
		let da2 = new Date(arred[0], arred[1], arred[2]);
		let dif = da2 - da1;
		let cDay = 24*60*60*1000;
		
		days = parseInt(dif/cDay)+1;
		alert(days);
		alert(typeof(days));
		
		var url = "/timetable/read";
		url += "?ttid="+ttid;
	    url += "&nowPage=${nowPage}";
	    url += "&days="+days;
		
		location.href = url;
	}
</script>
</head>
<body>

	<div style="float:right; padding-right:100px;">
		<a href='/timetable/create'>생성</a>
	</div>
	<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>일정 이름</th>
					<th>일정 기간</th>
					<th>등록날짜</th>
					<th>rownum</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="5">등록된 일정이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>

						<c:forEach var="dto" items="${list}">

							<tr>
								<td>${dto.ttid}</td>
								<td><a href="javascript:read('${dto.ttid}', '${dto.startdate }', '${dto.enddate }')">${dto.name}</a></td>
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