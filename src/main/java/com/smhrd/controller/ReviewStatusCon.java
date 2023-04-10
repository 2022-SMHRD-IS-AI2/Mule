package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.OrderDAO;
import com.smhrd.model.OrderVO;
import com.smhrd.model.UserVO;


public class ReviewStatusCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		
		String u_id=loginUser.getU_id();
		int order_num = Integer.parseInt(request.getParameter("order_num"));
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		
		OrderVO vo = new OrderVO(u_id,order_num);
		int cnt = new OrderDAO().reviewStatusUpdate(vo);
		
		if(cnt>0) {
			System.out.println("리뷰작성여부 업데이트 성공");
			 response.sendRedirect("ProdDetail.jsp?prod_num="+prod_num);
		}else {
			System.out.println("리뷰작성여부 업데이트 실패");
		}
	}

}
