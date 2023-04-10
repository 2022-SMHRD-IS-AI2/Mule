package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.OrderDAO;



public class DeliveryProgressCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cnt = new OrderDAO().deliveryProgressUpdate();
		
		if(cnt>0) {
			System.out.println("배송상태 업데이트 내역 확인");
		}else {
			System.out.println("배송상태 업데이트 내역 없음");
		}
		
		response.sendRedirect("OrderList.jsp");
		
	}

}
