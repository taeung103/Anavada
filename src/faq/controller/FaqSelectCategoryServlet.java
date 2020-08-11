package faq.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import faq.model.service.FaqService;
import faq.model.vo.Faq;

/**
 * Servlet implementation class FaqSearchServlet
 */
@WebServlet("/fselect")
public class FaqSelectCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqSelectCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cate = null;
		cate = request.getParameter("category");
		
		ArrayList<Faq> list = null;
		FaqService fservice = new FaqService();
		
		int cNum = 0;
		if(request.getParameter("cate") != null)
		cNum = Integer.parseInt(request.getParameter("cate"));
		
		if(cNum == 10) {
			list = fservice.selectAll(); System.out.println("1"); System.out.println(list.size());
			
			RequestDispatcher view = request.getRequestDispatcher("views/notice/faq_list.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		
		}
		else if(cate != null) {
			int no = 0;System.out.println("1");
			switch(cate) {
			case "회원정보" : no = 1; break;
			case "중고거래" : no = 2; break;
			case "커뮤니티" : no = 3; break;
			case "지역축제" : no = 4; break;
			}
			
			list = fservice.selectCategory(no);
		}
		else if(cate.equals("전체")) {
			list = fservice.selectAll();System.out.println("2");}

		
		JSONObject sendJSON = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Faq f : list) {
			JSONObject job = new JSONObject();
			
			job.put("title", URLEncoder.encode(f.getFaqTitle(), "utf-8"));
			job.put("date", f.getFaqDate().toString());
			job.put("content", URLEncoder.encode(f.getFaqContent(), "utf-8"));
			job.put("cate", f.getFaqCategory());
			
			jarr.add(job);
		}
		
		sendJSON.put("list", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.write(sendJSON.toJSONString());
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
