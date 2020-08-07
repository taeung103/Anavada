package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class MemberMypageServlet
 */
@WebServlet("/mfind")
public class MemberFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberFindServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

	    String memberEmail = request.getParameter("memberEmail");
		String memberPhone = request.getParameter("memberPhone");
		
		// 먼저 email로 회원정보를 받아오고 가져온 데이터에서 phone값을 비교하여 존재하지 않으면 인증메일 보내지 못함
	    Member member = new MemberService().memberFind(memberEmail);
	    System.out.println(member);
	    
		if(member == null || !member.getMemberEmail().equals(memberPhone)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('이메일 또는 전화번호가 일치하지 않습니다.\\n다시 입력해주세요.'); location.href=document.referrer;</script>");
			writer.close();
            
		}
			// mail server 설정
			String host = "smtp.naver.com";
			String user = "taeung103@naver.com"; // 자신의 네이버 계정
			String password = "r4676rhd!!";// 자신의 네이버 패스워드

			// 메일 받을 주소
			String to_email = member.getMemberEmail();

			
			// SMTP 서버 정보를 설정한다.
			Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", 465);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.ssl.enable", "true");

			// 인증 번호 생성기
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					// a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					// A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					// 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			String AuthenticationKey = temp.toString();
			System.out.println(AuthenticationKey);

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			// email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "Anavada"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

				// 메일 제목
				msg.setSubject("Anavada 회원 임시비밀번호입니다.");
				// 메일 내용
				msg.setText("안녕하세요. Anavada 입니다.<br/>"
							+ "회원님의 인증번호는 : " + temp + "입니다.<br/>"
							+ "임시비밀번호로 로그인 후 마이페이지에서<br/>"
							+ "꼭 비밀번호를 변경하시기 바랍니다.");

				Transport.send(msg);
				System.out.println("인증번호 이메일 전송 완료.");

			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
			 HttpSession saveKey = request.getSession();
	         saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
	         //패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
	         request.setAttribute("id", memberPhone);
	         request.getRequestDispatcher("/anavada/pwdChange");
			
			 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
