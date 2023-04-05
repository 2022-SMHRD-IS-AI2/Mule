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
		
		
		// 해외공구상품 출력
		public List<ProductVO> OPshow() {
			
			List<ProductVO> OPshow  = sqlSession.selectList("com.smhrd.model.ProductDAO.OPshow");
			sqlSession.close();
		
			return OPshow;
		}
		
		
		// 각 세부 상품정보 조회
		public ProductVO ShowProdDetail(int prod_num) {
			
			ProductVO vo = sqlSession.selectOne("com.smhrd.model.ProductDAO.ShowProdDetail",prod_num);
			sqlSession.close();
			
			return vo;
		}
		
		
	    // 로그인한 사람 해외공구상품 장바구니 조회
		public List<ProductVO> Bucket(String U_id) {

			List<ProductVO> vo = sqlSession.selectList("com.smhrd.model.ProductDAO.Bucket", U_id);
			sqlSession.close();
			

			return vo;
		}
		

}
