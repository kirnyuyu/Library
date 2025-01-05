package com.toy.library.member.model.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.toy.library.member.model.vo.Member;

@Repository
public class MemberRepository {

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public int phoneCheck(SqlSessionTemplate sqlSession, String phone) {
		return sqlSession.selectOne("memberMapper.phoneCheck", phone);
	}

	public int emailCheck(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.emailCheck", email);
	}

	public int insert(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.insert("memberMapper.insert", member);
	}

}
