package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class OrderDAO {
	
	 SqlSessionFactory sqlsessionFactory=SqlSessionManager.getSqlSession();
		
		//factory를 사용해서 sql세션(sql실행,close(),연결(connection)) 생성
		// true -> auto commit
		SqlSession sqlSession=sqlsessionFactory.openSession(true);
		
		//주문내역 업로드
		public int orderUpload(OrderVO vo) {
			
			int cnt = sqlSession.insert("orderUpload",vo);
			sqlSession.close();
			
			return cnt;
		}
		
		
		//장바구니에 담아놓은 상품 결제완료시 구매한 사람 수 업데이트
		public int deliveryProgressUpdate () {

		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.update("com.smhrd.model.OrderDAO.deliveryProgressUpdate");
				
				if(cnt>0) {
					sqlSession.commit();
				}else {
					sqlSession.rollback();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}finally {
				sqlSession.close();
			}
			return cnt;
		}
		
		
		//상품구매자가 반품 신청시 반품여부 N->Y로 변경하기
		public int returnStatusUpdate (OrderVO vo) {

		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.update("com.smhrd.model.OrderDAO.returnStatusUpdate", vo);
				
				if(cnt>0) {
					sqlSession.commit();
				}else {
					sqlSession.rollback();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}finally {
				sqlSession.close();
			}
			return cnt;
		}
		
		
		// 상품구매자가 결제확정시 결제여부 N->Y로 변경하기
		public int paymentStatusUpdate (OrderVO vo) {

		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.update("com.smhrd.model.OrderDAO.paymentStatusUpdate", vo);
				
				if(cnt>0) {
					sqlSession.commit();
				}else {
					sqlSession.rollback();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}finally {
				sqlSession.close();
			}
			return cnt;
		}
		
		
		// 상품구매자가 중고거래 선택시 중고거래 여부 N->Y로 변경하기
		public int usedProdStatusUpdate (OrderVO vo) {

		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.update("com.smhrd.model.OrderDAO.usedProdStatusUpdate", vo);
				
				if(cnt>0) {
					sqlSession.commit();
				}else {
					sqlSession.rollback();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}finally {
				sqlSession.close();
			}
			return cnt;
		}
		
		
		// 상품구매자가 리뷰작성 완료시 리뷰작성여부 N->Y로 변경하기
		public int  reviewStatusUpdate (OrderVO vo) {

		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.update("com.smhrd.model.OrderDAO.reviewStatusUpdate", vo);
				
				if(cnt>0) {
					sqlSession.commit();
				}else {
					sqlSession.rollback();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}finally {
				sqlSession.close();
			}
			return cnt;
		}

}
