<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
 
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
 <meta name="description" content="Want to start your travel agency online and need website for your travel business? Start with travel agency responsive website template. Its absolutely free.">
  <meta name="keywords" content="travel, tour, tourism, honeymoon pacakage, summer trip, exotic vacation, destination, international, domestic website template, holiday, travel agecny responsive website template">
  <title>Tour and Travel Agency - Responsive Website Template</title>
  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Style CSS -->
  <link href="css/style.css" rel="stylesheet">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
  <!-- FontAwesome CSS -->
  <link href="css/font-awesome.min.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
   <script type="text/javascript">
     function read(noticeno){
       var url = "read";
       url += "?noticeno="+noticeno;
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";
       location.href=url;
 
     }  
  </script>
 
</head>
<body>
<div class="container">
 
   <h2>공지 사항</h2>
  <form class="form-inline" method="post" action="../notice/list">
    <div class="form-group">
      <select class="form-control" name="col">
        <option value="wname"
        <c:if test= "${col=='wname'}"> selected </c:if>
        >성명</option>
        <option value="title"
        <c:if test= "${col=='title'}"> selected </c:if>
        >제목</option>
        <option value="content"
        <c:if test= "${col=='content'}"> selected </c:if>
        >내용</option>
        <option value="title_content"
        <c:if test= "${col=='title_content'}"> selected</c:if>
        >제목+내용</option>
        <option value="total"
        <c:if test= "${col=='total'}"> selected </c:if>
        >전체출력</option>       
     </select>
    </div>
    
    <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter 검색어" 
      name="word" value="${word}">
    </div>
    <button type="submit" class="btn btn-default" >검색</button>
    <button type="button" class="btn btn-default" onclick="location.href='../admin/notice/create'">등록</button>
  </form>
  
  <table class="table table-striped">
   <thead>
    <tr>
    <th>번호</th>
    <th>제목</th>
    <th>작성자</th>
    <th>등록날짜</th>
    <th>조회수</th>
    
    </tr>
   </thead>
   <tbody>
 
<c:choose>   
<c:when test="${empty list}">
   <tr><td colspan="6">등록된 글이 없습니다.</td>
</c:when>
<c:otherwise>
  
   <c:forEach var="dto" items="${list}"> 
   
   <tr>
    <td>${dto.noticeno}</td>
    <td>
    <a href="javascript:read('${dto.noticeno}')">${dto.title}</a>
    
 
    <c:if test="${util:newImg(fn:substring(dto.rdate,0,10)) }">
         <img src="${pageContext.request.contextPath}/images/new.gif"> 
    </c:if>
 
    </td>
    <td>${dto.wname}</td>
    <td>${dto.rdate}</td>
    <td>${dto.cnt}</td>
   </tr>
   </c:forEach>
   </c:otherwise>
   </c:choose>
 
   </tbody>
  
  </table>
  <div>
      ${paging}
  </div>
</div>
</body> 
</html> 