package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BoardDAO {

	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SQLSessionManager사용
		SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	// true 넣으면 outo commit
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
		
		
		// 게시글 업로드	
		public int BoardUpload (BoardVO vo) {
			int cnt = sqlSession.insert("BoardUpload", vo);
			sqlSession.close();
			
			return cnt;
		}
	
		// 전체 게시글 조회
		public List<BoardVO> AllBoardShow() {
			
			List<BoardVO> vo = sqlSession.selectList("com.smhrd.model.BoardDAO.AllBoardShow");
			sqlSession.close();
		
			return vo;
		}
		
		// 세부 게시글 조회
		public BoardVO DetailBoardShow(int b_num) {
			
			BoardVO vo = sqlSession.selectOne("com.smhrd.model.BoardDAO.DetailBoardShow",b_num);
			sqlSession.close();
			
			return vo;
		}
		
	}

