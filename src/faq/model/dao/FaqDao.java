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

	public int getListCount(Connection conn) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from faq";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
				result = rset.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	public ArrayList<Faq> selectAll(Connection conn, int currentPage, int countList) {
		ArrayList<Faq> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * "
					 + "from (select rank() over(order by faq_no desc) rnum, faq_no, faq_id, faq_title, faq_content, faq_date, faq_count, faq_category "
					 	   + "from faq) "
					 + "where rnum >= ? and rnum <=?";
		
		int startRow = (currentPage - 1) * countList + 1;
		int endRow = startRow + countList -1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
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
