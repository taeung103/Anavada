package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
        String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
        String AuthenticationUser = request.getParameter("AuthenticationUser");
        if(!AuthenticationKey.equals(AuthenticationUser))
        {
            System.out.println("인증번호 일치하지 않음");
            request.setAttribute("msg", "인증번호가 일치하지 않습니다");
            request.setAttribute("loc", "views/member/idpwd_find.jsp");
            request.getRequestDispatcher("/anavada/login.cp").forward(request, response);
            return;
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
