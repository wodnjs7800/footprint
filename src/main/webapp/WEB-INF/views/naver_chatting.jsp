<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Q&A</title>

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<%-- WebSocket 관련 설정 --%>
<script src="/js/sockjs.min.js"></script>  <%--/static 폴더 기준 --%>
<script src="/js/stomp.min.js"></script>  <%--/static 폴더 기준 --%>

<script type="text/JavaScript" src="/js/app.js"></script>  <%--/static 폴더 기준 --%>
        
<script>
connect();



</script>  

<style>
.box{
	margin:10px; padding: 3px 5px;word-break: break-all;display: block;max-width: 300px;margin-bottom: 0px;border-radius: 4px
}
</style>
</head>
<body>
<div id="main-content" class="container" style="margin-top:50px">
    <H2>Q&A</H2>
    <div class="row">
        <div class="col-md-10">
            <table id="conversation" class="table table-striped">
                <thead>
                <tr>
                    <th>Chatting Bot</th>
                </tr>
                </thead>
                <tbody id="communicate" style="background-color:#cdf9bb">
                </tbody>
            </table>
        </div>
    </div>
    
    <form class="form-inline col-md-10" style="margin-bottom:30px">
                <div class="form-group" style="width: 90%;">
                    <label for="msg" style="margin-right:10px">문의</label>
                    <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요...."  style="width:90%;margin-top:10px">
                </div>
                <button id="send" class="btn btn-default" style="margin-bottom:15px; height:40px" type="submit">전송</button>
            </form>
</div>
</body>
</html>