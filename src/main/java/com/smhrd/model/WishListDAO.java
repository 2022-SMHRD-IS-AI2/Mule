package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class WishListDAO {
	
	
		// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SQLSessionManager사용
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

		// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
		// true 넣으면 outo commit
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		
	  	// 찜하기 클릭 시 해당상품이 이미 있는지 확인하기
	 	 public boolean wishListCheck(WishListVO vo) {
	 	 boolean check = false;

	 	      try {
	 	         check = sqlSession.selectOne("com.smhrd.model.WishListDAO.wishListCheck",vo);
	 	         // select - commit / rollback 생략가능
	 	      } catch (Exception e) {
	 	         e.printStackTrace();
	 	      } finally {
	 	         sqlSession.close();
	 	      }
	 	      return check;
	 	  }
	 	 
	 	
		//위시리스트 업로드
		public int wishListUpload(WishListVO vo) {
				
			int cnt = sqlSession.insert("wishListUpload",vo);
			sqlSession.close();
				
			return cnt;
		}

}
