package pro14;

import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONArray;
import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DanServlet
 */
@WebServlet("/dan")
public class DanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DanServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("DanServlet 호출됨...");
		String danStr = request.getParameter("dan");
		PrintWriter out = response.getWriter();
		JSONObject jsonResult = new JSONObject();

		if (danStr != null && danStr.length() >= 1) {
			jsonResult.put("status", true);

//			StringBuilder strBuffer = new StringBuilder();
			int dan = Integer.parseInt(danStr);

//			for (int i=1;i<=9;i++) {
//				strBuffer.append(dan).append("*").append(i).append("=").append(dan * i).append("<br/>");
//			}
			
//			전송량 : 565 byte  
//			strBuffer.append("<table border='1'>");
//			for (int i=1;i<=9;i++) {
//				strBuffer.append("<tr>");
//				strBuffer.append("<td>").append(dan).append("</td>")
//						.append("<td>").append("*").append("</td>")
//						.append("<td>").append(i).append("</td>")
//						.append("<td>").append("=").append("</td>")
//						.append("<td>").append(dan * i).append("</td>");
//				strBuffer.append("</tr>");
//			}
//			strBuffer.append("</table>");
//			out.println(strBuffer.toString());
			//JSON 객체를 사용하여 배열 객체를 전달한다
			JSONArray jsonArray = new JSONArray();
			
			for (int i = 1; i <= 9; i++) {
				JSONObject row = new JSONObject();
				row.put("i", i);
				row.put("rst", dan * i);			
				jsonArray.put(row);
			}
			jsonResult.put("result", jsonArray);

		} else {
			jsonResult.put("status", false);
			jsonResult.put("message", "dan value error");
		}
		out.append(jsonResult.toString());
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
