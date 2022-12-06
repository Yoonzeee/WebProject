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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("uid");
		String pwd = request.getParameter("pwd");
		
		System.out.println("아이디: " + id);
		System.out.println("비밀번호: " + pwd);
		
		if(id != null && (id.length() != 0)) {
			if(id.equals("admin")) {
				out.print("<html>");
				out.print("<body>");
				out.print("<font size='12> 관리자로 로그인 하셨습니다!! </font>");
				out.print("<br>");
				out.print("<input type=submit value='회원정보 수정하기' />");
				out.print("<input type=submit value='회원정보 삭제하기' />");
				out.print("</body>");
				out.print("</html>");
			} else {
				out.print("<html>");
				out.print("<body>");
				out.print(id + "님!! 로그인하셨습니다.");
				out.print("</body>");
				out.print("</html>");
			}
		} else {
			out.print("<html>");
			out.print("<body>");
			out.print("ID와 비밀번호를 입력하세요!!");
			out.print("<br>");
			out.print("<a href='localhost:8880/MyProject/jsp/member/loginForm.jsp'>로그인창으로 이동</a>");
			out.print("</body>");
			out.print("</html>");
		}
	}

}
