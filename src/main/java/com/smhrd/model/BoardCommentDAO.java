package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class BoardCommentDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);

	// 게시판 댓글 업로드
	public int CmtUpload(BoardCommentVO vo) {

		int cnt = sqlSession.insert("com.smhrd.model.BoardCommentDAO.CmtUpload", vo);
		sqlSession.close();

		return cnt;
	}

	// 게시판 댓글조회
	public List<BoardCommentVO> showCmt(int b_num) {

		List<BoardCommentVO> lvo = sqlSession.selectList("com.smhrd.model.BoardCommentDAO.showCmt",b_num);
		sqlSession.close();

		return lvo;
	}

}

