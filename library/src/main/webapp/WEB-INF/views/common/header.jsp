<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script> 
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
	* {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    font-family: "Noto Sans KR", sans-serif;
	}
	
	#header_top{
	    width: 100%;
	    height: 65px;
	    border-bottom: 1px solid #dbdbdb;
	}
	
	#header{
	    width: 100%;
	    height: 150px;
	    border-bottom: 1px solid #dbdbdb;
	}
	
	.header_info{
	    width: 1200px;
	    height: 65px;
	    margin: 0 auto;
	    text-align: right;
	}
	
	.menubar_info{
	    width: auto;
	    float: right;
	    list-style: none;
	    padding: 20px 0;
	    font-size: 14px;
	}
	
	.header_box{
	    width: 1200px;
	    height: 130px;
	    margin: 0 auto;
	    text-align: center;
	}
	
	.logo{
	    width: 200px;
	    height: 130px;
	    float: left;
	    font-size: 30px;
	    font-weight: bold;
	    padding-top: 50px;
	    color: #67916a;
	    text-align: center;
	}
	
	.logo > a{
	    text-decoration: none;
	    color: #67916a;
	}
	
	.menubar{
	    width: 1000px;
	    height: 130px;
	    list-style: none;
	    float: left;
	    line-height: 120px;
	    font-size: 16px;
	    font-weight: bold;
	    margin-bottom: 0px;
	}
	
	.menu{
	    width: 150px;
	    float: left;
	    margin-left: 65px;
	    margin-right: 15px;
	}
	
	.menu_5{
	    width: 140px;
	    float: left;
	    margin-left: 0px;
	    margin-right: 0px;
	}
	
	.menu_info{
	    float: left;
	    margin-right: 20px;
	    color: #464646;
	}
	
	.menu_info > a{
	    text-decoration: none;
	    color: #464646;
	}
</style>

</head>
<body>

	<c:set var="path" value="${ pageContext.request.contextPath }" scope="session"/>
	
    <div id="header_top">
        <div class="header_info">
            <ul class="menubar_info">
                <li class="menu_info"><a href="${path}/login">로그인</a></li>
                <li class="menu_info"><a href="${path}/join">회원가입</a></li>
                <li class="menu_info"><a href="${path}/myPage">마이페이지</a></li>
                <li class="menu_info"><a href="${path}/admin">관리자</a></li>
            </ul>
        </div>
    </div>
    <div id="header">
        <div class="header_box">
            <div class="logo"><a href="${ path }">서울 북마크</a></div>
            <ul class="menubar">
                <li class="menu">자료검색</li>
                <li class="menu">서울시 도서관</li>
                <li class="menu">고객센터</li>
                <li class="menu">나의 북마크</li>
            </ul>
        </div>

    </div> <!-- header -->
</body>
</html>