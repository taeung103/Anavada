package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		
		String query = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getMemberOriginal());
			pstmt.setString(5, member.getMemberRename());
			pstmt.setString(6, member.getMemberEmail());
			pstmt.setString(7, member.getEmailAuth());
			pstmt.setString(8, member.getMemberPhone());
			
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

	public Member selectMember(Connection conn, String memberId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String quest = "select * from member where member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(quest);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				member.setMemberId(memberId);
				member.setMemberPwd(rset.getString("member_pwd"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberOriginal(rset.getString("member_original"));
				member.setMemberRename(rset.getString("member_rename"));
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
		
		String query = "update member set member_pwd = ?, member_name = ?, member_original = ?, member_rename = ?, member_email = ?, emailauth = ?, member_phone = ? where member_id = ?"; 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberPwd());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getMemberOriginal());
			pstmt.setString(4, member.getMemberRename());
			pstmt.setString(5, member.getMemberEmail());
			pstmt.setString(6, member.getEmailAuth());
			pstmt.setString(7, member.getMemberPhone());
			pstmt.setString(8, member.getMemberId());
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
				member.setMemberId(rset.getString("member_id"));
				member.setMemberPwd(rset.getString("member_pwd"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberOriginal(rset.getString("member_original"));
				member.setMemberRename(rset.getString("member_rename"));
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

}
