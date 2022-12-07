package memberManagement;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	CallableStatement cstmt;
	DataSource dataFactory;

	public MemberDAO() {
		try {
			Context context = new InitialContext();
			Context envContext = (Context) context.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/pro05DB");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<MemberBean> listMembers() {
		List<MemberBean> list = new ArrayList<>();
		try {
			// connDB();
			conn = dataFactory.getConnection();
			String query = "select * from web_member ";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean bean = new MemberBean(rs.getString("uid"), rs.getString("pwd"), rs.getString("name"),
						rs.getString("phone"), rs.getString("email"), rs.getDate("joinDate"));
				System.out.println(bean);
				list.add(bean);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 회원가입
	public void registerMember(String uid, String pwd, String name, String phone, String email) {
		
		try {
			conn = dataFactory.getConnection();
			String selectQuery = "select * from web_member where uid=?";
			System.out.println("prepareStatement: " + selectQuery);

			pstmt = conn.prepareStatement(selectQuery);
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();

			if (!rs.next()) {
				String insertQuery = "insert into web_member(uid, pwd, name, phone, email) values(?,?,?,?,?)";
				pstmt = conn.prepareStatement(insertQuery);
				System.out.println("prepareStatememt: " + insertQuery);
				pstmt.setString(1, uid);
				pstmt.setString(2, pwd);
				pstmt.setString(3, name);
				pstmt.setString(4, phone);
				pstmt.setString(5, email);
				pstmt.executeQuery();
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
	}
	
	// 회원정보 수정
	public MemberBean updateMember(String uid, String pwd, String name, String phone, String email) {
		MemberBean bean = new MemberBean();
		try {
			// connDB();
			conn = dataFactory.getConnection();
			String query = "select * from web_member where uid=?";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uid);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String updateQuery = "update web_member set pwd=?, name=?, phone=?, email=? where uid=?";
				System.out.println("prepareStatement: " + updateQuery);
				pstmt = conn.prepareStatement(updateQuery);
				
				pstmt.setString(1, pwd);
				pstmt.setString(2, name);
				pstmt.setString(3, phone);
				pstmt.setString(4, email);
				pstmt.setString(5, uid);
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

	// 로그인
	public MemberBean loginMember(String uid, String pwd) {
		MemberBean bean = new MemberBean();
		try {
			conn = dataFactory.getConnection();
			String query = "select * from web_member where uid=? and pwd=?";
			System.out.println("prepareStatememt: " + query);

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, pwd);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String memberUid = rs.getString("uid");
				String memberPwd = rs.getString("pwd");
				
				if (memberUid.equals(uid) && memberPwd.equals(pwd)) {
					bean.setUid(rs.getString("uid"));
					bean.setPwd(rs.getString("pwd"));
					bean.setName(rs.getString("name"));
					bean.setPhone(rs.getString("phone"));
					bean.setEmail(rs.getString("email"));
					
					// 여기 쿼리문 작성 & 삽입할 데이터들 바꿔!!!
					String loghistoryQuery = "{call login_history(?, ?, ?, ?)}";
					cstmt = conn.prepareCall(loghistoryQuery);
					cstmt.setString(1, "LOGIN");
					cstmt.setString(2, uid);
					cstmt.setString(3, "로그인");
					cstmt.setDate(4, null);

					cstmt.execute();
					System.out.println("로그인 성공");
				} else {
					System.out.println("로그인 실패"); // 아이디랑 비밀번호가 일치하지 않을 경우
				}
				
				bean.setUid(rs.getString("uid"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setPhone(rs.getString("phone"));
				bean.setEmail(rs.getString("email"));
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
		return bean;
	}

	// 뭘봐?
	public MemberBean viewMember(String uid) {
		try {
			// connDB();
			conn = dataFactory.getConnection();
			String query = "select * from web_member where uid = ?";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uid);
			ResultSet rs = pstmt.executeQuery();
			MemberBean memberBean = null;

			if (rs.next()) {
				memberBean = new MemberBean(rs.getString("uid"), rs.getString("pwd"), rs.getString("name"),
						rs.getString("phone"), rs.getString("email"), rs.getDate("joinDate"));
			}
			rs.close();
			return memberBean;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
			}
		}
		return null;
	}

	
//	public int insertMember(MemberBean memberBean) throws SQLException {
//		try {
//			// connDB();
//			conn = dataFactory.getConnection();
//			String query = "insert into web_member (uid, pwd, name, phone, email) values (?,?,?,?,?)";
//			System.out.println("prepareStatememt: " + query);
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, memberBean.getUid());
//			pstmt.setString(2, memberBean.getPwd());
//			pstmt.setString(3, memberBean.getName());
//			pstmt.setString(4, memberBean.getPhone());
//			pstmt.setString(5, memberBean.getEmail());
//			return pstmt.executeUpdate();
//  		} catch (SQLException e) {
//   			e.printStackTrace();
//  			throw e; //해당 함수를 호출한 부분으로 예외를 던진다 
//  		} finally {
//			try {
//				pstmt.close();
//				conn.close();
//			} catch (Exception e) {
//			}
//		}
//	}



}
