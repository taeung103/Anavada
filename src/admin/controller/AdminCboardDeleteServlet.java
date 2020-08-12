package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cboard.model.service.CboardService;

/**
 * Servlet implementation class AdminCboardDeleteServlet
 */
@WebServlet("/adcdelete.ad")
public class AdminCboardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCboardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String check = request.getParameter("checkarr");
		String[] splitCheck = check.split(",");
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (String checkstr : splitCheck) { // 반복1
			list.add(Integer.parseInt(checkstr));
		}
		for (Integer integer : list) { // 반복2
			System.out.println(integer);
		}
		
		CboardService cservice = new CboardService();
		
		for (Integer deleteChk : list) { // 반복3?
			cservice.deleteCboard(deleteChk);
		}
		
		PrintWriter writer = response.getWriter();
		writer.print("yo");
		writer.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
