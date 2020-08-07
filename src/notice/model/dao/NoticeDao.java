package notice.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import notice.model.vo.Notice;

public class NoticeDao {
	public NoticeDao() {}
	
	public ArrayList<Notice> selectAll(Connection conn, int currentPage, int limit) {
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rank() over (order by no_no desc) rnum, no_no, no_id, no_title, no_content,"
				+ " no_date, no_count, no_original, no_rename from notice) where rnum >= ? and rnum <= ?";
		
		int startRow = (currentPage - 1) * limit +1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice notice = new Notice();
				
				notice.setNoNo(rset.getInt("no_no"));
				notice.setNoId(rset.getString("no_id"));
				notice.setNoTitle(rset.getString("no_title"));
				notice.setNoContent(rset.getString("no_content"));
				notice.setNoDate(rset.getDate("no_date"));
				notice.setNoCount(rset.getInt("no_count"));
				notice.setNoOriginal(rset.getString("no_original"));
				notice.setNoRename(rset.getString("no_rename"));
				
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from notice";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
				listCount = rset.getInt(1);
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	public int getListCount(Connection conn, String column ,String keyword) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from notice ";
		
		if(column.equals("title"))
			query += "where no_title like ?";
		else query += "where no_content like ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			
			if(rset.next())
				listCount = rset.getInt(1);
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	public Notice selectCountTop1(Connection conn) {
		Notice notice = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rank() over (order by no_count desc, no_date desc) 순위, "
									+ "no_no, no_id, no_title, no_content, no_date, no_count, no_original, no_rename from notice) "
									+ "where 순위 = 1";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				notice = new Notice();

				notice.setNoNo(rset.getInt("no_no"));
				notice.setNoId(rset.getString("no_id"));
				notice.setNoTitle(rset.getString("no_title"));
				notice.setNoContent(rset.getString("no_content"));
				notice.setNoDate(rset.getDate("no_date"));
				notice.setNoCount(rset.getInt("no_count"));
				notice.setNoOriginal(rset.getString("no_original"));
				notice.setNoRename(rset.getString("no_rename"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return notice;
	}

	public ArrayList<Notice> searchTorC(Connection conn, int currentPage, int limit, String keyword, String column) {
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * "
					 + "from (select rank() over (order by no_no desc) rnum, no_no, no_id, no_title, no_content, no_date, no_count, no_original, no_rename "
					 	   + "from notice ";
		
		if(column.equals("title"))
			query += "where no_title like ?) where rnum >= ? and rnum <= ?";
		else query += "where no_content like ?) where rnum >= ? and rnum <= ?";
		
		int startRow = (currentPage - 1) * limit +1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice notice = new Notice();
				
				notice.setNoNo(rset.getInt("no_no"));
				notice.setNoId(rset.getString("no_id"));
				notice.setNoTitle(rset.getString("no_title"));
				notice.setNoContent(rset.getString("no_content"));
				notice.setNoDate(rset.getDate("no_date"));
				notice.setNoCount(rset.getInt("no_count"));
				notice.setNoOriginal(rset.getString("no_original"));
				notice.setNoRename(rset.getString("no_rename"));
				
				list.add(notice);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int addReadCount(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update notice set no_count = no_count + 1 where no_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Notice selectOne(Connection conn, int no) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice where no_no = ?";
		
		try {
			pstmt =conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice();
				
				notice.setNoNo(rset.getInt("no_no"));
				notice.setNoId(rset.getString("no_id"));
				notice.setNoTitle(rset.getString("no_title"));
				notice.setNoContent(rset.getString("no_content"));
				notice.setNoDate(rset.getDate("no_date"));
				notice.setNoCount(rset.getInt("no_count"));
				notice.setNoOriginal(rset.getString("no_original"));
				notice.setNoRename(rset.getString("no_rename"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return notice;
	}

	public int deleteNotice(Connection conn, int checkRow) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from notice where no_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, checkRow);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
}
