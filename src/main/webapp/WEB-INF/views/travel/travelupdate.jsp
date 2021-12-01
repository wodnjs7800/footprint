<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html> 
<head>
  <title>음식생성</title>
  <meta charset="utf-8">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    function goBack() {           //뒤로가기 버튼 생성 설정
    	window.history.back();
    	}

    function deleteM() {
		var url = "traveldelete";
		url += "?travelno=${dto.travelno}";
		url += "&oldfile=${dto.fname}";
		location.href = url;
	}
</script>

<script type="text/javascript">
    function inCheck(f){
        if(f.travelname.value.length==0){
            alert("여행지명을 입력하세요");
            f.travelname.focus();
            return false;
        }
        if(f.contents.value.length==0){
            alert("내용을 입력하세요");
            f.contents.focus();
            return false;
        }
        if(f.local.value==0){
            alert("지역을 선택해 주세요");
            f.local.focus();
            return false;
        }
        if(f.zipcode.value.length==0){
            alert("우편번호를 입력하세요");
            f.zipcode.focus();
            return false;
        }
        if(f.address1.value.length==0){
            alert("주소를 입력하세요");
            f.address1.focus();
            return false;
        }
        if(f.address2.value.length==0){
            alert("상세주소를 입력하세요");
            f.address2.focus();
            return false;
        }
        if(f.phone.value.length==0){
            alert("전화번호를 입력하세요");
            f.phone.focus();
            return false;
        }
        if(f.yn.value=='no'){
            alert("등록 여부를 확인해주세요");
            return false;
        }
    }
    </script>

</head>
<body> 

<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">여행지 등록</h1>
<form class="form-horizontal" 
      action="/admin/travelupdate"
      method="post"
      name = 'frm'
      enctype="multipart/form-data"
      onsubmit="return inCheck(this)">

<input type="hidden" name="travelno" value="${dto.travelno}">
<input type="hidden" name="oldfile" value="${param.oldfile}">
<input type="hidden" name="fname" value="${dto.fname}">
  <div class="form-group">
    <label class="control-label col-sm-2" for="travelname">여행지명
    </label>
    <div class="col-sm-8">
      <input type="text" name="travelname" id="travelname" class="form-control" placeholder="음식점명" value="${dto.travelname}">
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="contents">내용</label>
    <div class="col-sm-8">
    <textarea rows="12" cols="7" id="contents" name="contents" class="form-control" placeholder="내용" >${dto.contents}</textarea>
    </div>
  </div>

  <div class="form-group">
    <label class="control-label col-sm-2" for="local">지역</label>
    <div class="col-sm-6">
      <select class="form-control" name="local">
        <option value="0"
        <c:if test= "${local==0}"> 선택 </c:if>
        >지역을 선택해주세요</option>
        <option value="서울시"
        <c:if test= "${local=='서울시'}"> 선택 </c:if>
        >서울시</option>
        <option value="부산광역시"
        <c:if test= "${local=='부산광역시'}"> 선택 </c:if>
        >부산광역시</option>
        <option value="대구광역시"
        <c:if test= "${local=='대구광역시'}"> 선택 </c:if>
        >대구광역시</option>
        <option value="인천광역시"
        <c:if test= "${local=='인천광역시'}"> 선택 </c:if>
        >인천광역시</option>
        <option value="광주광역시"
        <c:if test= "${local=='광주광역시'}"> 선택 </c:if>
        >광주광역시</option>
        <option value="대전광역시"
        <c:if test= "${local=='대전광역시'}"> 선택 </c:if>
        >대전광역시</option>
        <option value="울산광역시"
        <c:if test= "${local=='울산광역시'}"> 선택 </c:if>
        >울산광역시</option>
        <option value="세종시"
        <c:if test= "${local=='세종시'}"> 선택 </c:if>
        >세종시</option>
        <option value="경기남부"
        <c:if test= "${local=='경기남부'}"> 선택 </c:if>
        >경기남부</option>
        <option value="경기북부"
        <c:if test= "${local=='경기북부'}"> 선택 </c:if>
        >경기북부</option>
        <option value="강원도"
        <c:if test= "${local=='강원도'}"> 선택 </c:if>
        >강원도</option>
        <option value="충청북도"
        <c:if test= "${local=='충청북도'}"> 선택 </c:if>
        >충청북도</option>
        <option value="충청남도"
        <c:if test= "${local=='충청남도'}"> 선택 </c:if>
        >충청남도</option>
        <option value="전라북도"
        <c:if test= "${local=='전라북도'}"> 선택 </c:if>
        >전라북도</option>
        <option value="전라남도"
        <c:if test= "${local=='전라남도'}"> 선택 </c:if>
        >전라남도</option>
        <option value="경상북도"
        <c:if test= "${local=='경상북도'}"> 선택 </c:if>
        >경상북도</option>
        <option value="경상남도"
        <c:if test= "${local=='경상남도'}"> 선택 </c:if>
        >경상남도</option>
        <option value="제주도"
        <c:if test= "${local=='제주도'}"> 선택 </c:if>
        >제주도</option>
        
      </select>
      <script type="text/javascript">
    		document.frm.local.value='${dto.local}';
      </script>
    </div>
  </div>

 <div class="form-group">
      <label class="control-label col-sm-2" for="sample6_postcode">우편번호</label>
      <div class="col-sm-2">          
        <input type="text" class="form-control" 
         name="zipcode" id="sample6_postcode" placeholder="우편번호" value="${dto.zipcode}">
      </div>
      
      <button type="button" class="btn col-sm-1" style="width: 120px;height: 35px; margin-top: 0px;"
      onclick="sample6_execDaumPostcode()">주소검색</button>
    
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="sample6_address">주소</label>
    <div class="col-sm-6">          
      <input type="text" class="form-control" id="sample6_address" placeholder="주소" 
       name="address1" value="${dto.address1}">
      <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소" 
       name="address2" value="${dto.address2}">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="phone">전화번호</label>
    <div class="col-sm-6">
      <input type="text" name="phone" id="phone" class="form-control" placeholder="전화번호" value="${dto.phone}">
    </div>
  </div>
  <div class="form-group">
      <label class="control-label col-sm-2" for="oldfile">원본 이미지</label>
      <div class="col-sm-6">
        <img src="/travel/storage/${dto.fname }" 
        class="img-rounded" width="200px" height="200px">
      </div>
    </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="fnameMF">변경 이미지</label>
    <div class="col-sm-6">
      <input type="file" name="fnameMF" id="fnameMF" class="form-control" accept=".jpg,.gif,.png">
    </div>
  </div>
  <div class="form-group">
  <label class="control-label col-sm-2" for="yn">등록 여부</label>
    <div class="col-sm-6">
      <input type="radio" name="yn" value="yes">등록
      <input type="radio" name="yn" value="no"style="margin-left:10px" checked="checked">미등록
    </div>
  </div>
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-8" style="margin-bottom:100px">
    <button type="submit" class="btn"  style="height:40px">등록</button>
    <button type="reset" class="btn" style="height:40px; margin-left:5px" onclick="deleteM()">삭제</button>
    <button type="reset" class="btn" onclick="goBack()" style="height:40px; margin-left:380px">뒤로</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 