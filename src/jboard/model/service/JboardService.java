package jboard.model.service;

import static common.JDBCTemp.*;
import java.sql.Connection;
import java.util.ArrayList;

import jboard.model.dao.JboardDao;
import jboard.model.vo.Jboard;
import notice.model.vo.Notice;

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



		public ArrayList<Jboard> selectList(int currentPage, int limit, String local, String listSearch, String titleSearch) {
			Connection conn = getConnection();
			ArrayList<Jboard> list = bdao.selectList(conn, currentPage, limit , local, listSearch, titleSearch);
			close(conn);
			return list;
		}

		public int getListCount(String local, String titleSearch) {
			Connection conn = getConnection();
			int listCount = bdao.getListCount(conn, local , titleSearch);
			close(conn);
					
			return listCount;
		}

		public Jboard selectJboard(int jboardNo) {
			Connection conn = getConnection();
			Jboard jboard = bdao.selectJboard(conn, jboardNo);
			
			close(conn);
			return jboard;
			
		}

		public void addReadCount(int jboardNo) {
			Connection conn = getConnection();
			int result = bdao.addReadCount(conn, jboardNo);
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			
		}

		public int jboardUpdate(Jboard jboard) {
			Connection conn = getConnection();
			int result = bdao.jboardUpdate(conn, jboard);
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}

		public int jboardDelete(int jboardNo) {
			Connection conn = getConnection();
			int result = bdao.jboardDelete(conn, jboardNo );
			if (result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}

		public ArrayList<Jboard> selectNewTop3() {
			Connection conn = getConnection();
			ArrayList<Jboard> list = bdao.selectNewTop3(conn);
			close(conn);
			return list;
		}

		
	}


