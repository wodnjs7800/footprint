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
<script
	src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx88497c9cdfc84f02ad5ef647680fd346">
</script>
<title>Insert title here</title>
<script type="text/javascript">
var map;
var markerInfo;

//출발지,도착지 마커
var marker_s, marker_e, marker_p;
//경로그림정보
var drawInfoArr = [];
var drawInfoArr2 = [];

var chktraffic = [];
var resultdrawArr = [];
var resultMarkerArr = [];



//좌표 관련
var lat, lng;
var lat_s, lng_s, lat_e, lng_e;
var marker;

//장소간 이동시 거리 및 시간
var tDistance;
var tTime;
var startplace;
var goalplace;

//시간
var st;
var et;
var ddate;

//일정 추가
var list = new Array();
var plan = new Object();

//시간순으로 정렬
var result;

if(lat_s == null && lng_s == null) 
{
	navigator.geolocation.getCurrentPosition(function(pos) {
    lat_s = pos.coords.latitude;
    lng_s = pos.coords.longitude;
	});
}	

	/*Null Check만 해주자*/
	function nullCheck(f){
		f.
	}


	function addPlan() {
		$('#addplan-dialog').dialog({
			modal : true,
			width : 'auto',
			height : 'auto',
			resizable : false,
			buttons : {
				"Yes" : function() {
					timeCheck(this);
					map.destroy();
					$(this).dialog('close');
				},
				"No" : function() {
					map.destroy();
					$(this).dialog('close');
				}
			}
		});
		initTmap(lat, lng, name);
	}
		
	function initTmap(getlat, getlng, getname){

		lat_e = getlat;
		lng_e = getlng;
		
		lat = (lat_s - lat_e)>0 ? lat_s - (Math.abs(lat_s-lat_e)/2).toFixed(14) : lat_e - (Math.abs(lat_s-lat_e)/2).toFixed(14);
		lng = (lng_s - lng_e)>0 ? lng_s - (Math.abs(lng_s-lng_e)/2).toFixed(14) : lng_e - (Math.abs(lng_s-lng_e)/2).toFixed(14);
		
		goalplace = getname;

		if(startplace == null){
			startplace="현재위치";
			$("#startplace").text("출발지 : "+startplace);
			$("#goalplace").text('도착지 : '+goalplace);
		}
		else{
			$("#startplace").text('출발지 : '+startplace);
			$("#goalplace").text('도착지 : '+goalplace);
		}
		
		map = new Tmapv2.Map("map_div", {
			center : new Tmapv2.LatLng(lat, lng),
			width : "400px",
			height : "400px",
			zoom : 10,
			zoomControl : true,
			scrollwheel : true
		});
		// 2. 시작, 도착 심볼찍기
		// 시작
		marker_s = new Tmapv2.Marker(
				{
					position : new Tmapv2.LatLng(lat_s,
							lng_s),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
					iconSize : new Tmapv2.Size(24, 38),
					map : map
				});
		//도착
		marker_e = new Tmapv2.Marker(
				{
					position : new Tmapv2.LatLng(lat_e,
							lng_e),
					icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
					iconSize : new Tmapv2.Size(24, 38),
					map : map
				});

		calcDistance();
	}
	// 3. 경로탐색 API 사용요청
	function calcDistance() {

		var searchOption = 0;

		$.ajax({
			type : "POST",
				url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
				async : false,
				data : {
					"appKey" : "l7xx88497c9cdfc84f02ad5ef647680fd346",
					"startX" : lng_s.toString(),
					"startY" : lat_s.toString(),
					"endX" : lng_e.toString(),
					"endY" : lat_e.toString(),
					"reqCoordType" : "WGS84GEO",
					"resCoordType" : "EPSG3857",
					"searchOption" : searchOption,
					"trafficInfo" : "Y"
			},
			success : function(response) {
				var resultData = response.features;

				tDistance = parseFloat((resultData[0].properties.totalDistance / 1000).toFixed(1));
				tTime = parseFloat((resultData[0].properties.totalTime / 60).toFixed(0));
						
				$("#distance").text((resultData[0].properties.totalDistance / 1000).toFixed(1)+"km");
				$("#ttime").text((resultData[0].properties.totalTime / 60).toFixed(0)+"분")
									
									//교통정보 표출 옵션값을 체크
				for ( var i in resultData) { //for문 [S]
					var geometry = resultData[i].geometry;
					var properties = resultData[i].properties;

					if (geometry.type == "LineString") {
					//교통 정보도 담음
						chktraffic.push(geometry.traffic);
						var sectionInfos = [];
						var trafficArr = geometry.traffic;

						for ( var j in geometry.coordinates) {
						// 경로들의 결과값들을 포인트 객체로 변환 
							var latlng = new Tmapv2.Point(geometry.coordinates[j][0], geometry.coordinates[j][1]);
						// 포인트 객체를 받아 좌표값으로 변환
							var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlng);

							sectionInfos.push(convertPoint);
						}
						drawLine(sectionInfos, trafficArr);
					} else {
						var markerImg = "";
						var pType = "";

						if (properties.pointType == "S") { //출발지 마커
							markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
							pType = "S";
						} else if (properties.pointType == "E") { //도착지 마커
							markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
							pType = "E";
						} else { //각 포인트 마커
							markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
							pType = "P"
						}

						// 경로들의 결과값들을 포인트 객체로 변환 
						var latlon = new Tmapv2.Point(geometry.coordinates[0], geometry.coordinates[1]);
						// 포인트 객체를 받아 좌표값으로 다시 변환
						var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(latlon);

						var routeInfoObj = {
							markerImage : markerImg,
							lng : convertPoint._lng,
							lat : convertPoint._lat,
							pointType : pType
						};
												// 마커 추가
						addMarkers(routeInfoObj);
					}
				}
			},
			error : function(request, status, error) {
						console.log("code:"
						+ request.status + "\n"
						+ "message:"
						+ request.responseText
						+ "\n" + "error:" + error);
					}
			});
					//JSON TYPE EDIT [E]
	}
	
	function addComma(num) {
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}

	//마커 생성하기
	function addMarkers(infoObj) {
		var size = new Tmapv2.Size(24, 38);//아이콘 크기 설정합니다.

		if (infoObj.pointType == "P") { //포인트점일때는 아이콘 크기를 줄입니다.
			size = new Tmapv2.Size(8, 8);
		}

		marker_p = new Tmapv2.Marker({
			position : new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
			icon : infoObj.markerImage,
			iconSize : size,
			map : map
		});

		resultMarkerArr.push(marker_p);
	}

	//라인그리기
	function drawLine(arrPoint, traffic) {
		var polyline_;

		if (chktraffic.length != 0) {

			// 교통정보 혼잡도를 체크
			// strokeColor는 교통 정보상황에 다라서 변화
			// traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)

			var lineColor = "";

			if (traffic != "0") {
				if (traffic.length == 0) { //length가 0인것은 교통정보가 없으므로 검은색으로 표시

					lineColor = "#06050D";
					//라인그리기[S]
					polyline_ = new Tmapv2.Polyline({
						path : arrPoint,
						strokeColor : lineColor,
						strokeWeight : 6,
						map : map
					});
					resultdrawArr.push(polyline_);
					//라인그리기[E]
				} else { //교통정보가 있음

					if (traffic[0][0] != 0) { //교통정보 시작인덱스가 0이 아닌경우
						var trafficObject = "";
						var tInfo = [];

						for (var z = 0; z < traffic.length; z++) {
							trafficObject = {
								"startIndex" : traffic[z][0],
								"endIndex" : traffic[z][1],
								"trafficIndex" : traffic[z][2],
							};
							tInfo.push(trafficObject)
						}

						var noInfomationPoint = [];

						for (var p = 0; p < tInfo[0].startIndex; p++) {
							noInfomationPoint.push(arrPoint[p]);
						}

						//라인그리기[S]
						polyline_ = new Tmapv2.Polyline({
							path : noInfomationPoint,
							strokeColor : "#06050D",
							strokeWeight : 6,
							map : map
						});
						//라인그리기[E]
						resultdrawArr.push(polyline_);

						for (var x = 0; x < tInfo.length; x++) {
							var sectionPoint = []; //구간선언

							for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
								sectionPoint.push(arrPoint[y]);
							}

							if (tInfo[x].trafficIndex == 0) {
								lineColor = "#06050D";
							} else if (tInfo[x].trafficIndex == 1) {
								lineColor = "#61AB25";
							} else if (tInfo[x].trafficIndex == 2) {
								lineColor = "#FFFF00";
							} else if (tInfo[x].trafficIndex == 3) {
								lineColor = "#E87506";
							} else if (tInfo[x].trafficIndex == 4) {
								lineColor = "#D61125";
							}

							//라인그리기[S]
							polyline_ = new Tmapv2.Polyline({
								path : sectionPoint,
								strokeColor : lineColor,
								strokeWeight : 6,
								map : map
							});
							//라인그리기[E]
							resultdrawArr.push(polyline_);
						}
					} else { //0부터 시작하는 경우

						var trafficObject = "";
						var tInfo = [];

						for (var z = 0; z < traffic.length; z++) {
							trafficObject = {
								"startIndex" : traffic[z][0],
								"endIndex" : traffic[z][1],
								"trafficIndex" : traffic[z][2],
							};
							tInfo.push(trafficObject)
						}

						for (var x = 0; x < tInfo.length; x++) {
							var sectionPoint = []; //구간선언

							for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
								sectionPoint.push(arrPoint[y]);
							}

							if (tInfo[x].trafficIndex == 0) {
								lineColor = "#06050D";
							} else if (tInfo[x].trafficIndex == 1) {
								lineColor = "#61AB25";
							} else if (tInfo[x].trafficIndex == 2) {
								lineColor = "#FFFF00";
							} else if (tInfo[x].trafficIndex == 3) {
								lineColor = "#E87506";
							} else if (tInfo[x].trafficIndex == 4) {
								lineColor = "#D61125";
							}

							//라인그리기[S]
							polyline_ = new Tmapv2.Polyline({
								path : sectionPoint,
								strokeColor : lineColor,
								strokeWeight : 6,
								map : map
							});
							//라인그리기[E]
							resultdrawArr.push(polyline_);
						}
					}
				}
			} else {

			}
		} else {
			polyline_ = new Tmapv2.Polyline({
				path : arrPoint,
				strokeColor : "#DD0000",
				strokeWeight : 6,
				map : map
			});
			resultdrawArr.push(polyline_);
		}

	}

	//초기화 기능
	function resettingMap() {
		//기존마커는 삭제
		marker_s.setMap(null);
		marker_e.setMap(null);

		if (resultMarkerArr.length > 0) {
			for (var i = 0; i < resultMarkerArr.length; i++) {
				resultMarkerArr[i].setMap(null);
			}
		}

		if (resultdrawArr.length > 0) {
			for (var i = 0; i < resultdrawArr.length; i++) {
				resultdrawArr[i].setMap(null);
			}
		}

		chktraffic = [];
		drawInfoArr = [];
		resultMarkerArr = [];
		resultdrawArr = [];
	}
