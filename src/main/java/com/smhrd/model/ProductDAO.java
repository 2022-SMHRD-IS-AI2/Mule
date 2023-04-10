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
		
		
		//중고거래상품 등록 요청
		public int UPupload(ProductVO vo) {
			
			int cnt = sqlSession.insert("UPupload",vo);
			sqlSession.close();
			
			return cnt;
		}
		
		
		// 해외공구상품 출력
		public List<ProductVO> OPshow() {
			
			List<ProductVO> OPshow  = sqlSession.selectList("com.smhrd.model.ProductDAO.OPshow");
			sqlSession.close();
		
			return OPshow;
		}
		
		
		// 중고거래상품 출력
		public List<ProductVO> UPshow() {
					
			List<ProductVO> UPshow  = sqlSession.selectList("com.smhrd.model.ProductDAO.UPshow");
			sqlSession.close();
				
			return UPshow;
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
		
		
		//장바구니에 담아놓은 상품 결제완료시 구매한 사람 수 업데이트
		public int buyerCntUpdate () {

		int cnt=0;
			
			try {//만약 sql문이 잘못되었거나, url이 잘못되었다면 세션이 잘 생성이 안될수 있음
				
				//insert("실행할 sql 경로 정의",넘겨줄 값)
				cnt=sqlSession.update("com.smhrd.model.ProductDAO.buyerCntUpdate");
				
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
		
		   // 로그인한 유저의 상품 주문내역 조회
			public List<ProductVO> orderList(String U_id) {

			List<ProductVO> vo = sqlSession.selectList("com.smhrd.model.ProductDAO.orderList", U_id);
			sqlSession.close();
				
			return vo;
			}
		

}
