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
	
	#idCheckResult, #pwdCheckResult{
	    width: 300px;
	    height: 19px;
	    font-size: 13px;
	    margin-top: 5px;
	    margin-bottom: 14px;
	    padding-left: 5px;
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
                    <div class="inputBox"><input type="password" class="inputForm" name="userPwd" maxlength="20" placeholder="비밀번호" required oninput="pwdValidateInput(this)"></div>
                    <div id="pwdCheckResult"></div>
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
	$(function() {
		
		// 변수 선언
	    const $idInput = $('[name="userId"]');
	    const $idCheckResult = $('#idCheckResult');
	    const $pwdInput = $('[name="userPwd"]');
	    const $pwdCheckResult = $('#pwdCheckResult');
	    const $joinSubmit = $('#joinBtn');
	    
	    // 비밀번호 정규 포현식
		const passwordRegex = /^(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,}$/;
	
		// 버튼 기본 비활성화
	    $joinSubmit.prop('disabled', true);
	
	    // 아이디 중복 체크
	    $idInput.on('input', function() {
	        const inputVal = $idInput.val();
	
	        // 특수문자 검사 (영문 소문자, 숫자만 허용)
	        const idInputCheck = /[^a-z0-9]/.test(inputVal);
	
	        if (idInputCheck) {
	            $idCheckResult.show().css('color', 'red').text('영문 소문자, 숫자만 사용 가능합니다.');
	            $joinSubmit.prop('disabled', true).css('background-color', '#797979');
	        } else if (inputVal.length >= 5) {
	            // 5자 이상이고 특수문자가 없는 경우 Ajax 요청
	            $.ajax({
	                url: 'idCheck.member',
	                data: { checkId: inputVal },
	                success: function(result) {
	                    if (result.substr(4) == 'N') {
	                        $idCheckResult.show().css('color', 'red').text('이미 사용중인 아이디입니다.');
	                        $joinSubmit.prop('disabled', true).css('background-color', '#797979');
	                    } else {
	                        $idCheckResult.show().css('color', '#666666').text('사용 가능한 아이디입니다.');
	                        $joinSubmit.prop('disabled', false).css('background-color', '');
	                    }
	                },
	                error: function() {
	                    console.log('아이디 중복 체크 실패');
	                }
	            });
	        } else if (inputVal.length == 0) {
	            $idCheckResult.show().text('');
	            $joinSubmit.prop('disabled', true);
	        } else {
	            $idCheckResult.show().css('color', 'red').text('5자 이상 입력해 주세요.');
	            $joinSubmit.prop('disabled', true);
	        }
	    });
	    
	    // 비밀번호 체크
	    $pwdInput.on('input', function() {
	        const passwordValue = $pwdInput.val(); // 입력된 비밀번호 값
	        
	        if (passwordValue.length < 8) {
	            $pwdCheckResult.show().css('color', 'red').text('비밀번호는 최소 8자 이상이어야 합니다.');
	            $joinSubmit.prop('disabled', true);
	        }
	        else if (!passwordRegex.test(passwordValue)) {
	            $pwdCheckResult.show().css('color', 'red').text('비밀번호는 대문자, 숫자, 특수문자를 포함해야 합니다.');
	            $joinSubmit.prop('disabled', true);
	        }
	        else {
	            $pwdCheckResult.show().text('');
	            $joinSubmit.prop('disabled', false);
	        }
	    });
	    
	    // 생년월일 체크
	    
	    
	    //연락처 체크
	    
	    
	    // 이메일 체크
	    
	    
	}); // 내용 검사 끝
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>