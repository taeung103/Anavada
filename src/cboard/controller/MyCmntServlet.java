package cboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cboard.model.service.CboardService;
import cboard.model.vo.Cboard;

/**
 * Servlet implementation class MyCmntServlet
 */
@WebServlet("/mycmnt")
public class MyCmntServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyCmntServlet() {
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
		String local = "0";
		if (request.getParameter("local") != null) {
			local = request.getParameter("local");
		}
		String memberID = request.getParameter("memberID");
		String search = request.getParameter("search");
		String keyword = request.getParameter("keyword");
		System.out.println("memberID : " + memberID);
		System.out.println("page : " + currentPage);
		System.out.println("local : " + local);
		System.out.println("search : " + search);
		System.out.println("keyword : " + keyword);
		int limit = 10;
		CboardService cservice = new CboardService();
		int listCount = cservice.getMyListCount(memberID, local, search, keyword);

		ArrayList<Cboard> list = cservice.mySelectList(memberID, currentPage, limit, local, search, keyword);

		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		for (Cboard cboard : list) {
			System.out.println(cboard);
		}

		RequestDispatcher view = null;
		if (list.size() > 0) {
			view = request.getRequestDispatcher("views/member/MyCmnt.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			request.setAttribute("local", local);
			request.setAttribute("search", search);
			request.setAttribute("keyword", keyword);
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/member/MyCmnt.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			request.setAttribute("local", local);
			request.setAttribute("search", search);
			request.setAttribute("keyword", keyword);
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
