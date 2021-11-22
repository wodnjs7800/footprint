<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<title>음식 조회</title>
<meta charset="utf-8">

<script type="text/javascript">
	function updateM() {
		var url = "${root}/food/update";
		url += "?foodno=${dto.foodno}";
		location.href = url;
	}
	function deleteM() {
		var url = "${root}/food/delete";
		url += "?foodno=${dto.foodno}";
		location.href = url;
	}

	function listM() {
		var url = "list";
		url += "?nowPage=${param.nowPage}";
		url += "&col=${param.col}";
		url += "&array=${param.array}";
		url += "&word=${param.word}";
		location.href = url;
	}
</script>
</head>

<body>
    <!-- blog-section start -->
    <div class="space-medium">
        <div class="container" style="width: 800px;">
            <div class="mb80">
                <div class="col-xs-7 row" style="margin-bottom:30px">
                    <h1>${dto.foodname } (5.0)</h1>
                    <div >
	            	<small>작성자 : <strong>${dto.id }</strong> </small>
	            	<small style="margin-left:5px ;color: gray;">${dto.wdate }</small>
	           		</div>
                </div>
                <div class="col-xs-2 mt10" style="margin-top:40px; padding:0px; width: 90px;">
                    <small>${dto.viewcnt } views</small>
                </div>
                <div class="col-xs-1 mt10" style="margin-top:40px;padding:0px; width: 80px;">
                    <small>❤ 152</small>
                </div>
                <div class="col-xs-3 mt10" style="margin-top:40px;padding:0px; width: 120px;">
                    <small>tel)${dto.phone }</small>
                </div>
                
            </div>
            
            
            <div class="row">
	            
                <!-- post-one-start -->
                <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="post-block">
                        <div class="post-img"><img src="/food/storage/${dto.fname }" class="img-responsive"></div>
                    </div>
                </div>
                <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-bottom:15px">
                	<h4>위치 : ${dto.local } ${dto.address1 } ${dto.address2 }</h4>
                </div>
                <div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <p class="blockquote">"${dto.contents }"</p>
                    
                </div>
            </div>
            <div style="margin-top: 40px;">
                <div class="col-xs-8">
                    <button class="btn btn-outline-success my-2 my-sm-0" style="height:40px" onclick="updateM()">수정</button>
                    <button class="btn btn-outline-success my-2 my-sm-0" style="margin-left: 5px;height:40px" onclick="deleteM()">삭제</button>
                    <button class="btn btn-outline-success my-2 my-sm-0" style="margin-left: 5px;height:40px" onclick="listM()">목록</button>
                </div>
                <button class="btn btn-outline-success my-2 my-sm-0" style="margin-left: 130px;height:40px" onclick="">담기</button>
                <button class="btn btn-outline-success my-2 my-sm-0" style="margin-left: 5px;height:40px">뒤로</button>
            </div>
        </div>
    </div>
</body>

</html>
