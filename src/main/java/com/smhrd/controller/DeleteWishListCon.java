package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.UserVO;
import com.smhrd.model.WishListDAO;
import com.smhrd.model.WishListVO;


public class DeleteWishListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		
		String u_id=loginUser.getU_id();
		String prod_num = request.getParameter("prod_num");
		
		WishListVO vo = new WishListVO(u_id,prod_num);
		int cnt = new WishListDAO().DeleteWishList(vo);
		
		if(cnt>0) {
			System.out.println("위시리스트 정보 삭제완료");
			response.sendRedirect("WishList.jsp");
		}else {
			System.out.println("위시리스트 정보 삭제실패");
			
		}
	}

}
