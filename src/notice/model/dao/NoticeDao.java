package notice.model.dao;

import static common.JDBCTemp.*;
import notice.model.vo.Notice;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;

public class NoticeDao {
	public NoticeDao() {}
	
	public ArrayList<Notice> selectAll(Connection conn) {
		ArrayList<Notice> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
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
			close(stmt);
		}
		
		return list;
	}
}
