<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마크</title>

<style>
	#content{
	    width: 1200px;
	    margin: 0 auto;
	    margin-top: 40px;
	    margin-bottom: 40px;
	}
	
	.content_img{
	    width: 1200px;
	    margin: 0 auto;
	}
	
	.carousel-inner img {
	    width: 100%;
	    height: 500px;
	}
	
	.carousel-indicators {
		padding-bottom: 10px;
	}
	
	.carousel-caption {
	    width: 400px;
	    margin: 0 auto;
	    background-color: rgba(255, 255, 255, 0.7);
	}
	
	.carousel-caption > h3, .carousel-caption > p {
		color: #000000;
	}
	
	.content_map {
		width: 1200px;
		margin: 0 auto;
		margin-top: 40px;
		margin-bottom: 40px;
		border: 1px solid red;

	}
	
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="content">
	    <div class="content_img">
	        <div id="demo" class="carousel slide" data-ride="carousel">
	            <ul class="carousel-indicators">
	                <li data-target="#demo" data-slide-to="0" class="active"></li>
	                <li data-target="#demo" data-slide-to="1"></li>
	                <li data-target="#demo" data-slide-to="2"></li>
	            </ul>
	
	            <div class="carousel-inner">
	                <div class="carousel-item active">
	                    <img src="${ path }/resources/image/library1.jpg" alt="library" width="1100" height="500">
	                    <div class="carousel-caption">
	                        <h3>서울 도서관</h3>
	                        <p>서울특별시 중구 세종대로 110</p>
	                    </div>
	                </div>
	
	                <div class="carousel-item">
	                    <img src="${ path }/resources/image/library2.jpg" alt="library" width="1100" height="500">
	                    <div class="carousel-caption">
	                        <h3>김근태 기념 도서관</h3>
	                        <p>서울 도봉구 도봉산길 14</p>
	                    </div>
	                </div>
	
	                <div class="carousel-item">
	                    <img src="${ path }/resources/image/library3.jpg" alt="library" width="1100" height="500">
	                    <div class="carousel-caption">
	                        <h3>까망돌 도서관</h3>
	                        <p>서울 동작구 서달로 129</p>
	                    </div>
	                </div>
	            </div>
	
	            <a class="carousel-control-prev" href="#demo" data-slide="prev">
	                <span class="carousel-control-prev-icon"></span>
	            </a>
	            <a class="carousel-control-next" href="#demo" data-slide="next">
	                <span class="carousel-control-next-icon"></span>
	            </a>
	        </div>
	    </div>
	    
	    <div class="content_map">
	    지도들어가는 부분 <br><br><br><br><br><br><br><br><br><br><br><br>
	    
	    </div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>