package boardManagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/board/updatePost")
public class UpdatePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePostServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		BoardDAO dao = new BoardDAO();
		
		String bno = request.getParameter("bno");
		String title = request.getParameter("title"); 
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		System.out.println(bno + title + category + content);
		
		BoardBean bean = dao.updatePost(bno, title, category, content);
		
//		HttpSession session = request.getSession();
//		session.setAttribute("uid", bean.getUid());
//		session.setAttribute("bno", bean.getBno());
		// jsp 연결을 위한 연결!
		
//		request.setAttribute("updatePost", dao.updatePost(bno, title, category, content));
		
//		RequestDispatcher dispatch = request.getRequestDispatcher("/jsp/board/updatePost.jsp");
		response.sendRedirect("/MyProject/Boardlist");
		
//		dispatch.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
