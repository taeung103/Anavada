package cboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cboard.model.service.CboardService;
import cboard.model.vo.Cboard;

/**
 * Servlet implementation class CboardDetailViewServlet
 */
@WebServlet("/cdetail")
public class CboardDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CboardDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cboardNum = Integer.parseInt(request.getParameter("cnum"));
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		String local = request.getParameter("local");
		String search = request.getParameter("search");
		String keyword = request.getParameter("keyword");
		
		CboardService cservice = new CboardService();
		
		int allListCount = cservice.getAllListCount();
		
		cservice.addReadCount(cboardNum);
		
		Cboard cboard = cservice.selectCBoard(cboardNum);

		RequestDispatcher view = null;
		if (cboard != null) {
			view = request.getRequestDispatcher("views/cboard/community_view.jsp");
			request.setAttribute("cboard", cboard);
			request.setAttribute("page", currentPage);
			request.setAttribute("local", local);
			request.setAttribute("search", search);
			request.setAttribute("keyword", keyword);
			request.setAttribute("allListCount", allListCount);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "error");
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
