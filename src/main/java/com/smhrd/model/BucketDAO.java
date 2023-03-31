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
	
	//해외공구상품 장바구니 업로드
	public int OpBucketUpload(BucketVO vo) {
		
		int cnt = sqlSession.insert("OpBucketUpload",vo);
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
	
}
