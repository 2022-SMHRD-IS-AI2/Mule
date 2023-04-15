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


public class DeleteBucketCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
		
		String u_id=loginUser.getU_id();
		String prod_num = request.getParameter("prod_num");
		
		BucketVO vo = new BucketVO(u_id,prod_num);
		int cnt = new BucketDAO().DeleteBucket(vo);
		
		if(cnt>0) {
			System.out.println("장바구니정보 삭제완료");
			response.sendRedirect("Bucket.jsp");
		}else {
			System.out.println("장바구니정보 삭제실패");
			
		}
	}

}
