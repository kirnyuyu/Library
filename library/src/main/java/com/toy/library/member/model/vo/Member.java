package com.toy.library.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Member {
	
	private int userNo;
	private String userName;
	private String userId;
	private String userPwd;
	private String phone;
	private String email;
	private String status;			// A-관리자, C-사용자, D-탈퇴)
	private String enrollDate;		// 가입일
	private String modifyDate;		// 상태 변경일
	private String userContent;		// 블랙리스트 사유 (회원 메모) *추후 삭제?

}
