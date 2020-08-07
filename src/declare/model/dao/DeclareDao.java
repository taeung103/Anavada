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
	
	public ArrayList<Declare>selectList(Connection conn) {//신고목록전체조회
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
	public ArrayList<Declare>selectOne(Connection conn, String keyword) { //black id검색기능
		ArrayList<Declare> list = new ArrayList<Declare>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * form declare_admin where declareId =?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+ keyword + "%");
			
			rset = pstmt.executeQuery();
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
			close(pstmt);
		}
		return list;
	}
	public int insertDeclare(Connection conn, Declare declare) { //new신고자등록
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "inset into declare_admin values ( ?, ?, ?, sysdate)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, declare.getDeclareNo());
			pstmt.setString(2, declare.getDeclareId());
			pstmt.setInt(3, declare.getDeclareCount());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateDeclare(Connection conn, Declare declare) { //신고횟수, 제한설정 수정기능
		int result =0;
		PreparedStatement pstmt = null;
		
		String query = "update declare_admin set declare_count = ?, declare_ok = ? ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, declare.getDeclareCount());
			pstmt.setString(2, declare.getDeclareOk());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteDeclare(Connection conn, String declareId) { //신고자아이디 삭제
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from declare_admin where declare_id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, declareId);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


}
