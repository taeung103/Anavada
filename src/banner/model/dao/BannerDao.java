package banner.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import banner.model.vo.Banner;

public class BannerDao {
	public BannerDao() {}
	
	public ArrayList<Banner> selectAll(Connection conn){
		ArrayList<Banner> list = new ArrayList<Banner>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from Banner";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Banner banner = new Banner();
				
				banner.setBannerNo(rset.getInt("banner_no"));
				banner.setBannerTitle(rset.getString("banner_title"));
				banner.setBannerChk(rset.getString("banner_chk"));
				banner.setBannerOk(rset.getString("banner_ok"));
				banner.setBannerOriginal(rset.getString("banner_original"));
				banner.setBannerSize(rset.getString("banner_size"));
				
				list.add(banner);
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
