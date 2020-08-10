package inquiry.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inquiry.model.service.InquiryService;
import inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryDetailServlet
 */
@WebServlet("/idetail.ss")
public class InquiryDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Inquiry inquiry = new InquiryService().selectOne(Integer.parseInt(request.getParameter("no")));
		
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		String selected = null;
		String keyword = null;
		if(request.getParameter("selected") != null && request.getParameter("keyword") != null) {
			selected = request.getParameter("selected");
			keyword = request.getParameter("keyword");
		}
		
		if(inquiry != null) {
			RequestDispatcher view = request.getRequestDispatcher("views/inquiry/inquiry_view.jsp");
			request.setAttribute("inquiry", inquiry);
			request.setAttribute("page", currentPage);
			request.setAttribute("selected", selected);
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
