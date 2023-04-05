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


public class AmountUpdateCon2 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		
		String u_id=loginUser.getU_id();
		String prod_name = request.getParameter("prod_name");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
		String[] cnts = request.getParameterValues("cnt[]");
		String[] prodNums = request.getParameterValues("prodNum[]");
	
		
		for (int i = 0; i < cnts.length; i++) { // 배열 크기만큼 반복
			int num= Integer.parseInt(cnts[i]);
			int prodNum = Integer.parseInt( prodNums[i]);
			
			BucketVO vo = new BucketVO( prodNum,u_id,num);
			int cnt = new BucketDAO().amountUpdate2(vo);
			
			if(cnt>0) {
				System.out.println("수량 재설정 성공");
		
			}else {
				System.out.println("수량 제설정 실패");
				break;
			}
			
		}
		
			RequestDispatcher dispatcher = request.getRequestDispatcher("Order.jsp");
			request.setAttribute("prod_name", prod_name);
			request.setAttribute("amount", amount);
			request.setAttribute("paid_amount", paid_amount);
			
			dispatcher.forward(request, response);
		
		
	}

}
