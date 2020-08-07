package member.model.service;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Member;

import static common.JDBCTemp.*;

public class MemberService {
	//의존성 주입(DI)
	public MemberDao mdao = new MemberDao();
			
	public MemberService() {}
	
	public Member loginCheck(String memberId, String memberPwd) {
		Connection conn = getConnection();
		Member member = mdao.loginCheck(conn, memberId, memberPwd);
		close(conn);
		return member;
	}

	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = mdao.insertMember(conn, member);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int selectCheckId(String memberId) {
		Connection conn = getConnection();
		int idChk = mdao.selectCheckId(conn, memberId);
		close(conn);
		return idChk;
	}

	public Member selectMember(String memberId) {
		Connection conn = getConnection();
		Member member = mdao.selectMember(conn, memberId);
		close(conn);
		return member;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = mdao.updateMember(conn, member);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn = getConnection();
		int result = mdao.deleteMember(conn, memberId);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	public Member memberFind(String memberEmail) {
		Connection conn = getConnection();
		Member member = mdao.memberFind(conn, memberEmail);
		close(conn);
		return member;
	}


	
}
