<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function addPlan(days) {
		var url = "/timetable/update";
		url += "?ttid=${dto.ttid}";
		url += "&days="+days;
		url += "&id=${dto.id}";
		url += "&startdate=${startdate}"
		url += "&enddate=${enddate}"
		
		location.href = url;
	}
	
	function deleteTimetable(){
		
		$('#delete-dialog').dialog({
			modal:true,
			buttons:{
				"Yes" : function() {
					var url ="/timetable/delete";
					url += "?ttid=${dto.ttid}";
				
					location.href = url;
				},
				"No" : function(){
					$(this).dialog('close');
				}
			}
		});
	}
</script>
</head>
<body>
	<!-- create랑 같음. 일정 날짜만 변경 할 수 있음. -->
	<div id="delete-dialog" title="삭제" style="display:none">
		테이블을 삭제하시겠습니까?
	</div>
	<div style="float: right; padding-left: 100px; padding-right: 100px;">
		<p>
			<a href="javascript:addPlan(${days })">일정 수정</a>&nbsp;&nbsp; <!-- 추후에 필요 여부에 따라 지울지 말지 결정하겠음. -->
			<a href="javascript:deleteTimetable()">일정표 삭제</a>
		</p>
	</div>
	<div style="padding-left: 100px; padding-right: 100px; width: 100%%">
		<table style="width: 100%">
			<thead>
				<tr>
					<th colspan="8" style="font-size: 22px; text-align: center">${dto.name }</th>
				</tr>

				<c:forEach var="i" begin="1" end="${days }" step="1">
					<table style="border=1 solid red; width:100%">
						<tr>
							<th colspan="37">${i }</th>
						</tr>
						<tr>
							<c:forEach var="time" begin="12" end="48" step="1">

								<c:choose>
									<c:when test="${time%2 == 0 }">
										<td><f:formatNumber value="${time/2}" pattern="#" />:00&nbsp;</td>
									</c:when>
									<c:otherwise>
										<td><f:formatNumber value="${(time/2)-0.5 }" pattern="#" />:30&nbsp;</td>
										<!-- 숫자가 이상하게 추력되는 경우가 있어서 -0.5 해줌 -->
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="i" begin="1" end="37" step="1">
								<td>
									${i }
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