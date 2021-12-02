<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html> 
<head>
  <title>공지사항 수정</title>
  <meta charset="utf-8">
 
</head>
<body> 
 
<div class="container" style="margin-top:50px">
<h1 class="col-sm-offset-2 col-sm-10">공지 수정</h1>
<form class="form-horizontal" 
      action="/notice/update"
      method="post"
      enctype="multipart/form-data"
      onsubmit="return checkIn(this)">
      
<input type="hidden" name="noticeno" value="${dto.noticeno}">

  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-7">
      <input type="text" name="title" id="title" 
      class="form-control" value="${dto.title}">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-7">
    <textarea rows="12" cols="7" id="content" name="content" 
    class="form-control">${dto.content}</textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-3">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-7" style="margin-bottom:50px">
    <button class="btn" style="height:40px">수정</button>
    <button type="reset" class="btn" style="height:40px; margin-left:5px">취소</button>
    <button type="reset" class="btn" onclick="history.back()" style="height:40px; float:right;">뒤로</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 