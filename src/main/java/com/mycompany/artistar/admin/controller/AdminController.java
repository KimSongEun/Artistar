package com.mycompany.artistar.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	// 관리자 메인페이지 이동  // 임시
	@RequestMapping(value = "adminmain")
	public String adminmain() {
		System.out.println("adminmain 페이지 진입");
		return "admin/adminmain";
	}
}
