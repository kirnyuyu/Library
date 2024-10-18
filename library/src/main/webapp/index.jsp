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
	    border: 1px solid red;
	}
	
	.content_img{
	    width: 1200px;
	    margin: 0 auto;
	}
	
	.carousel-inner img {
	    width: 100%;
	    height: 100%;
	}
</style>

</head>
<body>

	<jsp:include page="WEB-INF/views/common/header.jsp"/>
	
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
	                    <img src="${ path }/resources/image/la.jpg" alt="Los Angeles" width="1100" height="500">
	                    <div class="carousel-caption">
	                        <h3>Los Angeles</h3>
	                        <p>We had such a great time in LA!</p>
	                    </div>
	                </div>
	
	                <div class="carousel-item">
	                    <img src="${ path }/resources/image/chicago.jpg" alt="Chicago" width="1100" height="500">
	                    <div class="carousel-caption">
	                        <h3>Chicago</h3>
	                        <p>Thank you, Chicago!</p>
	                    </div>
	                </div>
	
	                <div class="carousel-item">
	                    <img src="${ path }/resources/image/ny.jpg" alt="New York" width="1100" height="500">
	                    <div class="carousel-caption">
	                        <h3>New York</h3>
	                        <p>We love the Big Apple!</p>
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
	</div>

	<jsp:include page="WEB-INF/views/common/footer.jsp"/>

</body>
</html>