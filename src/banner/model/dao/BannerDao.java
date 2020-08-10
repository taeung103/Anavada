package banner.model.dao;

import static common.JDBCTemp.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import banner.model.vo.Banner;
import declare.model.vo.DBo;

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
				banner.setBannerRename(rset.getString("banner_rename"));
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

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from banner";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
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

	public ArrayList<Banner> selectList(Connection conn, int currentPage, int limit) {
		ArrayList<Banner> list = new ArrayList<Banner>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from (select rank() over(order by banner_no desc) rnum, banner_no, banner_title, banner_chk, banner_ok, banner_original, "
				+ "banner_rename, banner_size from  banner)  where rnum >= ? and rnum <= ?";

		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Banner banner = new Banner();

				banner.setBannerNo(rset.getInt("banner_no"));
				banner.setBannerTitle(rset.getString("banner_title"));
				banner.setBannerChk(rset.getString("banner_chk"));
				banner.setBannerOk(rset.getString("banner_ok"));
				banner.setBannerOriginal(rset.getString("banner_original"));
				banner.setBannerRename(rset.getString("banner_rename"));
				banner.setBannerSize(rset.getString("banner_size"));

				list.add(banner);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deleteBanner(Connection conn, int bannerNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from banner where banner_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bannerNo);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertBanner(Connection conn, Banner banner) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into banner values((select max(banner_no)+1 from banner),?,default,default,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, banner.getBannerTitle());
			pstmt.setString(2, banner.getBannerOriginal());
			pstmt.setString(3, banner.getBannerRename());
			pstmt.setString(4, banner.getBannerSize());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateBanner(Connection conn, Banner banner) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update banner set banner_title = ?, banner_chk = ?, "
				+ "banner_ok = ?, banner_original = ?, banner_rename = ?  where banner_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, banner.getBannerTitle());
			pstmt.setString(2, banner.getBannerChk());
			pstmt.setString(3, banner.getBannerOk());
			pstmt.setString(4, banner.getBannerOriginal());
			pstmt.setString(5, banner.getBannerRename());
			pstmt.setInt(6, banner.getBannerNo());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Banner selectOne(Connection conn, int bannerNo) {
		Banner banner = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = "select * from banner where banner_no = ?";
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bannerNo);
			
			rset = pstmt.executeQuery();

			if (rset.next()) {
				banner = new Banner();

				banner.setBannerNo(bannerNo);
				banner.setBannerTitle(rset.getString("banner_title"));
				banner.setBannerChk(rset.getString("banner_chk"));
				banner.setBannerOk(rset.getString("banner_ok"));
				banner.setBannerOriginal(rset.getString("banner_original"));
				banner.setBannerRename(rset.getString("banner_rename"));
				banner.setBannerSize(rset.getString("banner_size"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(pstmt);
		}
		return banner;
	}
		
	
	

}
