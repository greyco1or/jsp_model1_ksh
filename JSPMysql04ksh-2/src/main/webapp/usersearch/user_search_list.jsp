<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "kr.or.ksmart.driverdb.DriverDB" %>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<span class="title">회원 리스트</span> <br>
<%@ include file="/usersearch/user_search_form.jsp" %>
<table width="100%" border="1">
<tr>
	<td>아이디</td><td>비번</td><td>권한</td><td>이름</td><td>이메일</td><td>휴대폰</td><td>주소</td><td>수정</td><td>삭제</td>
</tr>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	request.setCharacterEncoding("euc-kr");
	String sb = request.getParameter("sb");
	String tb = request.getParameter("tb");
	System.out.println(sb + " << sb //" + tb + " << tb");
	
	try{
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		if(sb == null && tb == null){
			System.out.println("01 sb, tb 변수에 담겨있는 값이 둘다 null인 조건");
			pstmt = conn.prepareStatement("select * from tb_user");
		} else if(sb != null && tb.equals("")){
			System.out.println("02 sb 변수에 담겨있는 값은 null이 아니고 tb 변수에 담겨있는 값은 공백 조건");
			pstmt = conn.prepareStatement("select * from tb_user");
		} else if(sb != null && tb != null){
			System.out.println("03 sb, tb 변수에 담겨있는 값이 둘다 null이 아닌 조건");
			pstmt = conn.prepareStatement("select * from tb_user where " + sb + " = ?");
			pstmt.setString(1, tb);
		}
		System.out.println(pstmt + "<-- pstmt");
	
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs user_search_list.jsp");
			
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
				<a href="<%= request.getContextPath() %>/userupdate/user_update_form.jsp?send_id=<%= rs.getString("u_id")%>">수정버튼</a>	
				</td>
				<td>
				<a href="<%= request.getContextPath() %>/userdelete/user_delete_action.jsp?send_id=<%= rs.getString("u_id")%>">삭제버튼</a>	
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
<%@ include file="/module/hadan.jsp" %>