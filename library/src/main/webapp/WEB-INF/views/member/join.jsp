<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울 북마크 :: 회원가입</title>

<style>
	#content{
	    width: 1200px;
	    margin: 0 auto;
	    margin-top: 60px;
	    margin-bottom: 60px;
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
	
	.idBox, .pwdBox, .btnBox, .nameBox, .birthdayBox, .phoneBox, .emailBox{
	    width: 300px;
	    margin: 0 auto;
	}
	
	.inputBox{
	    width: 300px;
	}
	
	.inputForm{
	    width: 300px;
	    height: 45px;
	    border: 1px solid #c5ccd2;
	    border-radius: 10px;
	    padding: 0px 15px;
	    font-size: 15px;
	    border: 1px solid #c5ccd2;
	}
	
	.btnBox{
	    margin-bottom: 60px;
	}
	
	#joinBtn{
	    width: 300px;
	    height: 50px;
	    border: none;
	    border-radius: 10px;
	    color: white;
	    background-color: #67916a;
	    font-size: 15px;
	    font-weight: bold;
	}
	
	#idCheckResult{
	    width: 300px;
	    height: 19px;
	    font-size: 13px;
	    margin-top: 5px;
	    margin-bottom: 14px;
	    padding-left: 10px;
	    color: red;
	    display: block;
	}
</style>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div id="content">
        <div class="loginBox">
            <div class="loginTitle">회원가입</div>
            <form action="#">

                <!-- 아이디 -->
                <div class="idBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="userId" maxlength="15" placeholder="아이디" required oninput="idValidateInput(this)"></div>
                    <div id="idCheckResult"></div>
                </div>

                <!-- 비밀번호 -->
                <div class="pwdBox">
                    <div class="inputBox"><input type="password" class="inputForm" name="userPwd" maxlength="100" placeholder="비밀번호" required></div>
                    <div id="idCheckResult"></div>
                </div>
                <!-- 이름 -->
                <div class="nameBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="userName" minlength="2" maxlength="10" placeholder="이름" required></div>
                    <div id="idCheckResult"></div>
                </div>

                <!-- 생년월일 -->
                <div class="birthdayBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="birthday" minlength="8" maxlength="8" placeholder="생년월일 (8자리)" required></div>
                    <div id="idCheckResult"></div>
                </div>

                <!-- 연락처 -->
                <div class="phoneBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="phone" minlength="11" maxlength="11" placeholder="연락처 ( - 제외 입력)" required></div>
                    <div id="idCheckResult"></div>
                </div>

                <!-- 이메일 -->
                <div class="emailBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="email" maxlength="100" placeholder="이메일" required></div>
                    <div id="idCheckResult">중복 된 이메일입니다.</div>
                </div>
                <div class="btnBox">
                    <button type="submit" id="joinBtn">회원가입</button>
                </div>
            </form>
        </div>

    </div> <!-- content -->
    
	<script>
	function idValidateInput(input) {
	    input.value = input.value.toLowerCase().replace(/[^a-z0-9]/g, '');
	}
	
	$(function() {
	    const $idInput = $('[name="userId"]');
	    const $idCheckResult = $('#idCheckResult');
	    const $joinSubmit = $('#joinBtn');
	
	    $joinSubmit.attr('disabled', true);
	
	    $idInput.keyup(function() {
	        const inputVal = $idInput.val();
	
	        if (inputVal.length >= 5) {
	            $.ajax({
	                url: 'idCheck.member',
	                data: { checkId: inputVal },
	                success: function(result) {
	                    if (result.substr(4) == 'N') {
	                        $idCheckResult.show().css('color', 'red').text('이미 사용중인 아이디 입니다.');
	                        $joinSubmit.attr('disabled', true).css('background-color', '#797979');
	                    } else {
	                        $idCheckResult.show().css('color', '#666666').text('사용 가능한 아이디 입니다.');
	                        $joinSubmit.attr('disabled', false).css('background-color', ''); // 활성화
	                    }
	                },
	                error: function() {
	                    console.log('아이디 중복 체크 실패');
	                }
	            });
	        } else if (inputVal.length == 0) {
	        	$idCheckResult.show().text('');
	        	$joinSubmit.attr('disabled', true);
	        } else {
	        	$idCheckResult.show().css('color', 'red').text('5자 이상 입력해 주세요.');
	            $joinSubmit.attr('disabled', true);
	        }
	    });
	});
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>