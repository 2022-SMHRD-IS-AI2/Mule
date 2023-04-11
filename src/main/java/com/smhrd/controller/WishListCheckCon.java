package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.UserVO;
import com.smhrd.model.WishListDAO;
import com.smhrd.model.WishListVO;


public class WishListCheckCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		
		String u_id=loginUser.getU_id();
		int prod_num = Integer.parseInt(request.getParameter("prod_num"));
		
		// 데이터베이스에 한번에 값 넣어주기
	    WishListVO vo = new WishListVO(prod_num,u_id);
	    boolean check = new WishListDAO().wishListCheck(vo);
	      
	    if(check==true) {
			System.out.println("위시리스트에 있는 상품");
				
		}else {
				System.out.println("위시리스트에 없는 상품");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("WishListCon");
				request.setAttribute("prod_num", prod_num);
				
				dispatcher.forward(request, response);
		}
			
		
	}

}
