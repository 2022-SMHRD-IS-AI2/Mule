package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BucketDAO;
import com.smhrd.model.BucketVO;
import com.smhrd.model.UserVO;


public class BucketCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
	
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		
		String u_id=loginUser.getU_id();
		
		String prod_num = request.getParameter("prod_num");
		int amount = Integer.parseInt(request.getParameter("amount"));
		
		BucketVO vo = new BucketVO(prod_num,u_id,amount);	
		int cnt = new BucketDAO().BucketUpload(vo);
		
		      
		if (cnt> 0) {
			System.out.println("장바구니 업로드 성공");
		}else {
			System.out.println("장바구니 업로드 실패");
		}
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
		
	}

}
