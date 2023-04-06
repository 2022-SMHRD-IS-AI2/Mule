package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BucketDAO;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.UserVO;


public class PaySuccessCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		
		String u_id=loginUser.getU_id();
		
		int cnt = new BucketDAO().orderStatusCheck(u_id);
		
		if(cnt>0) {
			System.out.println("결제완료");
			response.sendRedirect("BuyerCntUpdateCon");
		}else {
			System.out.println("결제실패");
			
		}
	
		
	}

}
