package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/pwdChange.cp")
public class PwdChangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdChangServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
        String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
        String memberEmail = request.getParameter("memberEmail");
        
        System.out.println(memberEmail);
        System.out.println(AuthenticationKey);
        
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
	    
        if(!AuthenticationKey.equals(memberEmail))
        {
            System.out.println("인증번호 일치하지 않음");
            System.out.println(memberEmail);
            System.out.println(AuthenticationKey);
            
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('인증번호 또는 비밀번호가 일치하지 않습니다.\\n다시 입력해주세요.'); location.href=document.referrer;</script>");
			writer.close();
            return;
        } else {
    		
    		if(result > 0) {
    			response.sendRedirect("/anavada/login.cp");
    		} else { // 수정 실패시
    			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
    			request.setAttribute("message", member.getMemberId() + " 회원의 정보 수정 실패.");
    			view.forward(request, response);
    		}
    	    
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
