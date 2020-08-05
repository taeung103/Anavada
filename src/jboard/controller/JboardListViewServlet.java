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
@WebServlet("/jblistview")
public class JboardListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		// 페이지별로 출력되는 게시글 전체 조회 처리용 컨트롤러
		
				//페이지 기본값 지정
				int currentPage = 1;
				// 전송온 페이지값 추출
				if (request.getParameter("page") != null) {
						currentPage = Integer.parseInt(request.getParameter("page"));
				}
				
				//한 페이지당 출력할 목록 갯수 지정
				int limit = 10;
				
				JboardService jbservice = new JboardService();
				
				//전체 목록 갯수 조회
				
				int listCount = jbservice.getListCount();
				
				//현재 페이지에 출력할 게시글 목록 조회
				
				ArrayList<Jboard> list = jbservice.selectList(currentPage, limit);
				
				//뷰에 출력될 총 페이지 수 계산 : 게시글이 1개이면 1페이지임
				int maxPage = (int)((double)listCount / limit + 0.9);
				//현재 페이지가 속한 그룹의 시작 페이지 수 지정
				//예 : currentPage  가 35이면 페이지그룹이 10일때 시작페이지는 31이됨
				int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
				
				int endPage = startPage + limit -1;
				if (maxPage < endPage) {
						endPage = maxPage;
				}
				
				RequestDispatcher view = null;
				if (list.size() > 0 ) {
						view = request.getRequestDispatcher("views/board/boardListView.jsp");
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
