package cboard.model.service;
import java.sql.Connection;
import java.util.ArrayList;
import cboard.model.dao.CboardDao;
import cboard.model.vo.Cboard;
import static common.JDBCTemp.*;

public class CboardService {
	private CboardDao cdao = new CboardDao();
	
	public CboardService() {}

	public ArrayList<Cboard> selectAll(int currentPage, int limit, String local, String search, String keyword) {
		Connection conn = getConnection();
		ArrayList<Cboard> list = cdao.selectList(conn, currentPage, limit, local, search, keyword);
		close(conn);
		return list;
	}

	public int getListCount(String local, String search, String keyword) {
		Connection conn = getConnection();
		int listCount = cdao.getListCount(conn, local, search, keyword);
		close(conn);
		return listCount;
	}

}
