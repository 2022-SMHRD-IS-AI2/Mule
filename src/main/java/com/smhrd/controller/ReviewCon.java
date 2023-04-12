package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewVO;
import com.smhrd.model.UserVO;

public class ReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		 HttpSession session = request.getSession();
	     UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
	      
	    String u_id=loginUser.getU_id();

		String review_content = request.getParameter("review_content");
		int rating = Integer.parseInt(request.getParameter("rating"));
		String prod_num = request.getParameter("prod_num");
		int order_num = Integer.parseInt(request.getParameter("order_num"));
		
		  ReviewVO vo = new ReviewVO(prod_num,review_content, u_id, rating);
		  
		  int cnt = new ReviewDAO().reviewUpload(vo);
		  
		  if (cnt > 0) {
			  System.out.println("리뷰 업로드 성공"); 
			
			  RequestDispatcher dispatcher = request.getRequestDispatcher("ReviewStatusCon");
			  request.setAttribute("order_num", order_num);
			  request.setAttribute("prod_num", prod_num);
	
			  dispatcher.forward(request, response);
		  }else {
			  System.out.println("리뷰 업로드 실패"); 
		  }
		  
		 
	}

}
