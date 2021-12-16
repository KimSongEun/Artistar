package com.mycompany.artistar.common.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.mycompany.artistar.member.model.vo.Member;

public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("LoginInterceptor preHandle 작동");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		// session.invalidate();

		Member lo = (Member) session.getAttribute("member");
		if (lo == null) {
			ModelAndView mv = new ModelAndView("common/alert");
			mv.addObject("msg", "로그인 후 이용해주세요.");
			mv.addObject("loc", request.getContextPath()+"/");
			mv.addObject("result", "1");
			
			System.out.println("테스트 : " + request.getContextPath());
			throw new ModelAndViewDefiningException(mv);
		}
		return true;
	}
}
