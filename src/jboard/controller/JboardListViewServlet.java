package jboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jboard.model.service.JboardService;
import jboard.model.vo.Jboard;

/**
 * Servlet implementation class JboardListViewServlet
 */
@WebServlet("/jblist")
public class JboardListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 2L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JboardListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				int currentPage = 1;
				if (request.getParameter("page") != null) {
						currentPage = Integer.parseInt(request.getParameter("page"));
				}
				
				int limit = 10;
				
				JboardService jbservice = new JboardService();
				
				int listCount = jbservice.getListCount();
				
				ArrayList<Jboard> list = jbservice.selectList(currentPage, limit);
				for (Jboard jboard : list) {
					System.out.println(jboard);
				}
				int maxPage = (int)((double)listCount / limit + 0.9);
				int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
				int endPage = startPage + limit -1;
				if (maxPage < endPage) {
						endPage = maxPage;
				}
				RequestDispatcher view = null;
				if (list.size() > 0 ) {
						view = request.getRequestDispatcher("views/jboard/product_list.jsp");
						request.setAttribute("list", list);
						request.setAttribute("currentPage", currentPage);
						request.setAttribute("maxPage", maxPage);
						request.setAttribute("startPage", startPage);
						request.setAttribute("endPage", endPage);
						request.setAttribute("listCount", listCount);
						view.forward(request, response);
						
				}else {
						view = request.getRequestDispatcher("views/common/error.jsp");
						request.setAttribute("message",  currentPage + " 페이지에 대한 목록 조회 실패!");
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
