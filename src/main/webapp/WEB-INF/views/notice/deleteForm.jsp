<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
<head>
  <title>공지사항 삭제</title>
  <meta charset="utf-8">
  <style type="text/css">
  #red{
    color:red;
  }
  </style>
</head>
<body> 
<div class="container" style="margin-top:50px">
 
<h2 class="col-sm-offset-2 col-sm-10">공지 삭제</h2>
<form class="form-horizontal" 
      action="/notice/delete"
      method="post"
      onsubmit="return checkIn(this)">
      
  <input type="hidden" name="noticeno" value="${param.noticeno}">
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-6" style="margin-bottom:50px">
    <button class="btn" style="height:40px">삭제</button>
    <button type="reset" class="btn" style="height:40px; margin-left:5px">취소</button>
    <button type="reset" class="btn" onclick="history.back()" style="height:40px; float:right;">뒤로</button>
   </div>
 </div>
</form>
 
</div>
</body> 
</html>