<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	    width: 700px;
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
	    width: 400px;
	    margin: 0 auto;
	}
	
	.inputBox{
	    width: 400px;
	}
	
	.inputForm{
	    width: 400px;
	    height: 60px;
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
	    width: 400px;
	    height: 60px;
	    border: none;
	    border-radius: 10px;
	    color: white;
	    background-color: #67916a;
	    font-size: 15px;
	    font-weight: bold;
	}
	
	#idCheckResult, #pwdCheckResult, #nameCheckResult, #birthCheckResult, #phoneCheckResult, #emailCheckResult{
	    width: 400px;
	    height: 19px;
	    font-size: 13px;
	    margin-top: 5px;
	    margin-bottom: 20px;
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
            <form action="insert.member" method="post">

                <!-- 아이디 -->
                <div class="idBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="userId" maxlength="15" placeholder="아이디" required></div>
                    <div id="idCheckResult"></div>
                </div>

                <!-- 비밀번호 -->
                <div class="pwdBox">
                    <div class="inputBox"><input type="password" class="inputForm" name="userPwd" maxlength="20" placeholder="비밀번호" required></div>
                    <div id="pwdCheckResult"></div>
                </div>
                <!-- 이름 -->
                <div class="nameBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="userName" maxlength="20" placeholder="이름" required></div>
                    <div id="nameCheckResult"></div>
                </div>

                <!-- 생년월일 -->
                <div class="birthdayBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="birthday" minlength="8" maxlength="8" placeholder="생년월일 (8자리)" required></div>
                    <div id="birthCheckResult"></div>
                </div>

                <!-- 연락처 -->
                <div class="phoneBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="phone" minlength="10" maxlength="11" placeholder="연락처 ( - 제외 입력)" required></div>
                    <div id="phoneCheckResult"></div>
                </div>

                <!-- 이메일 -->
                <div class="emailBox">
                    <div class="inputBox"><input type="text" class="inputForm" name="email" maxlength="100" placeholder="이메일" required></div>
                    <div id="emailCheckResult"></div>
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
	    const $nameInput = $('[name="userName"]');
	    const $nameCheckResult = $('#nameCheckResult');
	    const $birthInput = $('[name="birthday"]');
	    const $birthCheckResult = $('#birthCheckResult');
	    const $phoneInput = $('[name="phone"]');
	    const $phoneCheckResult = $('#phoneCheckResult');
	    const $emailInput = $('[name="email"]');
	    const $emailCheckResult = $('#emailCheckResult');
	    
	    const $joinSubmit = $('#joinBtn');
	    
	    // 정규 표현식
		const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$^*])[a-zA-Z\d!@#$^*]{8,}$/;
		const nameRegex = /^[가-힣]{1,4}$/;
		const birthRegex = /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;
		const phoneRegex = /^(010\d{8}|01[6-9]\d{7})$/;
		const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	
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
	            $joinSubmit.prop('disabled', true).css('background-color', '#797979');
	        } else {
	            $idCheckResult.show().css('color', 'red').text('5자 이상 입력해 주세요.');
	            $joinSubmit.prop('disabled', true).css('background-color', '#797979');
	        }
	    });
	    
	    // 비밀번호 체크
	    $pwdInput.on('input', function() {
	        const passwordValue = $pwdInput.val(); // 입력된 비밀번호 값
	        
	        if (passwordValue.length < 8) {
	            $pwdCheckResult.show().css('color', 'red').text('비밀번호는 최소 8자 이상이어야 합니다.');
	            $joinSubmit.prop('disabled', true).css('background-color', '#797979');
	        }
	        else if (!passwordRegex.test(passwordValue)) {
	            $pwdCheckResult.show().css('color', 'red').text('하나 이상의 대문자, 숫자, 특수문자(!@#$%^&*)를 포함해야 합니다.');
	            $joinSubmit.prop('disabled', true).css('background-color', '#797979');
	        }
	        else {
	            $pwdCheckResult.show().css('color', '#666666').text('사용 가능한 비밀번호 입니다.');
	            $joinSubmit.prop('disabled', false).css('background-color', '');
	        }
	    });
	    
	    // 이름 체크
	    $nameInput.on('input', function(){
	    	const nameValue = $nameInput.val();
	    	
	    	if(nameValue.length < 2) {
	    		$nameCheckResult.show().css('color', 'red').text('이름은 최소 2자 이상이어야 합니다.');
	    		$joinSubmit.prop('disabled', true).css('background-color', '#797979');
	    	}
	    	else if (!nameRegex.test(nameValue)) {
	    		$nameCheckResult.show().css('color', 'red').text('한글 이름만 입력해 주세요.');
	    		$joinSubmit.prop('disabled', true).css('background-color', '#797979');
	    	}
	    	else {
	    		$nameCheckResult.show().css('color', '#666666').text('');
	    		$joinSubmit.prop('disabled', false).css('background-color', '');
	    	}
	    });
	    
	    // 생년월일 체크
	    $birthInput.on('input', function(){
	    	const birthValue = $birthInput.val();
	    	
	    	if(birthValue.length < 8) {
	    		$birthCheckResult.show().css('color', 'red').text('생년월일은 8자로 입력해 주세요.');
	    		$joinSubmit.prop('disabled', true).css('background-color', '#797979');
	    	}
	    	else if (!/^\d{8}$/.test(birthValue)) {
	    		$birthCheckResult.show().css('color', 'red').text('숫자만 입력해 주세요.');
	    		$joinSubmit.prop('disabled', true).css('background-color', '#797979');
	    	}
	    	else if (!birthRegex.test(birthValue)) {
	    		$birthCheckResult.show().css('color', 'red').text('유효한 생년월일을 입력해 주세요.');
	    		$joinSubmit.prop('disabled', true).css('background-color', '#797979');
	    	}
	    	else {
	    		$birthCheckResult.show().css('color', '#666666').text('');
	    		$joinSubmit.prop('disabled', false).css('background-color', '');
	    	}
	    });
	    
		// 연락처 체크
		$phoneInput.on('input', function() {
		    const phoneValue = $phoneInput.val();

		    if (!phoneRegex.test(phoneValue)) {
		        $phoneCheckResult.show().css('color', 'red').text('유효한 연락처를 입력해 주세요.');
		        $joinSubmit.prop('disabled', true).css('background-color', '#797979');
		        return;
		    }
		    $.ajax({
		        url: 'phoneCheck.member',
		        data: { phone: phoneValue },
		        success: function(result) {
		            if (result.substr(4) === 'N') {  // 이미 사용 중인 연락처
		                $phoneCheckResult.show().css('color', 'red').text('이미 사용중인 연락처입니다.');
		                $joinSubmit.prop('disabled', true).css('background-color', '#797979');
		            } else {
		                $phoneCheckResult.show().css('color', '#666666').text('');
		                $joinSubmit.prop('disabled', false).css('background-color', '');
		            }
		        },
		        error: function() {
		            console.log('연락처 중복 체크 실패');
		        }
		    });
		});
	    
	    // 이메일 체크
	    $emailInput.on('input', function(){
	    	const emailValue = $emailInput.val();
	    	
	    	if(!emailRegex.test(emailValue)) {
	    		$emailCheckResult.show().css('color', 'red').text('유효한 이메일 주소를 입력해 주세요.');
	    		$joinSubmit.prop('disabled', true).css('background-color', '#797979');
	    		return;
	    	}
	    	$.ajax({
	    		url: 'emailCheck.member',
	    		data: { email : emailValue },
	    		success: function(result) {
	    			if (result.substr(4) === 'N') {
	    				$emailCheckResult.show().css('color', 'red').text('이미 사용중인 이메일입니다.');
	    				$joinSubmit.prop('disabled', true).css('background-color', '#797979');
	    			} else {
	    		    		$emailCheckResult.show().css('color', '#666666').text('');
	    		    		$joinSubmit.prop('disabled', false).css('background-color', '');
	    		    }
	    		}
	    	})
	    });
	});
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>