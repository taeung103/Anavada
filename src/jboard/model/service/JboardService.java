package jboard.model.service;

import static common.JDBCTemp.*;
import java.sql.Connection;
import java.util.ArrayList;

import jboard.model.dao.JboardDao;
import jboard.model.vo.Jboard;

public class JboardService {
		
	private JboardDao bdao = new JboardDao();
	public JboardService() {}
	
		public int insertJboard(Jboard jboard) {
			Connection conn = getConnection();
			int result = bdao.insertJboard(conn, jboard);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}



		public ArrayList<Jboard> selectList(int currentPage, int limit) {
			Connection conn = getConnection();
			ArrayList<Jboard> list = bdao.selectList(conn, currentPage, limit);
			close(conn);
			return list;
		}

		public int getListCount() {
			return 0;
		}
		
		
	}


