<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import ="kr.or.ksmart.dao.Udao" %>
<%@ page import = "kr.or.ksmart.dto.User" %>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<%
	String send_id = request.getParameter("send_id");
	System.out.println(send_id + " << send_id");
	Udao udao = new Udao();
	User u = udao.uSelectforUpdate(send_id);
	
	String userid = u.getU_id();
	String userpw = u.getU_pw();
	String userlevel = u.getU_level();
	String username = u.getU_name();
	String useremail = u.getU_email();
	String userphone = u.getU_phone();
	String useraddr = u.getU_addr();
	

%>

<form action="<%= request.getContextPath() %>/userupdate/user_update_action.jsp" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td><input type="text" name="u_id" size="20" value="<%= userid %>" readonly></td>
</tr>
<tr>
	<td>암호</td>
	<td><input type="text" name="u_pw" size="20" value="<%= userpw %>"></td>
</tr>
<tr>
	<td>권한</td>
	<td><input type="text" name="u_level" size="20" value="<%= userlevel %>"></td>
</tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="u_name" size="20" value="<%= username %>"></td>
</tr>
<tr>
	<td>이메일</td>
	<td><input type="text" name="u_email" size="20" value="<%= useremail %>"></td>
</tr>
<tr>
	<td>휴대폰</td>
	<td><input type="text" name="u_phone" size="20" value="<%= userphone %>"></td>
</tr>
<tr>
	<td>주소</td>
	<td><input type="text" name="u_addr" size="20" value="<%= useraddr %>"></td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="수정완료" onclick="document.location.href='<%= request.getContextPath() %>/userlist/user_list.jsp'"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>