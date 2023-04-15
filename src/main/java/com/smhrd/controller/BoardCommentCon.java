package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BoardCommentDAO;
import com.smhrd.model.BoardCommentVO;
import com.smhrd.model.UserVO;

public class BoardCommentCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		

		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
	  	
	  	String u_id=loginUser.getU_id();

		int B_num = Integer.parseInt(request.getParameter("Bnum"));
		String board_cmt_content = request.getParameter("cmt");

		BoardCommentVO vo = new BoardCommentVO(B_num,board_cmt_content,u_id);
		int cnt = new BoardCommentDAO().CmtUpload(vo);
		
		if (cnt > 0) {
			System.out.println("댓글 작성 성공");
			response.sendRedirect("BoardView.jsp?B_num="+B_num);
		} else {
			System.out.println("댓글 작성 실패");
		}
	}

}

