package declare.model.service;

import static common.JDBCTemp.*;

import java.sql.Connection;
import java.util.ArrayList;

import declare.model.dao.DBoDao;
import declare.model.vo.DBo;

public class DBoService {
	private DBoDao dbodao = new DBoDao();
	public DBoService() {}
	
	public ArrayList<DBo> selectAll(){
		Connection conn = getConnection();
		ArrayList<DBo> list = dbodao.selectList(conn);
		close(conn);
		return list;
	}
	public DBo selectOne(String dboMid) {
		Connection conn = getConnection();
		DBo dbo = dbodao.selectOne(conn, dboMid);
		close(conn);
		return dbo;
	}
	public int insertDBo(DBo dbo) {
		Connection conn = getConnection();
		int result = dbodao.insertDBo(conn, dbo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public int updateDBo(DBo dbo) {
		Connection conn = getConnection();
		int result = dbodao.updateDBo(conn, dbo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	public int deleteDBo(DBo dbo) {
		Connection conn = getConnection();
		int result = dbodao.deleteDBo(conn, dbo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	

}
