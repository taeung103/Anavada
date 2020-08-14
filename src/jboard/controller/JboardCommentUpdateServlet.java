package jboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jboard.model.service.CommentService;
import jboard.model.vo.Comment;

/**
 * Servlet implementation class JboardCommentUpdateServlet
 */
@WebServlet("/jbcupdate.ss")
public class JboardCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JboardCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int jboardNo = Integer.parseInt(request.getParameter("jboardno"));
		Comment reply = new Comment();
		reply.setCommentNo(Integer.parseInt(request.getParameter("commentno")));
		reply.setCommentContent(request.getParameter("content"));
		
		int result = new CommentService().updateComment(reply);
		System.out.println("테스트");
		if (result > 0) {
				response.sendRedirect("/anavada/jbdetail?jboardno=" + jboardNo);
		}else {
				RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
				request.setAttribute("message", reply.getCommentNo() + "번 댓글 수정 실패!");
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
