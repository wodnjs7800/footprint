<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html> 
<head>
  <title>음식 삭제</title>
  <meta charset="utf-8">
  <style type="text/css">
  #red{
    color:red;
  }
  </style>
</head>
<body> 
<div class="container">
 
<h2 class="col-sm-offset-2 col-sm-10" style="padding:0px; margin-bottom:20px">여형지 삭제</h2>
<form class="form-horizontal" 
      action="./traveldelete"
      method="post"
      >
  <input type="hidden" name="travelno" value="${dto.travelno}">
  <input type="hidden" name="fname" value="${dto.fname}">
  
  <div class="form-group">
    <label class="control-label col-sm-2" style="padding-top:4px; padding-right:0px" for="travelname"><strong>음식점명</strong> :
    </label>
    <div class="col-sm-8">
      <p>${dto.travelname }</p>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" style="padding-top:4px; padding-right:0px" for="travelname"><strong>위치</strong> :
    </label>
    <div class="col-sm-8">
      <p>${dto.address1 } ${dto.address2 }</p>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" style="padding-top:4px; padding-right:0px" for="travelname"><strong>내용</strong> :
    </label>
    <div class="col-sm-8">
      <p>${dto.contents }</p>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" style="padding-top:4px; padding-right:0px" for="travelname"><strong>전화번호</strong> :
    </label>
    <div class="col-sm-8">
      <p>${dto.phone }</p>
    </div>
  </div>
  
  <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다</p>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-6" style="margin-bottom:50px">
    <button class="btn">삭제</button>
    <button type="reset" class="btn">취소</button>
    <button type="reset" class="btn"  onclick="history.back()" style="height:40px; float:right;">뒤로</button>
   </div>
 </div>
</form>
 
</div>
</body> 
</html>