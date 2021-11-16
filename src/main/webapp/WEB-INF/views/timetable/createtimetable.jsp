<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Time Table</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
	<h2 class="col-sm-offset-2 col-sm-10">일정표 생성</h2>
	<label class="col-sm-offset-2 col-sm-10">(<span id="need">*</span> 필수입력사항)</label>
	<form class="form-horizontal" 
        action="create"
        method="post"
        name = 'frm'
        enctype="multipart/form-data"
        onsubmit="return inCheck(this)"
        >
        <div class="form-group">
        	<label class="control-label col-sm-2">일정 이름</label>
        	<div class="col-sm-4">
        		<input type="text" class="form-control" id="name">
        	</div>
        </div>
        <div class="form-group">
        	<label class="control-label col-sm-2">일정 기간</label>
        	<div class="col-sm-4">
        		<input type="date" class="form-control" id="startdate">
        	</div>
        	<div class="col-sm-4">
        		<input type="date" class="form-control" id="enddate">
        	</div>
        </div>
        <div style="float:right; padding-right:200px;">
        	<div style="float:right;"><button>취소</button></div>
        	<div style="float:right;"><button>생성</button></div>
        </div>
    </form>
</body>
</html>