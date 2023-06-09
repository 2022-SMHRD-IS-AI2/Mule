package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class PayDAO {
	
	 SqlSessionFactory sqlsessionFactory=SqlSessionManager.getSqlSession();
		
		//factory를 사용해서 sql세션(sql실행,close(),연결(connection)) 생성
		// true -> auto commit
		SqlSession sqlSession=sqlsessionFactory.openSession(true);
		
		//주문내역 업로드
		public int PayUpload(PayVO vo) {
			
			int cnt = sqlSession.insert("PayUpload",vo);
			sqlSession.close();
			
			return cnt;
		}

}
