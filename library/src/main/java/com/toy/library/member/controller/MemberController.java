package com.toy.library.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.toy.library.member.model.service.MemberService;
import com.toy.library.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("join")
	public String join() {
		return "member/join";
	}
	
	@ResponseBody
	@GetMapping("idCheck.member")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@GetMapping("phoneCheck.member")
	public String phoneCheck(String phone) {
		int count = memberService.phoneCheck(phone);
		return memberService.phoneCheck(phone) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@ResponseBody
	@GetMapping("emailCheck.member")
	public String emailCheck(String email) {
		int count = memberService.emailCheck(email);
		return memberService.emailCheck(email) > 0 ? "NNNNN" : "NNNNY";
	}
	
	@PostMapping("insert.member")
	public ModelAndView insertMember(Member member, ModelAndView mv, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(member.getUserPwd());
		member.setUserPwd(encPwd);
		
		if (memberService.insert(member) > 0) {
	        session.setAttribute("alertMsg", "회원가입 성공! 반갑습니다!");
	        mv.setViewName("redirect:/");
	    }
		return mv;
	}

}
