<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<style>
#list_table{
	margin: 0 0 20px 0;
}
</style>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<%@ include file="/userinsert/user_insert_form.jsp" %>
<div id="list_table">
ȸ�� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>���̵�</td><td>���</td><td>����</td><td>�̸�</td><td>�̸���</td><td>�޴���</td><td>�ּ�</td><td>����</td><td>����</td>
</tr>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("select * from tb_user");
		System.out.println(pstmt + "<-- pstmt");

		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs user_list.jsp");
		while(rs.next()){
%>
		<tr>
			<td><%= rs.getString("u_id")%></td>
			<td><%= rs.getString("u_pw")%></td>
			<td><%= rs.getString("u_level")%></td>
			<td><%= rs.getString("u_name")%></td>
			<td><%= rs.getString("u_email")%></td>
			<td><%= rs.getString("u_phone")%></td>
			<td><%= rs.getString("u_addr")%></td>
			<td>
			<a href="<%= request.getContextPath() %>/userupdate/user_update_form.jsp?send_id=<%= rs.getString("u_id")%>">������ư</a>	
			</td>
			<td>
			<a href="<%= request.getContextPath() %>/userdelete/user_delete_action.jsp?send_id=<%= rs.getString("u_id")%>">������ư</a>	
			</td>
		</tr>
<%		
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
</table>
</div>

<%@ include file="/usersearch/user_search_form.jsp" %>