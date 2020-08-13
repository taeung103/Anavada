package admin.declare.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.declare.model.service.DeclareService;
import admin.declare.model.vo.Declare;

/**
 * Servlet implementation class DeclareAdminInsertServlet
 */
@WebServlet("/dinsert.ad")
public class DeclareAdminInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeclareAdminInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 신고자등록 처리용 컨트롤러
				request.setCharacterEncoding("utf-8");
				
				Declare declare = new Declare();
				declare.setDeclareId(request.getParameter("blackid"));
				declare.setDeclareOk(request.getParameter("controller"));
				//declare.setDeclareCount(Integer.parseInt(request.getParameter("count")));
				System.out.println(request.getParameter("blackid"));
				
				int result = new DeclareService().insertDeclare(declare);
				System.out.println(declare);
				if(result > 0 ) {
					response.sendRedirect("dlist.ad");
				}else {
					RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", "블랙회원 등록 실패");
					view.forward(request, response);
				}
	}

}
