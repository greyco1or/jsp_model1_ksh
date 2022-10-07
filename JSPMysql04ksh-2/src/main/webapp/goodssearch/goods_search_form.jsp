<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<form action="<%=request.getContextPath()%>/goodssearch/goods_search_list.jsp" method="post">
<input type="date" name="start_date">
<input type="date" name="end_date">
<select name="sk">
    <option value="g_name">상품명</option>
    <option value="g_local">원산지</option>
    <option value="m_name">판매자명</option>
</select>
<input type="text" name="stext">
<input type="submit" value="검색버튼">
</form>