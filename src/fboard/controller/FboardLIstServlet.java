package fboard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import fboard.model.service.FboardService;
import fboard.model.vo.Fboard;


/**
 * Servlet implementation class FboardLIstServlet
 */
@WebServlet("/fblist")
public class FboardLIstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FboardLIstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전체 축제정보 가지고 오기
		
				ArrayList<Fboard> list = new FboardService().selectList();
				System.out.println("List : " + list.size());
				
				JSONObject sendJSON = new JSONObject();
				JSONArray jarr = new JSONArray();
				
				for(Fboard fboard : list) {
					JSONObject job = new JSONObject();
					
					job.put("fboardNo", fboard.getFboardNo());
					job.put("festivalTitle", URLEncoder.encode(fboard.getFestivalTitle(), "utf-8"));
					job.put("localNo", fboard.getLocalNo());
					job.put("festivalStartDate", fboard.getFestivalStartDate());
					job.put("festivalEndDate", fboard.getFestivalEndDate());
					job.put("fesivalModifiedDate", fboard.getFesivalModifiedDate());
					job.put("mapX", fboard.getMapX());
					job.put("mapY", fboard.getMapY());
					job.put("bModifiedDate", fboard.getbModifiedDate().toString());
					job.put("memberId", fboard.getMemberId());
					job.put("readcount", fboard.getReadcount());
					job.put("thumbnail", fboard.getThumbnail());
					job.put("localName", fboard.getLocalName());
					job.put("replycount", fboard.getReplycount());
					
					jarr.add(job);
				}	//for each
				
				sendJSON.put("list", jarr);
				
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.write(sendJSON.toJSONString());
				out.flush();
				out.close();
				
				System.out.println(sendJSON);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
