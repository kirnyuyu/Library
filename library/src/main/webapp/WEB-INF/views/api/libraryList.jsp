<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울시 도서관 목록</title>

<style>
	#content{
	    width: 1200px;
	    margin: 0 auto;
	    margin-top: 60px;
	    margin-bottom: 120px;
	    font-size: 15px;
	}
	
	#apiInput{
		width: 300px;
		height: 30px;
		border-radius: 7px;
		border: 1px solid #a4a4a4;
		font-size: 12px;
	}
	
	#apiBtn{
		width: 60px;
	}
	
	/* 페이지네이션 스타일 */
	.pagination {
		text-align: center;
	}
	.page-link {
		padding: 5px 10px;
		text-decoration: none;
		margin: 0 5px;
		border: 1px solid #ddd;
		border-radius: 3px;
	}
	.current-page {
		padding: 5px 10px;
		border: 1px solid #ddd;
		background-color: #007bff;
		color: white;
		border-radius: 3px;
	}
</style>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div id="content">
        <h2>서울시 도서관 목록</h2>

        <table class="table table-hover">
            <thead class="table-info">
                <tr>
                    <th width="70px">구명</th>
                    <th width="160px">도서관명</th>
                    <th width="250px">주소</th>
                    <th width="80px">정기 휴관일</th>
                    <th width="170px">전화번호</th>
                </tr>
            </thead>
            <tbody>
                <!-- 도서관 목록을 반복해서 출력 -->
				<c:forEach var="library" items="${libraries}">
				    <tr>
				        <!-- VO 필드에 맞게 수정 -->
				        <td>${library.lbrryName}</td>  <!-- 도서관명 -->
				        <td>${library.lbrryName}</td>  <!-- 도서관명 -->
				        <td>${library.adres}</td>      <!-- 주소 -->
				        <td>${library.closeDate}</td>  <!-- 정기 휴관일 -->
				        <td>${library.telNo}</td>      <!-- 전화번호 -->
				    </tr>
				</c:forEach>
            </tbody>
        </table>

		<!-- 페이지네이션 -->
		<div class="pagination">
		    <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
		        <c:choose>
		            <c:when test="${i == pageInfo.currentPage}">
		                <span class="current-page">${i}</span>  <!-- 현재 페이지 강조 -->
		            </c:when>
		            <c:otherwise>
		                <a href="/library/list?page=${i}" class="page-link">${i}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		
		    <!-- 이전 페이지 링크 -->
		    <c:if test="${pageInfo.startPage > 1}">
		        <a href="/library/list?page=${pageInfo.startPage - 1}" class="page-link">Previous</a>
		    </c:if>
		
		    <!-- 다음 페이지 링크 -->
		    <c:if test="${pageInfo.endPage < pageInfo.maxPage}">
		        <a href="/library/list?page=${pageInfo.endPage + 1}" class="page-link">Next</a>
		    </c:if>
		</div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

<script>
	$(document).ready(function() {
	    $(".page-link").click(function(e) {
	        // 기본 동작인 링크 이동을 허용하여 페이지가 새로고침 되도록 함
	        var page = $(this).text();  // 클릭한 페이지 번호
	        window.location.href = "/library/list?page=" + page;  // 페이지를 새로 로드
	    });
	});
</script>

</html>
