<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%
	String send_code = request.getParameter("send_code");
	System.out.println(send_code + " << send_code");
	String goodsname = null;
	String goodscate = null;
	String goodsweight = null;
	String goodsprice = null;
	String goodslocal = null;
	String goodslevel = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		pstmt = conn.prepareStatement("SELECT * FROM tb_goods WHERE g_code=?");
		System.out.println(pstmt + "<-- pstmt 1");
		pstmt.setString(1, send_code);
		System.out.println(pstmt + "<-- pstmt 2");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs user_update_form.jsp");
		if(rs.next()){
			System.out.println("rs.next() 조건식 true면 실행");
			System.out.println(rs.getString("g_name") + " <-- u_id 컬럼에 담겨 있는 값");
			System.out.println(rs.getString("g_cate") + " <-- u_pw 컬럼에 담겨 있는 값");
			System.out.println(rs.getString("g_weight") + " <-- u_level 컬럼에 담겨 있는 값");
			System.out.println(rs.getString("g_price") + " <-- u_name 컬럼에 담겨 있는 값");
			System.out.println(rs.getString("g_local") + " <-- u_email 컬럼에 담겨 있는 값");
			System.out.println(rs.getString("g_level") + " <-- u_name 컬럼에 담겨 있는 값");
			goodsname = rs.getString("g_name");
			goodscate = rs.getString("g_cate");
			goodsweight = rs.getString("g_weight");
			goodsprice = rs.getString("g_price");
			goodslocal = rs.getString("g_local");
			goodslevel = rs.getString("g_level");
			System.out.println(goodsname + " <-- u_id 컬럼에 담겨 있는 값");
			System.out.println(goodscate + " <-- u_pw 컬럼에 담겨 있는 값");
			System.out.println(goodsweight + " <-- u_level 컬럼에 담겨 있는 값");
			System.out.println(goodsprice + " <-- u_name 컬럼에 담겨 있는 값");
			System.out.println(goodslocal + " <-- u_email 컬럼에 담겨 있는 값");
			System.out.println(goodslevel + " <-- u_name 컬럼에 담겨 있는 값");
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

<form action="<%= request.getContextPath() %>/goodsupdate/goods_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>상품명</td>
	<td><input type="text" name="g_name" size="20" value="<%= goodsname %>" readonly></td>
</tr>
<tr>
	<td>분류</td>
	<td><input type="text" name="g_cate" size="20" value="<%= goodscate %>"></td>
</tr>
<tr>
	<td>무게</td>
	<td><input type="text" name="g_weight" size="20" value="<%= goodsweight %>"></td>
</tr>
<tr>
	<td>가격</td>
	<td><input type="text" name="g_price" size="20" value="<%= goodsprice %>"></td>
</tr>
<tr>
	<td>원산지</td>
	<td><input type="text" name="g_local" size="20" value="<%= goodslocal %>"></td>
</tr>
<tr>
	<td>등급</td>
	<td><input type="text" name="g_level" size="20" value="<%= goodslevel %>"></td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="수정완료" onclick="document.location.href='<%= request.getContextPath() %>/goodssearch/goods_search_list.jsp'"></td>
</tr>
</table>
<input type="hidden" name="g_code" value="<%= send_code %>">
</form>
<%@ include file="/module/hadan.jsp" %>