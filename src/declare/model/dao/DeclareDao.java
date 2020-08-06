package declare.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import declare.model.vo.DBo;
import declare.model.vo.Declare;

public class DeclareDao {
	public DeclareDao() {}
	
	public ArrayList<Declare>selectList(Connection conn) {
		ArrayList<Declare> list = new ArrayList<Declare>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from declare_admin order by notice desc";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Declare declare = new Declare();
				declare.setDeclareNo(rset.getInt("declare_no"));
				declare.setDeclareId(rset.getString("declare_id"));
				declare.setDeclareCount(rset.getInt("declare_count"));
				declare.setDeclareOk(rset.getString("declare_ok"));
								
				list.add(declare);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	public Declare selectOne(Connection conn, String declareId) {
		Declare declare = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * form declare_admin where declareId =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, declareId);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				declare = new Declare();
				declare.setDeclareNo(rset.getInt("declare_no"));
				declare.setDeclareId(declareId);
				declare.setDeclareCount(rset.getInt("declare_count"));
				declare.setDeclareOk(rset.getString("declare_ok"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return declare;
	}

	public int insertDeclare(Connection conn, Declare declare) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateDeclare(Connection conn, Declare declare) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteDeclare(Connection conn, Declare declare) {
		// TODO Auto-generated method stub
		return 0;
	}


}
