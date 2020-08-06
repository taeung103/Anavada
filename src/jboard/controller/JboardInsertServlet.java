package jboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import jboard.model.service.JboardService;
import jboard.model.vo.Jboard;


/**
 * Servlet implementation class JboardInsertServlet
 */
@WebServlet("/jbinsert")
public class JboardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 22L;

    /**
     * Default constructor. 
     */
    public JboardInsertServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		RequestDispatcher view = null;
		if (!ServletFileUpload.isMultipartContent(request)) { 
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "form 의 enctype='multipart/form-data' 속성 누락됨");
			view.forward(request, response);
		}

		int maxSize = 1024 * 1024 * 5; //용량 5메가로 제한

		String savePath = request.getSession().getServletContext().getRealPath("/resources/jboardfiles");
		// 4. request 를 MultipartRequest 로 변환해야 함
		// cos.jar 가 제공하는 클래스를 사용함
		// 전송온 파일은 자동 지정 폴더에 저장됨
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());


		Jboard jboard = new Jboard();
		jboard.setJboardPost(mrequest.getParameter("post"));
		jboard.setJboardMeet(mrequest.getParameter("meet"));
		jboard.setLocalNo(mrequest.getParameter("location"));
		jboard.setJboardTitle(mrequest.getParameter("title"));
		jboard.setJboardPrice(Integer.parseInt(mrequest.getParameter("price")));
		jboard.setJboardContent(mrequest.getParameter("content"));

		
		String originalFileName1 = mrequest.getFilesystemName("ofile1");
		jboard.setJboardOrignalFilePath1(originalFileName1);
		if (originalFileName1 != null) {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHHmmss");
			String renameFileName1 = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			renameFileName1 += "." + originalFileName1.substring(originalFileName1.lastIndexOf(".") + 1);
			File originFile = new File(savePath + "\\" + originalFileName1);
			File renameFile = new File(savePath + "\\" + renameFileName1);

			if (!originFile.renameTo(renameFile)) {
				FileInputStream fin = new FileInputStream(originFile);
				FileOutputStream fout = new FileOutputStream(renameFile);
				int data = -1;
				byte[] buffer = new byte[1024];
				while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
					fout.write(buffer, 0, buffer.length);
				}

				fin.close();
				fout.close();
				originFile.delete(); 
			} 
			jboard.setJboardRenameFilePath1(renameFileName1);
		}

		// 6.서비스 객체 생성하고 메소드로 notice 객체 전달하고
		// 처리된 결과 받기
		int result = new JboardService().insertJboard(jboard);

		// 7.받은 결과로 성공/실패 페이지 내보내기
		if (result > 0) {
			response.sendRedirect("blist?page=1");
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "새 게시원글 등록 실패!");
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
