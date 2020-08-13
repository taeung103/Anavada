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
 * Servlet implementation class JboardCommentInsertServlet
 */
@WebServlet("/jbcinsert.ss")
public class JboardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JboardCommentInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 댓글 등록 처리용 컨트롤러

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int jboardNo = Integer.parseInt(request.getParameter("jboardno"));

		String commentId = request.getParameter("commentid");
		String commentContent = request.getParameter("commentcontent");

		CommentService jbcservice = new CommentService();
		Comment reply = new Comment();
		reply.setJboardNo(jboardNo);
		reply.setCommentContent(commentContent);
		reply.setCommentId(commentId);


		int result = jbcservice.insertComment(reply);
		
		if (result > 0 ) {
			response.sendRedirect("/anavada/jbdetail?jboardno=" + jboardNo);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", jboardNo + "번 댓글 등록 실패 !");
			view.forward(request, response);
		}
	}

}
