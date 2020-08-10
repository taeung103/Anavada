package member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberMypageServlet
 */
@WebServlet("/mupdate.cp")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String savePath = request.getSession().getServletContext().getRealPath("/resources/memberfiles"); // 1. 업로드되는 파일의 저장 폴더 지정하기
		int maxSize = 1024 * 1024 * 10;	// 2. 업로드할 파일의 용량 제한 : 10Mbyte
		MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//회원정보 수정
		Member member = new Member();
		member.setMemberId(multi.getParameter("memberId"));
		member.setMemberPwd(multi.getParameter("memberPwd"));
		member.setMemberName(multi.getParameter("memberName"));
		member.setFileOriginal(multi.getParameter("fileOriginal"));
		member.setFileRename(multi.getParameter("fileRename"));
		member.setMemberEmail(multi.getParameter("memberEmail"));
		member.setEmailAuth(multi.getParameter("emailAuth"));
		member.setMemberPhone(multi.getParameter("memberPhone"));

		//서버에 업로드된 파일명 추출하기
		String fileOriginal = multi.getFilesystemName("fileOriginal"); //파일 명만 추출
		String filePath = savePath + "/" + fileOriginal; // 업로드한 파일의 전체 경로를 DB에 저장하기 위함
		member.setFileOriginal(fileOriginal); //파일 이름 저장

		System.out.println("member : " + member);
		System.out.println("fileOriginal : " + fileOriginal);
		System.out.println("filePath : " + filePath);
		
		//첨부된 파일의 파일명 바꾸기 하려면 ...
		//저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함.
		//"년월일시분초.확장자" 형식으로 변경해 봄
		if(fileOriginal != null) {
			//첨부파일이 있을 때만 이름 바꾸기 실행함
			
			//바꿀 파일명에 대한 포맷 문자열 만들기 : 년월일시분초 형식으로
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			
			//바꿀 파일명 만들기
			String fileRename = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			//업로드된 파일의 확장자를 추출해서 새 파일명에 붙여줌
			fileRename += "." + fileOriginal.substring(fileOriginal.lastIndexOf(".") + 1);// lastIndexOf 뒤에서 부터 계산하는게 빠르기 때문
			
			//원본 파일명 rename 처리를 위해서 File 객체 만들기
			File originFile = new File(savePath + "\\" + fileOriginal);
			File renameFile = new File(savePath + "\\" + fileRename);
			
			//이름 바꾸기 실행함
			if(!originFile.renameTo(renameFile)) { // .renameTo() 이름 바꾸기가 성공하면 true, 실패하면 false
				//.renameTo() 메소드가 실패(false)한 경우에 직접 바꾸기함
				//원본 파일 내용 읽어서, 복사본에 기록하고 완료되면 원본 파일 삭제
				FileInputStream fin = new FileInputStream(originFile);
				FileOutputStream fout = new FileOutputStream(renameFile);
				int date = -1;
				byte[] buffer = new byte[1024];
				
				while((date = fin.read(buffer, 0, buffer.length)) != -1) {
					fout.write(buffer, 0, buffer.length);
				}
				
				fin.close();
				fout.close();
				originFile.delete(); //원본 파일 삭제함
			} //직접 이름 바꾸기
			member.setFileRename(fileRename);
		} //업로드 파일이 있다면

		int result = new MemberService().updateMember(member);

		System.out.println("member : " + member);

		if(result > 0) {
			//myinfo 서블릿을 실행해서, 내 정보보기 페이지를 내보냄
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('수정되었습니다.'); location.href=document.referrer;</script>");
			writer.close();
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", member.getMemberId() + " 회원의 정보 수정 실패.");
			view.forward(request, response);
		}
		
	}
}
