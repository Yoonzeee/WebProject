package boardManagement;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	CallableStatement cstmt;
	DataSource dataFactory;

	public BoardDAO() {
		try {
			Context context = new InitialContext();
			Context envContext = (Context) context.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/pro05DB");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시물 목록 보기
	public List<BoardBean> listBoard() {
		List<BoardBean> list = new ArrayList<>();
		try {
			// connDB();
			conn = dataFactory.getConnection();
			String query = "select * from web_board";
			System.out.println("가입한 회원 목록 확인 시작~");
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardBean bean = new BoardBean(rs.getString("bno"), rs.getString("category"), rs.getString("title"), rs.getString("content"),
						rs.getString("uid"), rs.getDate("writeDate"), rs.getInt("viewCount"));
				System.out.println(bean);
				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}

	// 게시물 작성
	public void postBoard(String title, String category, String uid, String content) {
		try {
			conn = dataFactory.getConnection();
			
			String query = "insert into web_board(title, category, uid, content) values(?,?,?,?)";
			System.out.println("게시물 작성하기 시작~");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, category);
			pstmt.setString(3, uid);
			pstmt.setString(4, content);
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
			}
		}
		
	}
	
	// 게시글 보기
	public BoardBean getPost(String bno, String title, String content) {
	BoardBean bean = new BoardBean();
	try {
		// connDB();
		hitUp(bno);
		conn = dataFactory.getConnection();
		String query = "select * from web_board where bno=?";
		System.out.println("가입한 회원 목록 확인 시작~");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, bno);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			bean = new BoardBean(rs.getString("bno"), rs.getString("category"), rs.getString("title"),
					rs.getString("content"), rs.getString("uid"), rs.getDate("writeDate"), rs.getInt("viewCount"));
			System.out.println(bean);
		}
		rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			conn.close();
		} catch (Exception e) {}
		}
		return bean;
	}
	
	// 조회수
	public void hitUp(String bno) {
		try {
			conn = dataFactory.getConnection();
			String query = "update web_board set viewCount = viewCount+1 where bno=?";
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, bno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {}
			}
		}

	// 게시판 수정하기
	public BoardBean updatePost(String bno, String title, String category, String content) {
		BoardBean bean = new BoardBean();
		try {
			System.out.println("확인확인");
			// connDB();
			conn = dataFactory.getConnection();
			String selectQuery = "select * from web_board where bno=?";
			System.out.println("bno: " + bno);
			System.out.println("게시물 수정 시작~");
			System.out.println("prepareStatememt: " + selectQuery);
			pstmt = conn.prepareStatement(selectQuery);
			pstmt.setString(1, bno);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String updateQuery = "update web_board set title=?, category=?, content=? where bno=?";
				System.out.println("게시물 수정 시작~");
				
				bean = new BoardBean(rs.getString("bno"), rs.getString("category"), rs.getString("title"),
						rs.getString("content"), rs.getString("uid"), rs.getDate("writeDate"), rs.getInt("viewCount"));
				System.out.println(bean);
				
				pstmt = conn.prepareStatement(updateQuery);

				pstmt.setString(1, title);
				pstmt.setString(2, category);
				pstmt.setString(3, content);
				pstmt.setString(4, bno);
				pstmt.executeQuery();
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 게시물 삭제
	public BoardBean deletePost(String bno) {
		BoardBean bean = new BoardBean();
		try {
			conn = dataFactory.getConnection();
			String selectQuery = "select * from web_board where bno=?";
			pstmt = conn.prepareStatement(selectQuery);
			pstmt.setString(1, bno);
			
			System.out.println("게시물 삭제 시작!");
			String deleteQuery = "delete from web_board where bno=?";
			System.out.println("bno: " + bno);
			
			pstmt = conn.prepareStatement(deleteQuery);
			pstmt.setString(1, bno);
			pstmt.executeQuery();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {}
		}
		return bean;
		
	}
	
}

