package memberManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("memberManagement/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		MemberDAO dao = new MemberDAO();
		List<MemberBean> list = dao.listMembers();
		
//		out.print("<html><body");
//		out.print("<table border=1><tr align='center' bgcolor='lightgreen'>");
//		out.print("<td>아이디</td><td>비밀번호</td><td>이름</td><td>핸드폰번호</td><td>이메일</td><td>가입일</td></tr>");
		
		for (int i=0; i<list.size(); i++) {
			MemberBean memberBean = list.get(i);
			String uid = memberBean.getUid();
			String pwd = memberBean.getPwd();
			String name = memberBean.getName();
			String phone = memberBean.getPhone();
			String email = memberBean.getEmail();
			Date joinDate = memberBean.getJoinDate();
			
//			out.print("<tr><td>" + uid + "</td><td>" + pwd + "</td><td>" + name + "</td><td>"
//					+ phone +"</td><td>" + email + "</td><td>" + joinDate + "</td></tr>");
		}
//		out.print("</table></body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
