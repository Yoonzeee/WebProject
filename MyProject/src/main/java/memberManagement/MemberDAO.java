package memberManagement;

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
				MemberBean bean = new MemberBean(
						rs.getString("uid"),	
						rs.getString("pwd"),	
						rs.getString("name"),
						rs.getString("phone"),
						rs.getString("email"),	
						rs.getDate("joinDate"));
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

	public void registerMember(MemberBean bean) {
		try {
			Connection con = dataFactory.getConnection();
			String query = "insert into web_member";
			query += " (uid, pwd, name, phone, email)";
			query += " values(?,?,?,?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bean.getUid());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getPhone());
			pstmt.setString(5, bean.getEmail());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
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
				memberBean = new MemberBean(
						rs.getString("uid"),	
						rs.getString("pwd"),	
						rs.getString("name"),
						rs.getString("phone"),
						rs.getString("email"),	
						rs.getDate("joinDate"));
			}
			rs.close();
			return memberBean;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {}
		}
		return null;		
	}

	public int insertMember(MemberBean memberBean) throws SQLException{
		try {
			// connDB();
			conn = dataFactory.getConnection();
			String query = "insert into web_member (uid, pwd, name, phone, email) values (?,?,?,?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberBean.getUid());
			pstmt.setString(2, memberBean.getPwd());
			pstmt.setString(3, memberBean.getName());
			pstmt.setString(4, memberBean.getPhone());
			pstmt.setString(5, memberBean.getEmail());
			return pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//			throw e; //해당 함수를 호출한 부분으로 예외를 던진다 
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {}
		}		
	}
}
