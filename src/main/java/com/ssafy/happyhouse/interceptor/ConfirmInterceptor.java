package com.ssafy.happyhouse.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ssafy.happyhouse.model.dto.Member;

@Component
public class ConfirmInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member memberDto = (Member) session.getAttribute("userinfo");
		if(memberDto == null) {
			System.out.println("null");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인이 필요한 서비스입니다'); location.href='/'; </script>");
			//response.sendRedirect(request.getContextPath() + "/");

			return false;
		}
		return true;
	}

	
	
}
