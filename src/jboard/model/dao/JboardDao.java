package jboard.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import org.apache.tomcat.jni.Local;

import jboard.model.vo.Jboard;
import notice.model.vo.Notice;

public class JboardDao {
		public JboardDao () {}

		public int insertJboard(Connection conn, Jboard jboard) {
			return 0;
		}


		public int getListCount(Connection conn , String local ,String titleSearch ) {
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			String query  = "SELECT COUNT(*) FROM JBOARD "
			+(local != null && !local.equals("0") ? "WHERE LOCAL_NO ="+local : "");
			query+=(local != null && !local.equals("0") && titleSearch != null) ? "AND JBOARD_TITLE LIKE '%" + titleSearch + "%'" : "";
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

		public ArrayList<Jboard> selectList(Connection conn, int currentPage, int limit ,String local, String listSearch , String titleSearch) {
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
					"FROM (SELECT * FROM JBOARD " +
					(local != null && !local.equals("0")? "WHERE LOCAL_NO =? " : "");
					query +=(titleSearch != null ? "AND JBOARD_TITLE LIKE ?" : "");
					switch((listSearch==null)? listSearch = "latestposts" : listSearch) {
					case("latestposts") : query+= "ORDER BY JBOARD_DATE DESC)) "; break;
					case("highprice") :  query+= "ORDER BY JBOARD_PRICE DESC)) "; break;
					case("lowprice") :  query+= "ORDER BY JBOARD_PRICE ASC)) "; break;
					case("highlike") : query+= "ORDER BY JBOARD_LIKE DESC)) "; break;
					}
					query +="WHERE JBOARD_CHECK = 'Y' ";
					query +=" AND RNUM >=? AND RNUM <=? ";
			
					
				
			
			int startRow = (currentPage - 1) * limit + 1; 
			int endRow = startRow + limit - 1;
			try {
				 	if(local== null || local.equals("0")){
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
				 	}else if (local !=null&& titleSearch ==null || local.equals("0")){
				 		pstmt = conn.prepareStatement(query);
						pstmt.setString(1, local);
						pstmt.setInt(2, startRow);
						pstmt.setInt(3, endRow);
				 	} else if (local !=null && titleSearch != null) {
				 		pstmt = conn.prepareStatement(query);
				 		pstmt.setString(1, local);
				 		pstmt.setString(2, "%" + titleSearch +"%");
				 		pstmt.setInt(3, startRow);
						pstmt.setInt(4, endRow);
				 	}else {
				 		pstmt = conn.prepareStatement(query);
						pstmt.setInt(1, startRow);
						pstmt.setInt(2, endRow);
				 	}
			
				 	
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
						jboard.setJboardCheck(rset.getString("jboard_check"));
						jboard.setJboardMeet(rset.getString("jboard_meet"));
						jboard.setJboardPost(rset.getString("jboard_post"));
						jboard.setMemberId(rset.getString("member_id"));
						jboard.setLocalNo(rset.getString("local_no"));
						
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

		public Jboard selectOne(Connection conn, int jboardNo) {
			Jboard jboard = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "SELECT * FROM JBOARD WHERE JBOARD_NO = ?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, jboardNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					jboard = new Jboard();
					
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
					jboard.setJboardCheck(rset.getString("jboard_check"));
					jboard.setJboardMeet(rset.getString("jboard_meet"));
					jboard.setJboardPost(rset.getString("jboard_post"));
					jboard.setMemberId(rset.getString("member_id"));
					jboard.setLocalNo(rset.getString("local_no"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return jboard;
		}

		
}
