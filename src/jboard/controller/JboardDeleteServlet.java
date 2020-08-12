package jboard.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import jboard.model.service.JboardService;

/**
 * Servlet implementation class JboardDeleteServlet
 */
@WebServlet("/jbdelete")
public class JboardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JboardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 삭제시 저장된 파일도 같이 삭제함
		int jboardNo = Integer.parseInt(request.getParameter("jboardno"));
		if (new JboardService().jboardDelete(jboardNo) > 0) {
			for(int i=1; 1<5 ; i++) {
				String renameFileName = request.getParameter("rfile"+i);
					if(renameFileName != null) {
						String savePath = request.getSession().getServletContext().getRealPath("/resources/jboardfiles");
						new File(savePath + "\\" + renameFileName).delete();
			}
					response.sendRedirect("/anavada/jblist?page=1");
			}
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
