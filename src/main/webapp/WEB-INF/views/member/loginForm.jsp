<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

 <head>
  <title>로그인 처리</title>
  <meta charset="utf-8">
 
</head>

<body>
<div class="container">

<h1 class="col-sm-offset-2 col-sm-10">로그인</h1>
  <form class="form-horizontal" 
        action="/member/login"
        method="post">
    <input type="hidden" name="rurl" value="${param.rurl}">    
    <input type="hidden" name="bbsno" value="${param.bbsno}">    
    <input type="hidden" name="nowPage" value="${param.nowPage}">    
    <input type="hidden" name="nPage" value="${param.nPage}">    
    <input type="hidden" name="col" value="${param.col}">    
    <input type="hidden" name="word" value="${param.word}">
        
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디</label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="id" 
        placeholder="Enter id" name="id" required="required">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">비밀번호</label>
      <div class="col-sm-4">          
        <input type="password" class="form-control" id="pwd" 
        placeholder="Enter password" name="passwd" required="required">
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <div class="checkbox">
          <label>
          <c:choose>
          <c:when test="${c_id =='Y'}">
          	<input type="checkbox" name="c_id" value="Y" checked="checked"> Remember ID
          </c:when>
          <c:otherwise>
            <input type="checkbox" name="c_id" value="Y" > Remember ID
          </c:otherwise>
          </c:choose>
          </label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">로그인</button>
        <button type="button" class="btn btn-default"
         onclick="location.href='agree'">회원가입</button>
        <button type="button" class="btn btn-default">아이디 찾기</button>
        <button type="button" class="btn btn-default">패스워드 찾기</button>
      </div>
    </div>
  </form>
  <a href="javascript:kakaoLogin();"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFQOJtNpYFKTS1T5QdhIDFFgLzQO93BuFjFw&usqp=CAU" style="height: 50px; width: auto;" /></a>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script>
      window.Kakao.init("63a645c517fac82e8382ecd0e087b962");

      function kakaoLogin() {
          window.Kakao.Auth.login({
          scope:'profile_nickname, account_email',
          success: function(authObj) {
              console.log(authObj);
              window.Kakao.API.request({
                  url:'/v2/user/me',
                  success: res => {
                      const kakao_account = res.kakao_account;
                      console.log(kakao_account);
                  }
              });
          }
      });
      }
  </script>
</div>
</body>
</html>