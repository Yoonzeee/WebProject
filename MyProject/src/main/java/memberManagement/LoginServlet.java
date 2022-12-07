package memberManagement;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init 메서드 호출");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("destroy 메서드 호출");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		MemberDAO dao = new MemberDAO();
		PrintWriter out = response.getWriter();
		
		String uid = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		MemberBean bean = dao.loginMember(uid, pwd);

		HttpSession session = request.getSession();
		
		System.out.println("아이디: " + uid);
		System.out.println("비밀번호: " + pwd);
		
			if(bean != null && bean.getUid() != null) {
				session.setAttribute("uid", bean.getUid());
				session.setAttribute("name", bean.getName());
				
				// 회원수정
				response.sendRedirect("jsp/member/updateMember.jsp");
//				// 회원탈퇴
//				response.sendRedirect("jsp/member/deleteMember.jsp");
//				// 가입한 회원 목록
//				response.sendRedirect("list");
				// 비밀번호 찾기
//				response.sendRedirect("jsp/member/searchPwdForm.jsp");
//				// 마이페이지
//				response.sendRedirect("myPage");
//				out.print("안녕하세요 " + uid +" 님!!!");
			} else {
				response.sendRedirect("jsp/member/loginForm.jsp");
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
