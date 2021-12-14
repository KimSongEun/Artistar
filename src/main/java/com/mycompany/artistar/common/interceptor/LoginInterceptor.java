package com.mycompany.artistar.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.mycompany.artistar.member.model.vo.Member;

public class LoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("LoginInterceptor preHandle 작동");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		// session.invalidate();

		Member lo = (Member) session.getAttribute("member");
		if (lo == null) {
			out.println("<script>alert('로그인 후 이용해주세요.'); location.href='"+request.getContextPath()+"/';</script>");
			out.flush();
			return false;
		}
		return true;
	}
}
