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
		margin-bottom: 60px;
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
				<c:forEach var="library" items="${libraries}">
				    <tr>
				        <td>${library.codeValue}</td>
				        <td>${library.lbrryName}</td>
				        <td>${library.adres}</td>
				        <td>${library.closeDate}</td>
				        <td>${library.telNo}</td>
				    </tr>
				</c:forEach>
            </tbody>
        </table>

		<!-- 페이지네이션 -->
        <div class="hdmy-board_page" id="pagination">
			<ul class="pagination">
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
