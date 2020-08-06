package declare.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import declare.model.vo.DBo;
import declare.model.vo.Declare;

public class DBoDao {
	public DBoDao() {}
	
	public ArrayList<DBo>selectList(Connection conn) {
		ArrayList<DBo> list = new ArrayList<DBo>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from declare_board order by notice desc";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				DBo dbo = new DBo();
				dbo.setDboNo(rset.getInt("declare_no"));
				dbo.setDboMid(rset.getString("member_id"));
				dbo.setDboTitle(rset.getString("declare_title"));
				dbo.setDboDate(rset.getDate("declare_date"));
				dbo.setDboType(rset.getString("declare_type"));
				dbo.setDboContent(rset.getString("declare_content"));
				dbo.setDboOriginal(rset.getString("declare_original"));
				dbo.setDboRename(rset.getString("declare_rename"));
				dbo.setDboUrl(rset.getString("declare_url"));
				dbo.setDboBId(rset.getString("declare_id"));
				
				list.add(dbo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	public DBo selectOne(Connection conn, String dboMid) {
		DBo dbo = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * form declare_admin where member_id =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dboMid);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
			    dbo = new DBo();
				dbo.setDboNo(rset.getInt("declare_no"));
				dbo.setDboMid(dboMid);
				dbo.setDboTitle(rset.getString("declare_title"));
				dbo.setDboDate(rset.getDate("declare_date"));
				dbo.setDboType(rset.getString("declare_type"));
				dbo.setDboContent(rset.getString("declare_content"));
				dbo.setDboOriginal(rset.getString("declare_original"));
				dbo.setDboRename(rset.getString("declare_rename"));
				dbo.setDboUrl(rset.getString("declare_url"));
				dbo.setDboBId(rset.getString("declare_id"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return dbo;
	}
	public int insertDBo(Connection conn, DBo dbo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateDBo(Connection conn, DBo dbo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteDBo(Connection conn, DBo dbo) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
