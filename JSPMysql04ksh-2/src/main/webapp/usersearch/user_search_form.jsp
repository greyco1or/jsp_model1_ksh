<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<form action="<%= request.getContextPath() %>/usersearch/user_search_list.jsp" method="post">
	<select name="sb">
		<option value="u_id">���̵�</option>
		<option value="u_level">����</option>
		<option value="u_name">�̸�</option>
		<option value="u_email">�̸���</option>
	</select>
	<input type="text" name="tb">
	<input type="submit" value="�˻���ư">
</form>