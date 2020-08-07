package admin.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeUpNoticeServlet
 */
@WebServlet("/anupnotice")
public class AdminNoticeUpNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10;
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/noticefiles");
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		Notice notice = new Notice();
		notice.setNoNo(Integer.parseInt(mrequest.getParameter("no")));
		notice.setNoTitle(mrequest.getParameter("title"));
		notice.setNoContent(mrequest.getParameter("content"));
		
		String delCheck = mrequest.getParameter("delcheck");
		
		String ofileName = mrequest.getParameter("ofile");
		String rfileName = mrequest.getParameter("rfile");
		
		String newOfileName = mrequest.getParameter("upfile");
		
		File ofile = new File(savePath + "/" + rfileName);
		
		File newOfile = new File(savePath + "/" + newOfileName);
		
		if(newOfileName != null) {
			notice.setNoOriginal("newOfileName");
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String newRfileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			newRfileName += "." + newOfileName.substring(newOfileName.lastIndexOf(".")+1);
			
			File newRfile = new File(savePath + "/" + newRfileName);
			
			if(!newOfile.renameTo(newRfile)) {
				FileInputStream fin = new FileInputStream(newRfile);
				FileOutputStream fout = new FileOutputStream(newOfile);
				
				int data = -1;
				byte[] buffer = new byte[1024];
				while((data = fin.read(buffer, 0, buffer.length)) != -1) {
					fout.write(buffer, 0, buffer.length);
				}
				fin.close();
				fout.close();
				newOfile.delete();
			}
			notice.setNoRename(newRfileName);
			
			if(ofileName != null)
				ofile.delete();
			
		}else if(ofileName != null && delCheck != null && delCheck.equals("yes")) {
			notice.setNoOriginal(null);
			notice.setNoRename(null);
			ofile.delete();
		}else if(ofileName != null && (newOfileName == null || ofileName.equals(newOfileName) && newOfile.length() == ofile.length())) {
			
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
