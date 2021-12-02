<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정표 목록</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function read(ttid, startdate, enddate) {
		let sd = startdate;
		let ed = enddate;
		let arrsd = sd.split('-');
		let arred = ed.split('-');
		let da1 = new Date(arrsd[0], arrsd[1], arrsd[2]);
		let da2 = new Date(arred[0], arred[1], arred[2]);
		let dif = da2 - da1;
		let cDay = 24 * 60 * 60 * 1000; //시 분 초 밀리 샌컨즈

		let day = getDateRangeData(startdate, enddate);

		days = parseInt(dif / cDay) + 1;

		var url = "/timetable/read";
		url += "?ttid=" + ttid;
		url += "&nowPage=${nowPage}";
		url += "&days=" + days;
		url += "&startdate=" + startdate;
		url += "&enddate=" + enddate;
		url += "&day=" + day;

		location.href = url;
	}

	function getDateRangeData(param1, param2) { //param1은 시작일, param2는 종료일이다.
		var res_day = [];
		var ss_day = new Date(param1);
		var ee_day = new Date(param2);
		while (ss_day.getTime() <= ee_day.getTime()) {
			var _mon_ = (ss_day.getMonth() + 1);
			_mon_ = _mon_ < 10 ? '0' + _mon_ : _mon_;
			var _day_ = ss_day.getDate();
			_day_ = _day_ < 10 ? '0' + _day_ : _day_;
			res_day.push(ss_day.getFullYear() + '-' + _mon_ + '-' + _day_);
			ss_day.setDate(ss_day.getDate() + 1);
		}
		return res_day;
	}
</script>
</head>
<body>
	<div class="space-medium">
		<div style="float: right; padding-right: 100px;">
			<p>
				<a href='/timetable/create'>생성</a>
			</p>
		</div>
		<div style="padding-left: 100px; padding-right: 100px;">
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
									<td><a
										href="javascript:read('${dto.ttid}', '${dto.startdate }', '${dto.enddate }')">${dto.name}</a></td>
									<td>${dto.startdate}</td>
									<td>${dto.enddate}</td>
									<td>${dto.r}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<button type="reset" class="btn" onclick="history.back()" style="height:40px; float:right;">뒤로</button>
		</div>
		<div>${paging}</div>
	</div>
</body>
</html>