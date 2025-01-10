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
	
	.list_title{
		width: 1200px;
		margin: 0 auto;
		font-size: 30px;
		font-weight: bold;
		text-align: center;
		margin-bottom: 30px;
	}
	
	.list_search {
		width: 1200px;
		height: 40px;
		margin: 0 auto;
		margin-bottom: 30px;
	}
	
	.list_form {
		width: 300px;
		margin: 0 auto;
	}
	
	.searchGu {
		width: 200px;
		height: 40px;
		margin: 0 auto;
		margin-right: 10px;
		padding-left: 10px;
		border: 1px solid #CCCCCC;
		border-radius: 10px;
	}
	
	.search_btn {
		width: 80px;
		height: 40px;
		border: none;
		border-radius: 10px;
		font-size: 15px;
		font-weight: bold;
		color: #FFFFFF;
		background-color: #67916A;
	}
	
	select:focus {
	    border: 1px solid #CCCCCC;
	    outline: #CCCCCC;
	}
	
	#apiInput{
		width: 300px;
		height: 30px;
		border-radius: 7px;
		border: 1px solid #A4A4A4;
		font-size: 12px;
	}
	
	#apiBtn{
		width: 60px;
	}
	
	.table_thead {
		height: 40px;
	 	line-height: 40px;
	 	background-color: #67916A;
	 	font-size: 16px;
	 	color: #FFFFFF;
	}
	
	.th_codeValue {
		width: 80px;
	}
	
	.th_lbrryName {
		width: 200px;
	}
	
	.th_adres {
		width: 450px;
	}
	
	.th_closeDate {
		width: 280px;
	}
	
	.th_telNo {
		width: 150px;
	}
	
    /* 페이징바 */
    .hdmy-board_page{
    	width: 1200px;
    }
    
     .pagination {
     	width:fit-content;
     	margin: 0 auto;
     	margin-top: 40px;
     	margin-bottom: 40px;
     }
     
     .page-item.active .page-link {
     	background-color: #67916A !important;
     	border: 1px solid #67916A !important;
     	color: #FFFFFF !important;
     	font-weight: bold;
     	border-radius: 10px;
	    pointer-events: none;
	    cursor: not-allowed;
     }
     
     .page-link {
     	color: #292929 !important;
     	font-weight: bold;
     	border-radius: 10px;
     	margin-right: 10px;
     }
     
     .page-item:last-child .page-link, .page-item:first-child .page-link {
     	border-radius: 10px !important;
     }
     
</style>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div id="content">
        <div class="list_title">
        	<a>서울시 도서관</a>
        </div>
        
        <div class="list_search">
        	<form action="/library/list/search" method="GET" class="list_form">
			    <input type="hidden" name="page" value="1">
        		<select class="searchGu" name="searchGu">
        			<option value="전체">전체</option>
        			<option value="강남구">강남구</option>
        			<option value="강동구">강동구</option>
        			<option value="강북구">강북구</option>
        			<option value="강서구">강서구</option>
        			<option value="관악구">관악구</option>
        			<option value="광진구">광진구</option>
        			<option value="구로구">구로구</option>
        			<option value="금천구">금천구</option>
        			<option value="노원구">노원구</option>
        			<option value="도봉구">도봉구</option>
        			<option value="동대문구">동대문구</option>
        			<option value="동작구">동작구</option>
        			<option value="마포구">마포구</option>
        			<option value="서대문구">서대문구</option>
        			<option value="서초구">서초구</option>
        			<option value="성동구">성동구</option>
        			<option value="성북구">성북구</option>
        			<option value="송파구">송파구</option>
        			<option value="양천구">양천구</option>
        			<option value="영등포구">영등포구</option>
        			<option value="용산구">용산구</option>
        			<option value="은평구">은평구</option>
        			<option value="종로구">종로구</option>
        			<option value="중구">중구</option>
        			<option value="중랑구">중랑구</option>
        		</select>
        		
        		<button type="submit" class="search_btn">검색</button>
        	</form>
        </div>
		
        <table class="table table-hover">
            <thead class="table_thead">
                <tr>
                    <th class="th_codeValue">&nbsp;구명</th>
                    <th class="th_lbrryName">도서관명</th>
                    <th class="th_adres">주소</th>
                    <th class="th_closeDate">정기 휴관일</th>
                    <th class="th_telNo">전화번호</th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
            	<c:when test="${empty searchGu}">
					<c:forEach var="library" items="${library}">
					    <tr>
					        <td>${library.codeValue}</td>
					        <td>${library.lbrryName}</td>
					        <td>${library.adres}</td>
					        <td>${library.closeDate}</td>
					        <td>${library.telNo}</td>
					    </tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="searchLibrary" items="${searchLibrary}">
					    <tr>
					        <td>${searchLibrary.codeValue}</td>
					        <td>${searchLibrary.lbrryName}</td>
					        <td>${searchLibrary.adres}</td>
					        <td>${searchLibrary.closeDate}</td>
					        <td>${searchLibrary.telNo}</td>
					    </tr>
					</c:forEach>
				
				</c:otherwise>
			</c:choose>
            </tbody>
        </table>

		<!-- 페이지네이션 -->
        <div class="hdmy-board_page" id="pagination">
			<ul class="pagination">
			<c:choose>
				<c:when test="${empty searchGu}">
				    <c:if test="${pageInfo.startPage > 1}">
				         <li class="page-item"><a href="/library/list?page=${pageInfo.startPage - 1}" class="page-link"> < </a></li>
				    </c:if>
				    
				    <c:forEach var="p" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
				        <c:choose>
				            <c:when test="${p eq pageInfo.currentPage}">
				                <li class="page-item active"><a class="page-link">${p}</a></li>
				            </c:when>
				            <c:otherwise>
				                <li class="page-item"><a href="/library/list?page=${p}" class="page-link">${p}</a></li>
				            </c:otherwise>
				        </c:choose>
				    </c:forEach>
		
				    <c:if test="${pageInfo.endPage < pageInfo.maxPage}">
				        <li><a href="/library/list?page=${pageInfo.endPage + 1}" class="page-link"> > </a></li>
				    </c:if>
			    </c:when>
			    
				<c:otherwise>
					<c:if test="${pageInfo.startPage > 1}">
				         <li class="page-item"><a href="/library/list?page=${pageInfo.startPage - 1}&searchGu=${searchGu}" class="page-link"> < </a></li>
				    </c:if>
				    
				    <c:forEach var="p" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
				        <c:choose>
				            <c:when test="${p eq pageInfo.currentPage}">
				                <li class="page-item active"><a class="page-link">${p}</a></li>
				            </c:when>
				            <c:otherwise>
				                <li class="page-item"><a href="/library/list?page=${p}&searchGu=${searchGu}" class="page-link">${p}</a></li>
				            </c:otherwise>
				        </c:choose>
				    </c:forEach>
		
				    <c:if test="${pageInfo.endPage < pageInfo.maxPage}">
				        <li><a href="/library/list?page=${pageInfo.endPage + 1}&searchGu=${searchGu}" class="page-link"> > </a></li>
				    </c:if>
				</c:otherwise>			    
		    </c:choose>
		    </ul>
		</div>
	</div>
	
	
	
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

<script>
	$(document).ready(function() {
	    $(".page-link").click(function(e) {
	        var page = $(this).text();
	        window.location.href = "/library/list?page=" + page;
	    });
	});
</script>

</html>
