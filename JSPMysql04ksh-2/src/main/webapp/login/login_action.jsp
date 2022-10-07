<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
System.out.println(id + "<- id ");
System.out.println(pw + "<- pw ");
String message = null;

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	DriverDB db = new DriverDB();
	conn = db.driverDbcon();
	pstmt = conn.prepareStatement("select * from tb_user where u_id=?");
	pstmt.setString(1, id);
	System.out.println(pstmt + "<-- pstmt");
	
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs");
	
	String dbid = null;
	String dbpw = null;
	String dbname = null;
	String dblevel = null;
	if(rs.next()){
		dbid = rs.getString("u_id");
		dbpw = rs.getString("u_pw");
		dbname = rs.getString("u_name");
		dblevel = rs.getString("u_level");
		System.out.println(dbid + "<-- dbid");
		System.out.println(dbpw + "<-- dbname");
		System.out.println(dbname + "<-- dbname");
		System.out.println(dblevel + "<-- dblevel");
		if(pw.equals(dbpw)){
			System.out.println("비밀번호 일치");
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_NAME", dbname);
			session.setAttribute("S_LEVEL", dblevel);
			message = "로그인 성공";
		} else{
			System.out.println("비밀번호 불일치");
			message = "비밀번호 불일치";
		}
	} else{
		System.out.println("아이디 불일치");
		message = "아이디 불일치";
	}
	
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
<script type="text/javascript">
	alert('<%= message %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>


