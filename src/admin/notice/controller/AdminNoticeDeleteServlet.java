package admin.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class AdminNoticeDeleteServlet
 */
@WebServlet("/andelete")
public class AdminNoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] checkRow = request.getParameter("checkRow").split(",");
		System.out.println(request.getParameter("checkRow")+", "+checkRow.length);
		
		int[] checkedNum = new int[checkRow.length];
		for(int i=0; i<checkRow.length; i++) {
			checkedNum[i] = Integer.parseInt(checkRow[i]);
			System.out.print(checkedNum[i]+", ");
		}System.out.println();
		
		int result = new NoticeService().deleteNotice(checkedNum);

		if(result > 0)
			response.sendRedirect("anlist");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
