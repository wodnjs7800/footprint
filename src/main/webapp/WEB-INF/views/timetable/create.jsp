<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정표 생성</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	window.onload = function() {
		let st = document.getElementById("startdate");
		let et = document.getElementById("enddate");

		let today = new Date();
		let mindate = today.getFullYear() + "-" + (today.getMonth() + 1) + "-"
				+ today.getDate();

		st.min = mindate;
		et.min = mindate;
	}

	function inCheck(f) {
		if (f.name.value == "") {
			alert("일정 이름을 작성해주세요");
			f.name.focus();
			return false;
		} else if (f.startdate.value == "") {
			alert("일정 기간을 선택해주세요");
			f.startdate.focus
			return false;
		} else if (f.enddate.value == "") {
			alert("일정 기간을 선택해주세요");
			f.enddate.focus();
			return false;
		}
	}

	function checkDate1() {
		let st = document.getElementById("startdate");
		let et = document.getElementById("enddate");

		if ((et.value != null) && (et.value < st.value)) {
			et.value = "";
		} else if ((et.value != null) && (et.value >= st.value)) {
			let name = document.getElementById("name");
			name.value = st.value + " ~ " + et.value + " 일정";
		}
	}
	function checkDate2() {
		let st = document.getElementById("startdate");
		let et = document.getElementById("enddate");

		if (st.value == "") {
			alert("시작일을 먼저 선택하세요.");
			et.value = "";
			st.focus();
		}
		if (st.value > et.value) {
			alert("시작일보다 큰값을 넣어주세요.");
			et.value = "";
		} else {
			let name = document.getElementById("name");
			name.value = st.value + " ~ " + et.value + " 일정";
		}
	}
</script>
</head>
<body>
	<h2 class="col-sm-offset-2 col-sm-10" style="margin-top:50px">일정표 생성</h2>
	<form class="form-horizontal" action="/timetable/create" method="post"
		name='frm' enctype="multipart/form-data"
		onsubmit="return inCheck(this)">

		<input type="hidden" id="id" name="id" value="${id }">

		<div class="form-group">
			<label class="control-label col-sm-2">일정 이름</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="name" name="name"
					value="">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">일정 기간</label>
			<div class="col-sm-4">
				<input type="date" class="form-control" id="startdate"
					name="startdate" min="" onblur="checkDate1()">
			</div>
			<div class="col-sm-4">
				<input type="date" class="form-control" id="enddate" 
					name="enddate" min="" onblur="checkDate2()">
			</div>
			<div style="float: right; padding-right: 200px;">
			<div style="float: right; padding-right: 10px; margin-bottom:50px; height:40px;">
				<button class="btn" >생성</button>
				<button type="reset" class="btn">취소</button>
				<button type="reset" class="btn" onclick="history.back()" >뒤로</button>
			</div>
		</div>
		</div>
	</form>
</body>
</html>