package com.mycompany.artistar.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.mycompany.artistar.member.model.vo.Member;

public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();

		Member lo = (Member) session.getAttribute("member");

		if (lo == null) { // 로그인 안한 경우
			out.println("<script>alert('잘못된 접근입니다.'); location.href='"+request.getContextPath()+"/';</script>");
			out.flush();			
			return false;
		} else if (lo.getKind() != 'M') { // 관리자 계정 아닌 경우
			out.println("<script>alert('잘못된 접근입니다.'); location.href='"+request.getContextPath()+"/';</script>");
			out.flush();			
			return false;
		}
		return true; 
	}
}
