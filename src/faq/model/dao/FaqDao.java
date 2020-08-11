package faq.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import faq.model.vo.Faq;

public class FaqDao {
	public FaqDao() {}

	public ArrayList<Faq> selectAll(Connection conn) {
		ArrayList<Faq> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from faq";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Faq faq = new Faq();
				
				faq.setFaqNo(rset.getInt("faq_no"));
				faq.setFaqId(rset.getString("faq_id"));
				faq.setFaqTitle(rset.getString("faq_title"));
				faq.setFaqContent(rset.getString("faq_content"));
				faq.setFaqDate(rset.getDate("faq_date"));
				faq.setFaqCount(rset.getInt("faq_count"));
				faq.setFaqCategory(rset.getInt("faq_category"));
				
				list.add(faq);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Faq> selectCategory(Connection conn, int no) {
		ArrayList<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from faq where faq_category = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Faq faq = new Faq();
				
				faq.setFaqNo(rset.getInt("faq_no"));
				faq.setFaqId(rset.getString("faq_id"));
				faq.setFaqTitle(rset.getString("faq_title"));
				faq.setFaqContent(rset.getString("faq_content"));
				faq.setFaqDate(rset.getDate("faq_date"));
				faq.setFaqCount(rset.getInt("faq_count"));
				faq.setFaqCategory(rset.getInt("faq_category"));
				
				list.add(faq);
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
