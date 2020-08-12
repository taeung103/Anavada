package admin.declare.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import admin.declare.model.service.DeclareService;
import admin.declare.model.vo.Declare;

/**
 * Servlet implementation class DeclareAdminCountUpServlet
 */
@WebServlet("/dcountup")
public class DeclareAdminCountUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeclareAdminCountUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Declare> list = new DeclareService().countUp();
		String no = request.getParameter("no");
		System.out.println("no :" + no);
		
		
		JSONObject sendJSON = new JSONObject();
		JSONArray jarr = new JSONArray();
		for(Declare declare : list) {
			JSONObject job = new JSONObject();
			job.put("count", declare.getDeclareCount());
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
