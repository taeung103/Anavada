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
 * Servlet implementation class CreplyDeleteServlet
 */
@WebServlet("/crdelete")
public class CreplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreplyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int creplyNum = Integer.parseInt(request.getParameter("crnum"));
		int cboardNum = Integer.parseInt(request.getParameter("cnum"));
		int depth = Integer.parseInt(request.getParameter("depth"));
		
		CreplyService crservice = new CreplyService();
		int result = crservice.deleteCreply(creplyNum, depth);
		
		if (result > 0) {
			response.sendRedirect("/anavada/cdetail?cnum=" + cboardNum);
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
