package declare.model.service;

import static common.JDBCTemp.*;

import java.sql.Connection;
import java.util.ArrayList;

import declare.model.dao.DeclareDao;
import declare.model.vo.DBo;
import declare.model.vo.Declare;

public class DeclareService {
	
	private DeclareDao ddao = new DeclareDao();
	public DeclareService() {}
	
	
	public ArrayList<Declare> selectAll(){ //신고자 전체목록
		Connection conn = getConnection();
		ArrayList<Declare> list = ddao.selectList(conn);
		close(conn);
		return list;
	}
	public ArrayList<Declare> selectOne(String keyword) { //declare id조회
		Connection conn = getConnection();
		ArrayList<Declare> list = ddao.selectOne(conn, keyword);
		close(conn);
		return list;
	}
	public int insertDeclare(Declare declare) { //신고자등록(blackID)
		Connection conn = getConnection();
		int result = ddao.insertDeclare(conn, declare);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public int updateDeclare(Declare declare) { //신고자카운트 up 및 상태수정
		Connection conn = getConnection();
		int result = ddao.updateDeclare(conn, declare);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public int deleteDeclare(String declareId) { //신고자 삭제
		Connection conn = getConnection();
		int result = ddao.deleteDeclare(conn, declareId);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
}
