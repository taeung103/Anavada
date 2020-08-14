package jboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jboard.model.service.CommentService;


/**
 * Servlet implementation class JboardCommentDeleteServlet
 */
@WebServlet("/jbcdelete")
public class JboardCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JboardCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int commentNo = Integer.parseInt(request.getParameter("commentno"));
			int jboardNo = Integer.parseInt(request.getParameter("jboardno"));
			if(new CommentService().commentDelete(commentNo) > 0) {
				response.sendRedirect("/anavada/jbdetail?jboardno="+jboardNo);
			}else {
				RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
				request.setAttribute("message", jboardNo + "번 글 삭제 실패!");
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
