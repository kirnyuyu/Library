package com.toy.library.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.toy.library.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("join")
	public String join() {
		return "member/join";
	}

}
