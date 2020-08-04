package cboard.model.dao;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import cboard.model.vo.Cboard;
import static common.JDBCTemp.*;

public class CboardDao {
	public CboardDao() {}

	public ArrayList<Cboard> selectList(Connection conn) {
		ArrayList<Cboard> list = new ArrayList<Cboard>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from cboard";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				Cboard cboard = new Cboard();
				
				cboard.setCboardNo(rset.getInt("cboard_no"));
				cboard.setMemberId(rset.getString("member_id"));
				cboard.setCboardTitle(rset.getString("cboard_title"));
				cboard.setCboardContent(rset.getString("cboard_content"));
				cboard.setDate(rset.getDate("cboard_date"));
				cboard.setLastmodifiedDate(rset.getDate("cboard_lastmodified"));
				cboard.setCboardViewCount(rset.getInt("cboard_viewcount"));
				cboard.setReplyCount(rset.getInt("cboard_replycount"));
				cboard.setLikeCount(rset.getInt("cboard_likecount"));
				cboard.setReportCount(rset.getInt("cboard_reportcount"));
				cboard.setCboardDisplay(rset.getString("cboard_display"));
				cboard.setLocalNo(rset.getString("local_no"));
				cboard.setCfilesOriginalFilepath1(rset.getString("cfiles_original_filepath1"));
				cboard.setCfilesRenameFilepath1(rset.getString("cfiles_rename_filepath1"));
				cboard.setCfilesOriginalFilepath2(rset.getString("cfiles_original_filepath2"));
				cboard.setCfilesRenameFilepath2(rset.getString("cfiles_rename_filepath2"));
				cboard.setCfilesOriginalFilepath3(rset.getString("cfiles_original_filepath3"));
				cboard.setCfilesRenameFilepath3(rset.getString("cfiles_rename_filepath3"));
				cboard.setCfilesOriginalFilepath4(rset.getString("cfiles_original_filepath4"));
				cboard.setCfilesRenameFilepath4(rset.getString("cfiles_rename_filepath4"));
				
				list.add(cboard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		Collections.reverse(list);
		return list;
	}
}
