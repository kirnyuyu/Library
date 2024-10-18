<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#content{
	    width: 1200px;
	    margin: 0 auto;
	    margin-top: 40px;
	    margin-bottom: 40px;
	}
	
	.loginBox{
	    width: 500px;
	    margin: 0 auto;
	    border: 1px solid #c5ccd2;
	    border-radius: 20px;
	}
	
	.loginTitle{
	    font-size: 30px;
	    font-weight: bold;
	    text-align: center;
	    margin-top: 50px;
	    margin-bottom: 50px;
	}
	
	.idBox, .pwdBox, .btnBox{
	    width: 300px;
	    margin: 0 auto;
	}
	
	.pwdBox{
	    margin-top: 30px;
	}
	
	.inputBox{
	    width: 300px;
	}
	
	.inputForm{
	    width: 300px;
	    height: 60px;
	    border: 1px solid #c5ccd2;
	    border-radius: 10px;
	    padding: 0px 15px;
	    font-size: 15px;
	    border: 1px solid #c5ccd2;
	}
	
	.btnSubmit{
	    width: 300px;
	    height: 50px;
	    margin-top: 30px;
	    border: none;
	    border-radius: 10px;
	    color: white;
	    background-color: #67916a;
	    font-size: 15px;
	    font-weight: bold;
	}
	
	.findBox {
	    width: 500px;
	    height: 30px;
	    margin: 0 auto;
	    display: flex;
	    justify-content: center; /* 가로축 가운데 정렬 */
	    align-items: center; /* 세로축 가운데 정렬 (필요 시) */
	    padding: 0;
	    margin-top: 20px;
	    margin-bottom: 60px;
	    font-size: 15px;
	    color: #797979;
	}
	
	.findBox > li {
	    list-style: none;
	    margin-right: 10px; /* 리스트 항목 간의 간격 */
	}
	
	.findBox li::before {
	    content: "|";
	    margin-right: 10px;
	    color: #c5ccd2;
	}
	
	.findBox > li:first-child::before {
	    content: ""; /* 첫 번째 항목의 ::before 없애기 */
	}
</style>

</head>
<body>

    <div id="content">
        <div class="loginBox">
            <div class="loginTitle">로그인</div>
            <form action="#">
                <div class="idBox">
                    <div class="inputBox">
                        <input type="text" class="inputForm" maxlength="15" placeholder="아이디">
                    </div>
                </div>
                <div class="pwdBox">
                    <div class="inputBox">
                        <input type="password" class="inputForm" maxlength="100" placeholder="비밀번호 ">
                    </div>
                </div>
                <div class="btnBox">
                    <button type="submit" class="btnSubmit">로그인</button>
                </div>
            </form>

            <ul class="findBox">
                <li>회원가입</li>
                <li>아이디 찾기</li>
                <li>비밀번호 찾기</li>
            </ul>
        </div>

    </div> <!-- content -->

</body>
</html>