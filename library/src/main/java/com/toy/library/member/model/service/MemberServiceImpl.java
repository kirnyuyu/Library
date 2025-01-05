package com.toy.library.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toy.library.member.model.repository.MemberRepository;
import com.toy.library.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int idCheck(String checkId) {
		return memberRepository.idCheck(sqlSession, checkId);
	}

	@Override
	public int phoneCheck(String phone) {
		return memberRepository.phoneCheck(sqlSession, phone);
	}

	@Override
	public int emailCheck(String email) {
		return memberRepository.emailCheck(sqlSession, email);
	}

	@Override
	public int insert(Member member) {
		return memberRepository.insert(sqlSession, member);
	}

}
