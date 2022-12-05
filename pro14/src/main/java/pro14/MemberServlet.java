package pro14;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import org.json.JSONObject;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/member/*")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberSevlet============ : " + request.getRequestURI());
		if (request.getRequestURI().equals("/pro14/member/view")) {
			
			String id = request.getParameter("id");
			MemberDAO memberDAO = new MemberDAO();
			MemberBean memberBean = memberDAO.viewMember(id);
			request.setAttribute("memberBean", memberBean);
			RequestDispatcher dispatch = request.getRequestDispatcher("/jsp/member/view.jsp");
			dispatch.forward(request, response);
		} else if (request.getRequestURI().equals("/pro14/member/list")) {
			MemberDAO memberDAO = new MemberDAO();
			request.setAttribute("listMembers", memberDAO.listMembers());

			RequestDispatcher dispatch = request.getRequestDispatcher("/jsp/member/list.jsp");
			dispatch.forward(request, response);
		} else if (request.getRequestURI().equals("/pro14/member/dupUidCheck")) {
			String uid = request.getParameter("uid");
			
			MemberDAO memberDAO = new MemberDAO();
			MemberBean memberBean = memberDAO.viewMember(uid);
			JSONObject jsonResult = new JSONObject();
			
			if (memberBean == null) {
				jsonResult.put("status", true);
				jsonResult.put("message", "해당 아이디는 사용가능합니다");
			} else {
				jsonResult.put("status", false);
				jsonResult.put("message", "해당 아이디는 사용불가능합니다");
			}
			PrintWriter out = response.getWriter();
			out.println(jsonResult.toString());
		} else if (request.getRequestURI().equals("/pro14/member/insert")) {
			String uid = request.getParameter("uid");
			String pwd= request.getParameter("pwd");
			String name = request.getParameter("name");
			JSONObject jsonResult = new JSONObject();
			
			MemberDAO memberDAO = new MemberDAO();
			try {
				memberDAO.insertMember(new MemberBean(uid, pwd, name, "", null));
				jsonResult.put("status", true);
				jsonResult.put("url", "/pro14/main.html");
				jsonResult.put("message", "해당 아이디는 사용가능합니다");
			} catch (SQLException e) {
				e.printStackTrace();
				jsonResult.put("status", false);
				jsonResult.put("message", "해당아이디는  현재 사용중인 아이디 입니다 ");
			}
			
			PrintWriter out = response.getWriter();
			out.println(jsonResult.toString());
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
