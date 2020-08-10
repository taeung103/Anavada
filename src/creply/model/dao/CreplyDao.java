package creply.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import static common.JDBCTemp.*;
import cboard.model.vo.Cboard;
import creply.model.vo.Creply;

public class CreplyDao {
	public CreplyDao() {}

	public ArrayList<Creply> selectList(Connection conn, int cboardNo) {
		ArrayList<Creply> rlist = new ArrayList<Creply>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from creply where cboard_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cboardNo);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				Creply creply = new Creply();
				
				creply.setCreplyNo(rset.getInt("creply_no"));
				creply.setCbaordNo(cboardNo);
				creply.setMemberId(rset.getString("member_id"));
				creply.setCreplyDate(rset.getDate("creply_date"));
				creply.setCreplyContent(rset.getString("creply_content"));
				creply.setParantReply(rset.getInt("parant_reply"));
				creply.setCreplyOrder(rset.getInt("creply_order"));
				creply.setCreplyDepth(rset.getInt("creply_depth"));
				
				rlist.add(creply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rlist;
	}

	
	public int getAllReplyListCount(Connection conn, int cboardNum) {
		int replyCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from creply where cboard_no = " + cboardNum;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if (rset.next()) {
				replyCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return replyCount;
	}

	public int insertCreply(Connection conn, Creply creply) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into creply values(CREPLY_SEQ.nextval, ?, ?, to_date(sysdate,'yyyy.mm.dd hh24:mi'), ?, null, null, 1)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, creply.getCbaordNo());
			pstmt.setString(2, creply.getMemberId());
			pstmt.setString(3, creply.getCreplyContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
