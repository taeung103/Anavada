package creply.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import creply.model.service.CreplyService;
import creply.model.vo.Creply;

/**
 * Servlet implementation class CreplyWriteServlet
 */
@WebServlet("/crwrite.ss")
public class CreplyWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreplyWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int cboardNum = Integer.parseInt(request.getParameter("cnum"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		Creply creply = new Creply();
		
		creply.setCbaordNo(cboardNum);
		creply.setMemberId(writer);
		creply.setCreplyContent(content);
		
		int result = new CreplyService().insertCreply(creply);
		
		System.out.println(cboardNum);
		System.out.println(writer);
		System.out.println(content);
		
		RequestDispatcher view = null;
		if (result > 0) {
			response.sendRedirect("/anavada/cdetail?cnum=" + cboardNum);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("messgae", "새 게시들 등록 처리 실패");
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
