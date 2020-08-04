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
	
}
