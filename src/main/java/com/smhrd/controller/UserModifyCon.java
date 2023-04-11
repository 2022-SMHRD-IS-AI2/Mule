package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.OrderVO;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.UserDAO;
import com.smhrd.model.UserVO;


public class UserModifyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 

		String u_id = loginUser.getU_id();
		String u_addr = request.getParameter("addr");
		String u_pw = request.getParameter("pw");
		
		System.out.println(u_addr);
		System.out.println(u_pw);
		
		UserVO vo = new UserVO(u_id,u_pw,u_addr);
		int cnt = new UserDAO().userModify(vo);
		
		if(cnt>0) {
			System.out.println("회원 정보수정 성공");
			response.sendRedirect("Main.jsp");
		}else {
			System.out.println("회원 정보수정 실패");
			
		}
		
		
	}

}
