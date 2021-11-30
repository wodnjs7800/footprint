var stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    $("#send").prop("disabled", !connected);
    if (connected) {
		$("#communicate").append("<div class='box' style='background-color:white;float: left;'><span>안녕하세요. 네이버 AI 챗봇 서비스입니다. 궁금한 내용을 입력해주세요</span></div><br><br><br>");
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#msg").html("");
}

function connect() {
    var socket = new SockJS('/ws');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/topic/public', function (message) {
            showMessage_receive(message.body); // 서버에 메시지 전달 후 리턴받는 메시지
        });
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendMessage() {
    let message = $("#msg").val()
    showMessage_send(message);
    stompClient.send("/app/sendMessage", {}, JSON.stringify(message)); // 서버에 보낼 메시지
}

function showMessage_send(message) {
	
    $("#communicate").append("<div class='box' style='background-color:yellow;float: right;'><span>" + message + "</span></div><br><br>");
    $("#communicate").append("<small style='float: right; margin-right:13px'><span>" + Clock() + "</span></small><br>");
    
}

function showMessage_receive(message) {
    $("#communicate").append("<div class='box' style='background-color:white;float: left;'><span>" + message + "</span></div><br><br><br><br>");
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendMessage();
    								$("#msg").val(""); });
});

function Clock(){
	var today = new Date();
	var currentTime;
	currentTime = today.getFullYear()+ "-" + (today.getMonth()+1)+ "-" + today.getDate();
	if(today.getHours()>12){
		currentTime += " 오후 "+(today.getHours()-12);
	}else{
		currentTime += " 오전 "+today.getHours();
	}
	if(today.getMinutes()>9){
	currentTime += ":"+today.getMinutes();
	}
	else{
		currentTime += ":0"+today.getMinutes();
	}
	return currentTime;
}