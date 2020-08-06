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
	
	
	public ArrayList<Declare> selectAll(){
		Connection conn = getConnection();
		ArrayList<Declare> list = ddao.selectList(conn);
		close(conn);
		return list;
	}
	public Declare selectOne(String declareId) {
		Connection conn = getConnection();
		Declare declare = ddao.selectOne(conn, declareId);
		close(conn);
		return declare;
	}
	public int insertDeclare(Declare declare) {
		Connection conn = getConnection();
		int result = ddao.insertDeclare(conn, declare);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public int updateDeclare(Declare declare) {
		Connection conn = getConnection();
		int result = ddao.updateDeclare(conn, declare);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public int deleteDeclare(Declare declare) {
		Connection conn = getConnection();
		int result = ddao.deleteDeclare(conn, declare);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

}
