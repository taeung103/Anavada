package cboard.model.service;
import java.sql.Connection;
import java.util.ArrayList;
import cboard.model.dao.CboardDao;
import cboard.model.vo.Cboard;
import static common.JDBCTemp.*;

public class CboardService {
	private CboardDao cdao = new CboardDao();
	
	public CboardService() {}

	public ArrayList<Cboard> selectAll() {
		Connection conn = getConnection();
		ArrayList<Cboard> list = cdao.selectList(conn);
		close(conn);
		return list;
	}

}
