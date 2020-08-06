package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberMypageServlet
 */
@WebServlet("/mupdate.ss")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		Member member = new Member();
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberPwd(request.getParameter("memberPwd"));
		member.setMemberName(request.getParameter("memberName"));
		member.setMemberOriginal(request.getParameter("memberOriginal"));
		member.setMemberRename(request.getParameter("memberRename"));
		member.setMemberEmail(request.getParameter("memberEmail"));
		member.setEmailAuth(request.getParameter("emailAuth"));
		member.setMemberPhone(request.getParameter("memberPhone"));
		
		int result = new MemberService().updateMember(member);

		if(result > 0) {
			//myinfo 서블릿을 실행해서, 내 정보보기 페이지를 내보냄
			response.sendRedirect("/anavada/mypage.ss?memberId=" + member.getMemberId());
		} else { // 수정 실패시
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", member.getMemberId() + " 회원의 정보 수정 실패.");
			view.forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
