package com.mycompany.artistar.common.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.mycompany.artistar.member.model.vo.Member;

public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();

		Member lo = (Member) session.getAttribute("member");

		if (lo == null) { // 로그인 안한 경우
			ModelAndView mv = new ModelAndView("common/alert");
			mv.addObject("msg", "잘못된 접근입니다.");
			mv.addObject("loc", request.getContextPath()+"/");
			mv.addObject("result", "1");
			System.out.println("contextPath는 : " + request.getContextPath());
			throw new ModelAndViewDefiningException(mv);
		} else if (lo.getKind() != 'M') { // 관리자 계정 아닌 경우
			ModelAndView mv = new ModelAndView("common/alert");
			mv.addObject("msg", "잘못된 접근입니다.");
			mv.addObject("loc", request.getContextPath()+"/post/postlist");
			mv.addObject("result", "1");
			throw new ModelAndViewDefiningException(mv);
		}
		return true; 
	}
}
