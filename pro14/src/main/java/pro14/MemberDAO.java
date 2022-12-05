package pro14;

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
			String query = "select * from member13 ";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MemberBean member = new MemberBean(
						rs.getString("id"),	
						rs.getString("pwd"),	
						rs.getString("name"),	
						rs.getString("email"),	
						rs.getDate("joinDate"));
				System.out.println(member);
				list.add(member);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void addMember(MemberBean member) {
		try {
			Connection con = dataFactory.getConnection();
			String query = "insert into member13";
			query += " (id, pwd, name, email)";
			query += " values(?,?,?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberBean viewMember(String id) {
		try {
			// connDB();
			conn = dataFactory.getConnection();
			String query = "select * from member13 where id = ?";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			MemberBean memberBean = null;
			
			if (rs.next()) {
				memberBean = new MemberBean(
						rs.getString("id"),	
						rs.getString("pwd"),	
						rs.getString("name"),	
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
			String query = "insert into member13 (id, pwd, name, email) values (?,?,?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberBean.getId());
			pstmt.setString(2, memberBean.getPwd());
			pstmt.setString(3, memberBean.getName());
			pstmt.setString(4, memberBean.getEmail());
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
