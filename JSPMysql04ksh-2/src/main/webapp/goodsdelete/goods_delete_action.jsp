<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.*" %>
<%
String send_code = request.getParameter("send_code");
System.out.println(send_code + "<- send_code");
Connection conn = null;
PreparedStatement pstmt = null;
DriverDB db = new DriverDB();
conn = db.driverDbcon();
pstmt = conn.prepareStatement(
		"DELETE FROM tb_goods WHERE g_code=?");
System.out.println(pstmt + "<-- pstmt 1");
pstmt.setString(1, send_code);
System.out.println(pstmt + "<-- pstmt 2");
pstmt.executeUpdate();
pstmt.close(); 
conn.close();
response.sendRedirect(request.getContextPath() + "/goodssearch/goods_search_list.jsp");
%>