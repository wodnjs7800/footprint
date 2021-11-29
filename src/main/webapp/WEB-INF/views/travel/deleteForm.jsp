<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>여행 삭제</title>
  <meta charset="utf-8">
  <style type="text/css">
  #red{
    color:red;
  }
  </style>
</head>
<body> 
<div class="container">
 
<h2 class="col-sm-offset-2 col-sm-10">여행 삭제</h2>
<form class="form-horizontal" 
      action="/travel/delete"
      method="post"
      >
  <input type="hidden" name="travelno" value="${param.travelno}">
  <input type="hidden" name="oldfile" value="${param.oldfile}">
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-6">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-8">
    <button class="btn" style="height:40px">삭제</button>
    <button type="reset" class="btn" style="height:40px; margin-left:5px">취소</button>
    <button type="reset" class="btn"  onclick="history.back()" style="height:40px; margin-left:380px">뒤로</button>
   </div>
 </div>
</form>
 
</div>
</body> 
</html>