package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ProductDAO {
	
	
	 	SqlSessionFactory sqlsessionFactory=SqlSessionManager.getSqlSession();
		
		//factory를 사용해서 sql세션(sql실행,close(),연결(connection)) 생성
		// true -> auto commit
		SqlSession sqlSession=sqlsessionFactory.openSession(true);
		
		//해외공구상품 등록 요청
		public int OPupload(ProductVO vo) {
			
			int cnt = sqlSession.insert("OPupload",vo);
			sqlSession.close();
			
			return cnt;
		}
		
		
		// 해외공구상품 등록하기
		public List<ProductVO> OPshow() {
			
			List<ProductVO> OPshow  = sqlSession.selectList("com.smhrd.model.ProductDAO.OPshow");
			sqlSession.close();
		
			return OPshow;
		}
		

}
