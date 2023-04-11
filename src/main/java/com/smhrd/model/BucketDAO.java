package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BucketDAO {

	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SQLSessionManager사용
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	// true 넣으면 outo commit
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	//장바구니 업로드
	public int BucketUpload(BucketVO vo) {
		
		int cnt = sqlSession.insert("BucketUpload",vo);
		sqlSession.close();
		
		return cnt;
	}
	
	
  	// 장바구니에 담기 클릭 시 해당상품이 이미 있는지 확인하기
 	 public boolean amountCheck(BucketVO vo) {
 	 boolean check = false;

 	      try {
 	         check = sqlSession.selectOne("com.smhrd.model.BucketDAO.amountCheck",vo);
 	         // select - commit / rollback 생략가능
 	      } catch (Exception e) {
 	         e.printStackTrace();
 	      } finally {
 	         sqlSession.close();
 	      }
 	      return check;
 	  }
 	 
 	 // 장바구니에 담기 클릭 시 해당상품이 이미 있다면 기존의 장바구니에 있던 수량에 추가한 수량을 더해서 업데이트
		public int amountUpdate(BucketVO vo) {

		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.update("com.smhrd.model.BucketDAO.amountUpdate", vo);
				
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
		
		// 장바구니에서 수량 조정후 주문할 시 수량값 재설정
		
		public int amountUpdate2(BucketVO vo) {

		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.update("com.smhrd.model.BucketDAO.amountUpdate2", vo);
				
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
		
		
		//결제 성공시 기존 장바구니 정보 삭제하기
		public int AllDeleteBucket(String loginuser) {
			
		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.delete("com.smhrd.model.BucketDAO.AllDeleteBucket",loginuser);
				
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
