package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.OrderDAO;
import com.smhrd.model.OrderVO;
import com.smhrd.model.UserVO;


public class OrderCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		
		String u_id=loginUser.getU_id();
		int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
		String recipient = request.getParameter("recipient");
		String address = request.getParameter("address");
		String phone= request.getParameter("phone");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String prod_name= request.getParameter("prod_name");
		
		OrderVO vo = new OrderVO(u_id,paid_amount,recipient,address,phone,amount,prod_name);	
		int cnt = new OrderDAO().orderUpload(vo);
		
		      
		if (cnt> 0) {
			System.out.println("주문내역 업로드 성공");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Pay.jsp");
			
			request.setAttribute("prod_name", prod_name);
			request.setAttribute("amount", amount);
			request.setAttribute("paid_amount", paid_amount);
			
		}else {
			System.out.println("주문내역 업로드 실패");
			response.sendRedirect("Order.jsp");
		}
	
		
	}

}