</script>

</head>
<body>
	<!-- create랑 같음. 일정 날짜만 변경 할 수 있음. -->
	<section>
		<div style="float: right; padding-right: 100px;">
			<a href='/timetable/list'>목록</a>
		</div>
		<div id="addplan-dialog" title="일정 추가" style="display: none">
			<form class="form-horisontal" action="/timetable/update"
				method="post" name="frm" enctype="multipart/form-data"
				onsubmit="return nullCheck(this)">
				<input type="hidden" value="${dto.ttid }"> 
				<input type="date" value="${dto.startdate }" 
				min="${dto.startdate }" id="ddate" max="${dto.enddate }"> 
				<input type="time" id="starttime"> 
				<input type="time" id="endtime"> 
				<input type="hidden" id="movetime" value="">
				<input type="hidden" id="sp">
				<table>
					<tr>
						<td><label id="startplace"></label></td>
					</tr>
					<tr>
						<td><label id="goalplace"></label></td>
					</tr>
					<tr>
						<td><label>총 거리 :&nbsp; </label> <label id="distance"></label>&nbsp;
						</td>
					</tr>
					<tr>
						<td><label>소요시간 :&nbsp;</label> <label id="ttime"></label></td>
					</tr>
				</table>
			</form>
			<div id="map_div"></div>
		</div>

		<div class="space-medium"
			style="padding-left: 100px; padding-right: 100px;">
			<div style="overflow-y:scroll; height:400px; float:left; width:25%;">
				<table class="table table-striped">
					<tr>
						<th>List of Bookmark(food)</th>
					</tr>
					<!-- 여기는 for문 -->
					<c:choose>
						<c:when test="${empty flist }">
							<tr>
								<td>등록된 bookmark가없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dt" items="${flist }">
								<tr>
									<td><a
										href="javascript:addPlan()">${dt.bname }</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div style="overflow-y:scroll; height:400px; float:left; width:25%;">
				<table class="table table-striped">
					<tr>
						<th>List of Bookmark(travel)</th>
					</tr>
					<!-- 여기는 for문 -->
					<c:choose>
						<c:when test="${empty tlist }">
							<tr>
								<td>등록된 bookmark가없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dt" items="${tlist }">
								<tr>
									<td><a
										href="javascript:addPlan()">${dt.bname }</a>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div style="overflow-y:scroll; height:400px; float:left; width:50%">
				<table class="table table-striped" style="float:left;">
					<!-- 여기는 for문 -->
					<c:forEach var="i" begin="0" end="${days-1 }" step="1">
						<tr>
							<th style="font-size:8px; text-align: center">${list[i] }</th>
							<th>일정ID</th>
							<th>이름</th>
							<th>일정 날짜</th>
							<th colspan="2">소요시간(최소 출발시간)</th>
						</tr>
						<c:choose>
							<c:when test="${empty plist }">
								<tr>
									<td colspan="5">등록된 일정이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="dt" items="${plist }">
									<tr>
										<c:if test="${dt.ddate == list[i] }">
											<td></td>
											<td>${dt.planid }</td>
											<td><a href="javascript:addPlan()">${dt.bname }</a></td>
											<td>${dt.ddate }</td>
											<td>${dt.starttime } ~ ${dt.endtime }</td>
											<td>(${dt.movetime }에는 출발해야 합니다.)</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
			</div>
		</div>
		<div>
			<table style="width:100%;">
				<tr><td></td></tr>
			</table>
		</div>
	</section>
</body>
</html>
