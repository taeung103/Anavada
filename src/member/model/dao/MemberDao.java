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
				member.setMemberName(rset.getString("memberName"));
				member.setMemberOriginal(rset.getString("memberOriginal"));
				member.setMemberRename(rset.getString("memberRename"));
				member.setJoinDate(rset.getDate("joinDate"));
				member.setLastAccessDate(rset.getDate("lastAccessDate"));
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
