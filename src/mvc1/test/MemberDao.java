package mvc1.test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.*;






public class MemberDao {
	
	private MemberDao() {}
	
	public static MemberDao getInstance() { return LazyHolder.INSTANCE; }
	private static class LazyHolder { private static final MemberDao INSTANCE = new MemberDao(); }
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int check(String id, String passwd) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select passwd from member2 where id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPasswd = rs.getString(1);
				if(dbPasswd.equals(passwd))result=1;
				else result = 0;
			}else result = -1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public List<Member> list() throws SQLException {
		List<Member> list = new ArrayList<Member>();
		Connection conn = null;	Statement stmt= null;
		ResultSet rs = null;
		String sql = "select * from member2";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				Member me = new Member();
				me.setAddress(rs.getString("address"));
				me.setId(rs.getString("id"));
				me.setName(rs.getString("name"));
				me.setReg_date(rs.getDate("reg_date"));
				me.setTel(rs.getString("tel"));
				
				list.add(me);
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}
}
