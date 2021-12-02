<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html> 
<head>
  <title>공지사항 등록</title>
  <meta charset="utf-8">
  
  <script type="text/JavaScript">
        
 function checkIn(f){
         if (f.wname.value == ""){
              alert("작성자를 입력하세요");
              f.wname.focus()
              return false;
         }
         if (f.title.value == ""){
              alert("제목를 입력하세요");
              f.title.focus();
              return false;
         }
         if (f.content.value == '') {
             window.alert('내용을 입력해 주세요.');
             f.content.focus();
             return false;
         }
         if (f.passwd.value == ""){
             alert('비밀번호를 입력해 주세요.');
             return false;
         }
 }
 </script>
</head>
<body> 
<div class="container"style="margin-top:50px">
<h2 class="col-sm-offset-2 col-sm-10">공지 등록</h2>
<form class="form-horizontal" 
      action="/notice/create"
      method="post"
      enctype="multipart/form-data"
      onsubmit="return checkIn(this)">

  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-7">
      <input type="text" name="title" id="title" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-7">
    <textarea rows="12" cols="7" id="content" name="content" class="form-control"></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-3">
      <input type="password" name="passwd" id="passwd" class="form-control">
    </div>
  </div>
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-7">
    <button class="btn" style="height:40px">등록</button>
    <button type="reset" class="btn" style="height:40px; margin-left:5px">취소</button>
    <button type="reset" class="btn" onclick="history.back()" style="height:40px; float:right;">뒤로</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 