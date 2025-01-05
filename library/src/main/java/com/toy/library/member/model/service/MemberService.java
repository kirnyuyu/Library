package com.toy.library.member.model.service;

import com.toy.library.member.model.vo.Member;

public interface MemberService {

	int idCheck(String checkId);

	int phoneCheck(String phone);

	int emailCheck(String email);

	int insert(Member member);

}
