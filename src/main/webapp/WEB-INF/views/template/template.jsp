<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags
    <meta name="description" content="Want to start your travel agency online and need website for your travel business? Start with travel agency responsive website template. Its absolutely free.">
    <meta name="keywords" content="travel, tour, tourism, honeymoon pacakage, summer trip, exotic vacation, destination, international, domestic website template, holiday, travel agecny responsive website template">
    <title>Tour and Travel Agency - Responsive Website Template</title>
    Bootstrap
    <link href="css/bootstrap.min.css" rel="stylesheet">
    Style CSS
    <link href="css/style.css" rel="stylesheet">
    Google Fonts
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    FontAwesome CSS
    <link href="css/font-awesome.min.css" rel="stylesheet"> -->
</head>
<body>
 
<!-- 상단 메뉴 -->
<tiles:insertAttribute name="header"/>
<!-- 상단 메뉴 끝 -->
 
<!-- 내용 시작 -->
<tiles:insertAttribute name="body"/>
<!-- 내용 끝 -->

<!-- 하단 메뉴 -->
<tiles:insertAttribute name="bottom"/>
<!-- 하단 메뉴 끝 -->
 
</body>
</html>