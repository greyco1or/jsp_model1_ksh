<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
<form id="insert_table" action="<%= request.getContextPath() %>/userinsert/user_insert_pro.jsp" method="post">
<table border="1">
<tr>
	<td>���̵�</td>
	<td><input type="text" name="u_id" size="20"></td>
</tr>
<tr>
	<td>��ȣ</td>
	<td><input type="text" name="u_pw" size="20"></td>
</tr>
<tr>
	<td>����</td>
	<td><input type="text" name="u_level" size="20"></td>
</tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="u_name" size="20"></td>
</tr>
<tr>
	<td>�̸���</td>
	<td><input type="text" name="u_email" size="20"></td>
</tr>
<tr>
	<td>�޴���</td>
	<td><input type="text" name="u_phone" size="20"></td>
</tr>
<tr>
	<td>�ּ�</td>
	<td><input type="text" name="u_addr" size="20"></td>
</tr>
<tr>
	<td colspan="4"><input type="submit" value="ȸ�����Թ�ư"></td>
</tr>
</table>
</form>
<%@ include file="/module/hadan.jsp" %>