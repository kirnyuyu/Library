<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style>
	#footer{
	    width: 100%;
	    height: 300px;
	    background-color: #464646;
	}
	
	.footer_box{
	    width: 1200px;
	    margin: 0 auto;
	    color: white;
	}
	
	.footer_top {
	    display: flex;
	    padding: 20px 0px; /* 하단 여백 */
	    border-bottom: 1px solid #797979;
	}
	
	.footer_top1, .footer_top2 {
	    color: white;
	}
	
	.footer_top1::after {
	    content: " | "; /* 항목 사이에 표시할 기호 */
	    color: gray; /* 기호 색상 */
	    padding: 0 10px;
	}
	
	.footer_top2 {
	    margin-left: 0; /* 첫 번째 항목 뒤에 기호가 오지 않도록 설정 */
	}
	
	.footer_content {
	    padding: 10px 0; /* 상하 여백 */
	}
	
	.footer_p {
	    margin: 0; /* 기본 여백 제거 */
	}
</style>
</head>
<body>

    <div id="footer">
        <div class="footer_box">
            <div class="footer_top">
                <div class="footer_top1">이용약관</div>
                <div class="footer_top2">개인정보처리방침</div>
            </div>
            <div class="footer_content">
                <p class="footer_p"> Copyright © 2024 Seoul-BookMark. All rights reserved.</p>
            </div>
        </div>
    </div> <!-- footer -->

</body>
</html>