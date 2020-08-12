package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import member.model.vo.Member;
import static common.JDBCTemp.*;

public class MemberDao {

	public MemberDao() {}

	public Member loginCheck(Connection conn, String memberId, String memberPwd) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where member_id = ? and member_pwd = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				
				member.setMemberId(memberId);
				member.setMemberPwd(memberPwd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int insertMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into member values(?, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getmNumber());
			pstmt.setString(2, member.getMemberId());
			pstmt.setString(3, member.getMemberPwd());
			pstmt.setString(4, member.getMemberName());
			pstmt.setString(5, member.getMemberEmail());
			pstmt.setString(6, member.getEmailAuth());
			pstmt.setString(7, member.getMemberPhone());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectCheckId(Connection conn, String memberId) {
		int idChk = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(member_id) from member where member_id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				idChk = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return idChk;
	}

	public Member selectMyInfo(Connection conn, String memberId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where member_id = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				member.setMemberId(memberId);
				member.setMemberName(rset.getString("member_name"));
				member.setMemberEmail(rset.getString("member_email"));
				member.setEmailAuth(rset.getString("emailAuth"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setJoinDate(rset.getDate("join_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}


	public Member selectMember(Connection conn, String memberId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				member.setMemberId(memberId);
				member.setMemberPwd(rset.getString("member_pwd"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberEmail(rset.getString("member_email"));
				member.setEmailAuth(rset.getString("emailauth"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setJoinDate(rset.getDate("join_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set member_pwd = ?, member_name = ?, member_email = ?, emailauth = ?, member_phone = ? where member_id = ?"; 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberPwd());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getMemberEmail());
			pstmt.setString(4, member.getEmailAuth());
			pstmt.setString(5, member.getMemberPhone());
			pstmt.setString(6, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection conn, String memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from member where member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public Member memberFind(Connection conn, String memberEmail) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String quest = "select * from member where member_email like ?";
		
		try {
			pstmt = conn.prepareStatement(quest);
			pstmt.setString(1, memberEmail);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				member.setMemberEmail(memberEmail);
				member.setMemberPhone(rset.getString("member_phone"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int userPwdUpdate(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set member_pwd = ? where member_id = ?"; 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberPwd());
			pstmt.setString(2, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMemberPwd(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update member set member_pwd = ? where member_id = ?"; 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getNewPwdOK());
			pstmt.setString(2, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Member> selectAllList(Connection conn, int currentPage, int limit, String search, String keyword) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, MNUM, MEMBER_ID, MEMBER_PWD, MEMBER_NAME, " + 
				"MEMBER_EMAIL, EMAILAUTH, MEMBER_PHONE, JOIN_DATE, LAST_ACCESS_DATE " + 
				"FROM (SELECT * FROM MEMBER ORDER BY JOIN_DATE DESC)) LEFT JOIN DECLARE_ADMIN ON (MEMBER_ID = DECLARE_ID)" +
				(search != null && search.equals("userId") ? "and MEMBER_ID like ? " : "") +
				(search != null && search.equals("userName") ? "and MEMBER_NAME like ? " : "") +
				(search != null && search.equals("userEmail") ? "and MEMBER_EMAIL like ? " : "") +
				(search != null && search.equals("userPhone") ? "and MEMBER_PHONE like ? " : "") +
				"WHERE RNUM >= ? AND RNUM <= ?";
	       
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1; //51에 -1을 해서 50까지만 보여지게
		
		try {
			int pstmtnum = 1;
			pstmt = conn.prepareStatement(query);
			if ((search != null && search.equals("")) || (search != null && search.equals("userId")) 
				 || (search != null && search.equals("userName")) || (search != null &&search.equals("userEmail"))
				 || (search != null && search.equals("userPhone")) ) {
				 pstmt.setString(pstmtnum++, "%" + keyword + "%");
			}
			pstmt.setInt(pstmtnum++, startRow);
			pstmt.setInt(pstmtnum++, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				member.setmNumber(rset.getString("mnum"));
				member.setMemberId(rset.getString("member_id"));
				member.setMemberPwd(rset.getString("member_pwd"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberEmail(rset.getString("member_email"));
				member.setEmailAuth(rset.getString("emailauth"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setJoinDate(rset.getDate("join_date"));
				member.setLastAccessDate(rset.getDate("last_access_date"));
				member.setDeclareOK(rset.getString("declare_ok"));
				
				list.add(member);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from member";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public ArrayList<Member> selectLeaveList(Connection conn, int currentPage, int limit, String search, String keyword) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, SSNUM, SECESSION_ID, SECESSION_PWD, SECESSION_NAME, " + 
				"SECESSION_EMAIL, SECESSION_PHONE, MJOIN_DATE, SECESSION_DATE " + 
				"FROM (SELECT * FROM SECESSION ORDER BY SECESSION_DATE DESC))" +
				(search != null && search.equals("userId") ? "and MEMBER_ID like ? " : "") +
				(search != null && search.equals("userName") ? "and MEMBER_NAME like ? " : "") +
				(search != null && search.equals("userEmail") ? "and MEMBER_EMAIL like ? " : "") +
				(search != null && search.equals("userPhone") ? "and MEMBER_PHONE like ? " : "") +
				"WHERE RNUM >= ? AND RNUM <= ?";
	       
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1; //51에 -1을 해서 50까지만 보여지게
		
		try {
			int pstmtnum = 1;
			pstmt = conn.prepareStatement(query);
			if ((search != null && search.equals("")) || (search != null && search.equals("userId")) 
				 || (search != null && search.equals("userName")) || (search != null &&search.equals("userEmail"))
				 || (search != null && search.equals("userPhone")) ) {
				 pstmt.setString(pstmtnum++, "%" + keyword + "%");
			}
			pstmt.setInt(pstmtnum++, startRow);
			pstmt.setInt(pstmtnum++, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member member = new Member();
				member.setmNumber(rset.getString("ssnum"));
				member.setMemberId(rset.getString("secession_id"));
				member.setMemberPwd(rset.getString("secession_pwd"));
				member.setMemberName(rset.getString("secession_name"));
				member.setMemberEmail(rset.getString("secession_email"));
				member.setMemberPhone(rset.getString("secession_phone"));
				member.setJoinDate(rset.getDate("mjoin_date"));
				member.setSecessionDate(rset.getDate("secession_date"));
				
				list.add(member);				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
