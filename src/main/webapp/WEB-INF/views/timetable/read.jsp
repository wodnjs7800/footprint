<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>일정 조회</title>
<script type="text/javascript">
	let day = getDateRangeData("${startdate}", "${enddate}");

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

	
	function addPlan(days) {
		var url = "/timetable/update";
		url += "?ttid=${dto.ttid}";
		url += "&days=" + days;
		url += "&id=${dto.id}";
		url += "&startdate=${startdate}"
		url += "&enddate=${enddate}"
		url += "&day=" + day;

		location.href = url;
	}

	function deleteTimetable() {
		alert(${days});
		$('#delete-dialog').dialog({
			modal : true,
			buttons : {
				"Yes" : function() {
					var url = "/timetable/delete";
					url += "?ttid=${dto.ttid}";

					location.href = url;
				},
				"No" : function() {
					$(this).dialog('close');
				}
			}
		});
	}
</script>
</head>
<body>
	<!-- create랑 같음. 일정 날짜만 변경 할 수 있음. -->
	<div id="delete-dialog" title="삭제" style="display: none">테이블을
		삭제하시겠습니까?
	</div>
	<div style="text-align:right ;padding-right: 100px; width:100%; margin-top:50px">
		<a href="javascript:addPlan(${days })">일정 수정</a>&nbsp;&nbsp;
		<!-- 추후에 필요 여부에 따라 지울지 말지 결정하겠음. -->
		<a href="javascript:deleteTimetable()">일정표 삭제</a>
	</div>
	<div
		style="overflow-y: scroll; padding-left: 100px; padding-right: 100px; width: 100%%; height: 500px;">
		<table class="table table-striped">
			<thead>
				<tr>
					<th colspan="8" style="font-size: 22px; text-align: center">${dto.name }</th>
				</tr>

				<c:forEach var="i" begin="0" end="${days-1 }" step="1">
					<table class="table table-striped">
						<tr>
							<th colspan="3" style="text-align: center">${list[i] }</th>
						</tr>
						<c:choose>
							<c:when test="${empty plist }">
								<tr>
									<td colspan="5">등록된 일정이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dto" items="${plist }">
									<tr>
										<c:if test="${(dto.ddate == list[i]) }">
											<td>${dto.bname }</td>
											<td>${dto.starttime }</td>
											<td>${dto.endtime }</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</c:forEach>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
</html>