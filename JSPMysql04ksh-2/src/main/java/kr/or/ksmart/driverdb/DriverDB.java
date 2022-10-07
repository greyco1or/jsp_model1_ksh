package kr.or.ksmart.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {

	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		System.out.println("01 driverDbcon DriverDB.java");
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/db04ksh?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid04ksh";
		String dbPass = "dbpw04ksh";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + " << conn");
		return conn;
	}
	
}
