package jboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jboard.model.service.CommentService;
import jboard.model.vo.Comment;

/**
 * Servlet implementation class JboardCommentListServlet
 */
@WebServlet("/jbclist")
public class JboardCommentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JboardCommentListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				//뷰로 내보내는 값에 한글이 있다면 인코딩 처리함
				response.setContentType("text/html; charset=UTF-8");
				
				int jboardNo = Integer.parseInt(request.getParameter("jboardno"));
				ArrayList<Comment> list = new CommentService().CommentList(jboardNo);
				CommentService jbservice = new CommentService();
				
				int listCount = jbservice.getCommentCount(jboardNo);
				
				RequestDispatcher view = null;
				if(list.size() > 0) {
					
					view = request.getRequestDispatcher("views/jboard/product_view.jsp");
					request.setAttribute("list", list);
					view.forward(request, response);
				}else {
					view = request.getRequestDispatcher("views/common/error.jsp");
					request.setAttribute("message", "조회된 공지사항 목록이 없습니다.");
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
