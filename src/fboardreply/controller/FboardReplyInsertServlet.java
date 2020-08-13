package fboardreply.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fboardreply.model.service.FboardReplyService;
import fboardreply.model.vo.FboardReply;

/**
 * Servlet implementation class FboardReplyInsertServlet
 */
@WebServlet("/fbreplyinsert.ss")
public class FboardReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FboardReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글 등록하기
		System.out.println("FboardReplyInsertServlet");
		
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		
		String boardNo = request.getParameter("boardno");

		String replyContent = request.getParameter("replyContent");
		String memberId =request.getParameter("memberid");
		
		//memberId = "user01";	//전송이 null로 와서 일단 임시방편
		
		System.out.println("전송 온 값 : " + boardNo + ", " + memberId + ", " + replyContent);
		
	
		FboardReply reply = new FboardReply();
		 
		 reply.setFboardNo(boardNo); reply.setFboardReplyContent(replyContent);
		 reply.setMemberId(memberId); reply.setFboardReplyLev(1);
		 reply.setFboardReplyRef(Integer.parseInt(boardNo)); //댓글은 게스글 번호, 대댓글은 부모댓글 번호
		
		 int result = new FboardReplyService().insertFboardReply(reply);
		  
		 System.out.println("댓글 insert: " + result);
		/*
		 * response.setContentType("application/text; charset=utf-8"); PrintWriter out =
		 * response.getWriter(); out.write(result);
		 */
	}

}
