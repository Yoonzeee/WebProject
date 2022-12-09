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

//	// 로그인
//	public PostBean loginMember(String uid, String pwd) {
//		PostBean bean = new PostBean();
//		try {
//			conn = dataFactory.getConnection();
//			String query = "select * from web_member where uid=? and pwd=?";
//			System.out.println("로그인 시작~");
//			System.out.println("prepareStatememt: " + query);
//
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, uid);
//			pstmt.setString(2, pwd);
//
//			ResultSet rs = pstmt.executeQuery();
//			if (rs.next()) {
//				String memberUid = rs.getString("uid");
//				String memberPwd = rs.getString("pwd");
//
//				if (memberUid.equals(uid) && memberPwd.equals(pwd)) {
//					bean.setUid(rs.getString("uid"));
//					bean.setPwd(rs.getString("pwd"));
//					bean.setName(rs.getString("name"));
//					bean.setPhone(rs.getString("phone"));
//					bean.setEmail(rs.getString("email"));
//
//					// 여기 쿼리문 작성 & 삽입할 데이터들 바꿔!!!
//					String loghistoryQuery = "{call login_history(?, ?, ?, ?)}";
//					cstmt = conn.prepareCall(loghistoryQuery);
//					cstmt.setString(1, "LOGIN");
//					cstmt.setString(2, uid);
//					cstmt.setString(3, "로그인");
//					cstmt.setDate(4, null);
//
//					cstmt.execute();
//					System.out.println("로그인 성공");
//				} else {
//					System.out.println("로그인 실패"); // 아이디랑 비밀번호가 일치하지 않을 경우
//				}
//
//				bean.setUid(rs.getString("uid"));
//				bean.setPwd(rs.getString("pwd"));
//				bean.setName(rs.getString("name"));
//				bean.setPhone(rs.getString("phone"));
//				bean.setEmail(rs.getString("email"));
//			}
//			rs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				pstmt.close();
//				conn.close();
//			} catch (Exception e) {
//			}
//		}
//		return bean;
//	}
//
//	// 회원가입
//	public void registerMember(String uid, String pwd, String name, String phone, String email) {
//
//		try {
//			conn = dataFactory.getConnection();
//			String selectQuery = "select * from web_member where uid=?";
//			System.out.println("prepareStatement: " + selectQuery);
//			System.out.println("회원가입 시작~");
//
//			pstmt = conn.prepareStatement(selectQuery);
//			pstmt.setString(1, uid);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (!rs.next()) {
//				String insertQuery = "insert into web_member(uid, pwd, name, phone, email) values(?,?,?,?,?)";
//				pstmt = conn.prepareStatement(insertQuery);
//				System.out.println("prepareStatememt: " + insertQuery);
//				pstmt.setString(1, uid);
//				pstmt.setString(2, pwd);
//				pstmt.setString(3, name);
//				pstmt.setString(4, phone);
//				pstmt.setString(5, email);
//				pstmt.executeQuery();
//			}
//			rs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				pstmt.close();
//				conn.close();
//			} catch (Exception e) {
//			}
//		}
//	}
//
//	// 회원정보 수정
//	public PostBean updateMember(String uid, String pwd, String name, String phone, String email) {
//		PostBean bean = new PostBean();
//		try {
//			// connDB();
//			conn = dataFactory.getConnection();
//			String query = "select * from web_member where uid=?";
//			System.out.println("회원정보 수정 시작~");
//			System.out.println("prepareStatememt: " + query);
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, uid);
//
//			ResultSet rs = pstmt.executeQuery();
//			if (rs.next()) {
//				String updateQuery = "update web_member set pwd=?, name=?, phone=?, email=? where uid=?";
//				System.out.println("prepareStatement: " + updateQuery);
//				pstmt = conn.prepareStatement(updateQuery);
//
//				pstmt.setString(1, pwd);
//				pstmt.setString(2, name);
//				pstmt.setString(3, phone);
//				pstmt.setString(4, email);
//				pstmt.setString(5, uid);
//				pstmt.executeQuery();
//			}
//			rs.close();
//			pstmt.close();
//			conn.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return bean;
//	}
//
//	// 회원 탈퇴
//	public PostBean deleteMember(String uid, String pwd, String pwd1) {
//		PostBean bean = new PostBean();
//		try {
//			conn = dataFactory.getConnection();
//
//			if (pwd.equals(pwd1)) {
//				String query = "select * from web_member where uid=?";
//				System.out.println("회원 탈퇴 시작~");
//				System.out.println("prepareStatememt: " + query);
//				pstmt = conn.prepareStatement(query);
//				pstmt.setString(1, uid);
//
//				ResultSet rs = pstmt.executeQuery();
//				if (rs.next()) {
//					String memberPwd = rs.getString("pwd");
//					if (memberPwd.equals(pwd)) {
//						String deleteQuery = "delete from web_member where uid=?";
//						System.out.println("prepareStatement: " + deleteQuery + uid + pwd + pwd1);
//
//						pstmt = conn.prepareStatement(deleteQuery);
//						pstmt.setString(1, uid);
//						pstmt.executeUpdate();
//					}
//				}
//				rs.close();
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				pstmt.close();
//				conn.close();
//			} catch (Exception e) {
//			}
//		}
//		return bean;
//	}

