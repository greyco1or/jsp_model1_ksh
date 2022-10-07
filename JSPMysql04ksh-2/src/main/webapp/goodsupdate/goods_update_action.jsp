<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>

<%
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String g_code = request.getParameter("g_code");
	String g_name = request.getParameter("g_name");
	String g_cate = request.getParameter("g_cate");
	String g_weight = request.getParameter("g_weight");
	String g_price = request.getParameter("g_price");
	String g_local = request.getParameter("g_local");
	String g_level = request.getParameter("g_level");
	
	System.out.println(g_code + " << id /userinsert/user_update_action.jsp");	
	System.out.println(g_name + " << pw /userinsert/user_update_action.jsp");	
	System.out.println(g_cate + " << level /userinsert/user_update_action.jsp");	
	System.out.println(g_weight + " << name /userinsert/user_update_action.jsp");	
	System.out.println(g_price + " << email /userinsert/user_update_action.jsp");	
	System.out.println(g_local + " << phone /userinsert/user_update_action.jsp");	
	System.out.println(g_level + " << addr /userinsert/user_update_action.jsp");
	
	try{
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement(
				"UPDATE tb_goods SET g_name = ?, g_cate = ?, g_weight = ?, g_price = ?, g_local = ?, g_level = ? WHERE g_code = ?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, g_name);
		pstmt.setString(2, g_cate);
		pstmt.setString(3, g_weight);
		pstmt.setString(4, g_price);
		pstmt.setString(5, g_local);
		pstmt.setString(6, g_level);
		pstmt.setString(7, g_code);
		System.out.println(pstmt + "<-- pstmt 1");
		
		int result = pstmt.executeUpdate();
		System.out.println(result + "<-- result");
	
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		//response.sendRedirect(request.getContextPath() + "/userlist/user_list.jsp");
		response.sendRedirect(request.getContextPath() + "/goodssearch/goods_search_list.jsp");
	}

%>