<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 조회</title>
<meta charset="utf-8">

<script type="text/javascript">
	function updateM() {
		var url = "/admin/notice/update";
		url += "?noticeno=${dto.noticeno}";
		location.href = url;
	}
	function deleteM() {
		var url = "/admin/notice/delete";
		url += "?noticeno=${dto.noticeno}";
		location.href = url;
	}

	function listM() {
		var url = "list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		location.href = url;
	}
</script>

</head>
<body>
	<div class="container">

		<h2>공지 조회</h2>
		<div class="panel panel-default">
			<div class="panel-heading">작성자</div>
			<div class="panel-body">관리자</div>

			<div class="panel-heading">제목</div>
			<div class="panel-body">${dto.title}</div>

			<div class="panel-heading">내용</div>
			<div class="panel-body">${dto.content}</div>

			<div class="panel-heading">조회수</div>
			<div class="panel-body">${dto.cnt}</div>

			<div class="panel-heading">등록일</div>
			<div class="panel-body">${dto.rdate}</div>

		</div>
   		<div class="form-group" style="margin-bottom:50px">
			<button type="button" class="btn" style="height:40px" onclick="location.href='../admin/notice/create'">등록</button>
			<button type="button" class="btn" style="height:40px; margin-left:5px" onclick="updateM()">수정</button>
			<button type="button" class="btn" style="height:40px; margin-left:5px" onclick="deleteM()">삭제</button>
			<button type="button" class="btn" style="height:40px; margin-left:5px" onclick="listM()">목록</button>
			<button type="reset" class="btn" onclick="history.back()" style="height:40px; float:right;">뒤로</button>
		</div>
	</div>
</body>
</html>