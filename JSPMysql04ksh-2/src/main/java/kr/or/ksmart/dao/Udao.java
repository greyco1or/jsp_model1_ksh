package kr.or.ksmart.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import kr.or.ksmart.dto.User;
import kr.or.ksmart.driverdb.DriverDB;
import java.sql.ResultSet;


public class Udao {
		Connection conn = null;
		PreparedStatement pstmt = null;
		User u = null;
		ResultSet rs = null;
	
	public User uSelectforUpdate(String uid) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("SELECT * FROM tb_user WHERE u_id=?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, uid);
		System.out.println(pstmt + "<-- pstmt 2");
		rs = pstmt.executeQuery();
		if(rs.next()){
			u = new User();
			u.setU_id(rs.getString("u_id"));
			u.setU_pw(rs.getString("u_pw"));
			u.setU_level(rs.getString("u_level"));
			u.setU_name(rs.getString("u_name"));
			u.setU_email(rs.getString("u_email"));
			u.setU_phone(rs.getString("u_phone"));
			u.setU_addr(rs.getString("u_addr"));
		}
		
		return u;
	}
	
		
	public void uDelete(String uid) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("DELETE FROM tb_user WHERE u_id=?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, uid);
		System.out.println(pstmt + "<-- pstmt 2");
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
	}
		
	public void uUpdate(User u) throws SQLException, ClassNotFoundException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"UPDATE tb_user SET u_pw = ?, u_level = ?, u_name = ?, u_email = ?, u_phone = ?, u_addr = ? WHERE u_id = ?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, u.getU_pw());
		pstmt.setString(2, u.getU_level());
		pstmt.setString(3, u.getU_name());
		pstmt.setString(4, u.getU_email());
		pstmt.setString(5, u.getU_phone());
		pstmt.setString(6, u.getU_addr());
		pstmt.setString(7, u.getU_id());
		System.out.println(pstmt + "<-- pstmt 1");
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
	}
		
	public void uInsert(User u) throws ClassNotFoundException, SQLException {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
		pstmt.setString(1, u.getU_id());
		pstmt.setString(2, u.getU_pw());
		pstmt.setString(3, u.getU_level());
		pstmt.setString(4, u.getU_name());
		pstmt.setString(5, u.getU_email());
		pstmt.setString(6, u.getU_phone());
		pstmt.setString(7, u.getU_addr());
		System.out.println(pstmt + "<-- pstmt 1");
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
	}
		
	public void uInsert(User u, Connection conn) throws SQLException {
		pstmt = conn.prepareStatement(
				"INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
		pstmt.setString(1, u.getU_id());
		pstmt.setString(2, u.getU_pw());
		pstmt.setString(3, u.getU_level());
		pstmt.setString(4, u.getU_name());
		pstmt.setString(5, u.getU_email());
		pstmt.setString(6, u.getU_phone());
		pstmt.setString(7, u.getU_addr());
		System.out.println(pstmt + "<-- pstmt 1");
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
		pstmt.close();
		conn.close();
	}
}
