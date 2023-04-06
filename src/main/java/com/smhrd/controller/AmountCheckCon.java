package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BucketDAO;
import com.smhrd.model.BucketVO;
import com.smhrd.model.UserVO;


public class AmountCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		
		String u_id=loginUser.getU_id();
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		
	     // 데이터베이스에 한번에 값 넣어주기
	      BucketVO vo = new BucketVO(prod_num,u_id);
	      
	      boolean check = new BucketDAO().amountCheck(vo);
	      
			if(check==true) {
				System.out.println("장바구니에 있는 상품");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("AmountUpdateCon");
				request.setAttribute("prod_num", prod_num);
				request.setAttribute("amount", amount);
				
				dispatcher.forward(request, response);
				
			}else {
				System.out.println("장바구니에 없는 상품");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("BucketCon");
				request.setAttribute("prod_num", prod_num);
				request.setAttribute("amount", amount);
				
				dispatcher.forward(request, response);
			}
			
		
	}

}
