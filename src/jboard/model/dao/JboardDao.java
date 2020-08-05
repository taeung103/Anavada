package jboard.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import jboard.model.vo.Jboard;

public class JboardDao {
		public JboardDao () {}

		public int insertJboard(Connection conn, Jboard jboard) {
			return 0;
		}


		public int getListCount(Connection conn) {
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select count(*) from jboard";
			
			try {
					stmt = conn.createStatement();
					rset = stmt.executeQuery(query);
					
					if (rset.next()) {
						listCount = rset.getInt(1);
					}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
			return listCount;
	}

		public ArrayList<Jboard> selectList(Connection conn, int currentPage, int limit) {
			ArrayList<Jboard> list = new ArrayList <Jboard>();
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "SELECT * " + 
					"FROM (SELECT ROWNUM RNUM, JBOARD_NO, JBOARD_TITLE, JBOARD_CONTENT, " + 
					"JBOARD_PRICE, JBOARD_DATE , JBOARD_UPDATE, " + 
					"JBOARD_COUNT, JBOARD_LIKE, JFILES_ORIGINAL_FILEPATH1, JFILES_RENAME_FILEPATH1, " + 
					"JFILES_ORIGINAL_FILEPATH2, JFILES_RENAME_FILEPATH2 , JFILES_ORIGINAL_FILEPATH3, " +
					"JFILES_RENAME_FILEPATH3, JFILES_ORIGINAL_FILEPATH4 , JFILES_RENAME_FILEPATH4, " +
					"JBOARD_CHECK , JBOARD_MEET, JBOARD_POST, MEMBER_ID, LOCAL_NO "+
					"FROM (SELECT * FROM JBOARD ORDER BY JBOARD_NO)) " + 
					"WHERE JBOARD_CHECK = 'Y' AND RNUM >=? AND RNUM <=? ";
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;
			
			try {
				
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
					
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						Jboard jboard = new Jboard();
						
						jboard.setJboardNo(rset.getInt("jboard_no"));
						jboard.setJboardTitle(rset.getString("jboard_title"));
						jboard.setJboardContent(rset.getString("jboard_content"));
						jboard.setJboardPrice(rset.getInt("jboard_price"));
						jboard.setJboardDate(rset.getDate("jboard_date"));
						jboard.setJboardUpdate(rset.getDate("jboard_update"));
						jboard.setJboardCount(rset.getInt("jboard_count"));
						jboard.setJboardLike(rset.getInt("jboard_like"));
						jboard.setJboardOrignalFilePath1(rset.getString("JFILES_ORIGINAL_FILEPATH1"));
						jboard.setJboardRenameFilePath1(rset.getString("JFILES_RENAME_FILEPATH1"));
						jboard.setJboardOrignalFilePath2(rset.getString("JFILES_ORIGINAL_FILEPATH2"));
						jboard.setJboardRenameFilePath2(rset.getString("JFILES_RENAME_FILEPATH2"));
						jboard.setJboardOrignalFilePath3(rset.getString("JFILES_ORIGINAL_FILEPATH3"));
						jboard.setJboardRenameFilePath3(rset.getString("JFILES_RENAME_FILEPATH3"));
						jboard.setJboardOrignalFilePath4(rset.getString("JFILES_ORIGINAL_FILEPATH4"));
						jboard.setJboardRenameFilePath4(rset.getString("JFILES_RENAME_FILEPATH4"));
						jboard.setJboardCheck("jboard_check");
						jboard.setJboardMeet("jboard_meet");
						jboard.setJboardPost("jboard_post");
						jboard.setMemberId("member_id");
						jboard.setLocalNo("local_no");
								
						list.add(jboard);
					}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
		return list; 
	}

		
}