//	// 가입한 회원정보 조회
//	public List<PostBean> listMembers() {
//		List<PostBean> list = new ArrayList<>();
//		try {
//			// connDB();
//			conn = dataFactory.getConnection();
//			String query = "select * from web_board ";
//			System.out.println("가입한 회원 목록 확인 시작~");
//			System.out.println("prepareStatememt: " + query);
//			pstmt = conn.prepareStatement(query);
//			
//			ResultSet rs = pstmt.executeQuery();
//			while (rs.next()) {
//				PostBean bean = new PostBean(rs.getString("category"), rs.getString("title"), rs.getString("content"),
//						rs.getString("uid"), rs.getDate("writeDate"), rs.getInt("viewCount"));
//				System.out.println(bean);
//				list.add(bean);
//			}
//			rs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				pstmt.close();
//				conn.close();
//			} catch (Exception e) {
//			}
//		}
//		return list;
//	}

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
				BoardBean bean = new BoardBean(rs.getInt("bno"), rs.getString("category"), rs.getString("title"), rs.getString("content"),
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

	
	public BoardBean getPost(String bno) {
	BoardBean bean = new BoardBean();
	try {
		// connDB();
		hitUp(bno);
		conn = dataFactory.getConnection();
		String query = "select * from web_board where bno=?";
		System.out.println("가입한 회원 목록 확인 시작~");
		System.out.println("prepareStatememt: " + query);
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, bno);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			
			bean = new BoardBean(rs.getInt("bno"), rs.getString("category"), rs.getString("title"),
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
	}
	
//	// 비밀번호 찾기
//	public List<PostBean> searchPwd(String uid, String phone) {
//		List<PostBean> list = new ArrayList<>();
//		try {
//			conn = dataFactory.getConnection();
//			String query = "select * from web_member where uid=?";
//			System.out.println("비밀번호 찾기 시작~");
//			System.out.println("prepareStatement: " + query);
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, uid);
//			
//			ResultSet rs = pstmt.executeQuery();
//			if (rs.next()) {
//				String memberPhone = rs.getString("phone");
//				if(memberPhone.equals(phone)) {
//					PostBean bean = new PostBean(rs.getString("uid"), rs.getString("pwd"), rs.getString("name"),
//							rs.getString("phone"), rs.getString("email"), rs.getDate("joinDate"));
//					System.out.println(bean);
//					list.add(bean);
//				}
//			}
//			rs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				pstmt.close();
//				conn.close();
//			} catch (Exception e) {
//			}
//		}
//		return list;
//	}
//
//	public PostBean myPage(String uid) {
//		PostBean bean = new PostBean();
//		try {
//			// connDB();
//			conn = dataFactory.getConnection();
//			String query = "select * from web_member where uid=?";
//			System.out.println("가입한 회원 목록 확인 시작~");
//			System.out.println("prepareStatememt: " + query);
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, uid);
//			
//			ResultSet rs = pstmt.executeQuery();
//			while (rs.next()) {
//				bean = new PostBean(rs.getString("uid"), rs.getString("pwd"), rs.getString("name"),
//						rs.getString("phone"), rs.getString("email"), rs.getDate("joinDate"));
//				System.out.println(bean);
//			}
//			rs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				pstmt.close();
//				conn.close();
//			} catch (Exception e) {
//			}
//		}
//		return bean;
//	}


//	// 뭘봐?
//	public MemberBean viewMember(String uid) {
//		try {
//			// connDB();
//			conn = dataFactory.getConnection();
//			String query = "select * from web_member where uid = ?";
//			System.out.println("prepareStatememt: " + query);
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, uid);
//			ResultSet rs = pstmt.executeQuery();
//			MemberBean memberBean = null;
//
//			if (rs.next()) {
//				memberBean = new MemberBean(rs.getString("uid"), rs.getString("pwd"), rs.getString("name"),
//						rs.getString("phone"), rs.getString("email"), rs.getDate("joinDate"));
//			}
//			rs.close();
//			return memberBean;
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				pstmt.close();
//				conn.close();
//			} catch (Exception e) {
//			}
//		}
//		return null;
//	}


