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
		
				request.setCharacterEncoding("utf-8");
				
				int commentNo = Integer.parseInt(request.getParameter("bnum"));
				int jboardNo = Integer.parseInt(request.getParameter("jboardno"));//page
				
				String commentContent = request.getParameter("content");
				String commentId = request.getParameter("commentid");
				
				CommentService cservice = new CommentService();
				
				//등록될 댓글의 원글을 조회함
				Comment comment = cservice.selectComment(commentNo);
				
				//댓글 객체 생성함
				Comment reply = new Comment();
				reply.setCommentContent(commentContent);
				reply.setCommentId(commentId);
				reply.setCommentLevel(comment.getCommentLevel() + 1);
				reply.setCommentRef(comment.getCommentRef()); //참조하는 원글번호
				//board_reply_ref : 원글의 댓글일 때 자기번호
				// 대댓글일 때는 참조하는 댓글의 번호를 기억함
				if (reply.getCommentLevel() == 2) { //댓글의 댓글일 때
					reply.setCommentReplyRef(comment.getCommentReplyRef());
				}
				
				//댓글의 순번 처리
				reply.setCommentReplySeq(1); //최근 댓글이 무조건 1
				//이전 댓글의 순번은 모두 1증가 처리함
				cservice.updateReplySeq(reply);  // update 실행함
				
				//댓글 등록 처리함
				int result = cservice.insertComment(reply);
				
				if (result > 0 ) {
						response.sendRedirect("/anavada/jbdetail?jboardno=" + jboardNo);
				}else {
					RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", commentNo + "번 댓글 등록 실패 !");
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
