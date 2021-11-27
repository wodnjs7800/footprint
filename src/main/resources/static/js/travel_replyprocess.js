$(function () {//페이지가 로딩될때
   showList();
   showPage();
});//page loading function end  

let replyUL = $(".chat");
let replyPageFooter = $(".panel-footer");

let param = "nPage=" + nPage;
    param += "&nowPage=" + nowPage;
    param += "&travelno=" + travelno;
    param += "&col=" + colx;
    param += "&word=" + wordx;

const replyService = new ReplyService();

function showList() {
  replyService
    .getList({ travelno: travelno, sno: sno, eno: eno })
    .then(list => {
      let str = ""

      for (var i = 0; i < list.length ; i++) {
        str += "<li class='list-group-item' data-replyno='" + list[i].replyno + "'>";
        str += "<div><div class='header'><strong class='primary-font'>" + list[i].id +" " + "</strong>";
        for (var j =0; j < list[i].point ; j++){
       		str += "<img src='/travel/storage/star.jpg' style='width: 17px; height: 17px; margin-bottom:5px'>";
        }
        str += "("+ list[i].point+"점)";
        str += "<small class='pull-right text-muted'>" + list[i].regdate + "</small></div>";
        str += replaceAll(list[i].content, '\n', '<br>') + "</div></li>";
      }


      replyUL.html(str);
    })

}//showList() end

function replaceAll(str, searchStr, replaceStr) {
  return str.split(searchStr).join(replaceStr);
}

function showPage(){
    replyService
   .getPage(param)
   .then(paging => {
      console.log(paging);
      let str = "<div><small class='text-muted'>" + paging + "</small></div>";

      replyPageFooter.html(str);
	});
}

//let modalInputContent = $(".content");
//let modalInputContent =content.val();

//console.log(modalInputContent.value);

let modal = $(".modal");
let modalInputContent = modal.find("textarea[name='content']");
 
let modalModBtn = $("#modalModBtn");
let modalRemoveBtn = $("#modalRemoveBtn");
let modalRegisterBtn = $("#modalRegisterBtn");
 
$("#modalCloseBtn").on("click", function (e) {
 
  modal.modal('hide');
});
 
 
/*$("#addReplyBtn").on("click", function (e) {
  modalInputContent.val("");
  modal.find("button[id !='modalCloseBtn']").hide();
 
  modalRegisterBtn.show();
 
  $(".modal").modal("show");
 
});*/

modalRegisterBtn.on("click", function (e) {
  console.log($("#content").val());
  var point = $("#point").text();
  
  if(id==''){
	alert("로그인을 해주세요");
	location.href="/member/login";
	}
  if ($("#content").val()== '') {
    alert("댓글을 입력하세요")
    return;
  }
  let reply = {
    content: $("#content").val(),
    id: id,
    travelno: travelno,
    point: point
  };
  //alert(reply.travelno);
  replyService
    .add(reply)
    .then(result => {
 
      //alert(result);
 
     $("#content").val('');
     // modal.modal("hide");
 //
      showList();
      showPage();
 
    }); //end add
 
}); //end modalRegisterBtn.on
 
//댓글 조회 클릭 이벤트 처리 
$(".chat").on("click", "li", function (e) {
 
  let replyno = $(this).data("replyno");
 
  //alert(replyno)
  replyService
    .get(replyno)
    .then(reply => {
      
      modalInputContent.val(reply.content);
      modal.data("replyno", reply.replyno);
 
      modal.find("button[id !='modalCloseBtn']").hide();
 
      modalModBtn.show();
      modalRemoveBtn.show();
      
      modal.modal("show");
 
    });
});

modalModBtn.on("click", function (e) {
 
  let reply = { replyno: modal.data("replyno"), content: modalInputContent.val() };
  //alert(reply.replyno);
  replyService
    .update(reply)
    .then(result => {
 
      //alert(result);
      modal.modal("hide");
      showList();
          showPage();
    });
 
});//modify

//댓글 삭제
modalRemoveBtn.on("click", function (e) {
 
  let replyno = modal.data("replyno");
 
  replyService
    .remove(replyno)
    .then(result => {
 
      //alert(result);
      modal.modal("hide");
      showList();
      showPage();
    });
 
});//remove

// star rating
var starRating = function(){
  var $star = $(".star-input"),
      $result = $star.find("output>b");
  $(document)
    .on("focusin", ".star-input>.input", function(){
    $(this).addClass("focus");
  })
    .on("focusout", ".star-input>.input", function(){
    var $this = $(this);
    setTimeout(function(){
      if($this.find(":focus").length === 0){
        $this.removeClass("focus");
      }
    }, 100);
  })
    .on("change", ".star-input :radio", function(){
    $result.text($(this).next().text());
  })
    .on("mouseover", ".star-input label", function(){
    $result.text($(this).text());
  })
    .on("mouseleave", ".star-input>.input", function(){
    var $checked = $star.find(":checked");
    if($checked.length === 0){
      $result.text("0");
    } else {
      $result.text($checked.next().text());
    }
  });
};
starRating();
