<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<form action="<%=request.getContextPath()%>/goodssearch/goods_search_list.jsp" method="post">
<input type="date" name="start_date">
<input type="date" name="end_date">
<select name="sk">
    <option value="g_name">��ǰ��</option>
    <option value="g_local">������</option>
    <option value="m_name">�Ǹ��ڸ�</option>
</select>
<input type="text" name="stext">
<input type="submit" value="�˻���ư">
</form>