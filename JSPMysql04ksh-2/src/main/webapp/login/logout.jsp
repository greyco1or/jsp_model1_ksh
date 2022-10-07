<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
	session.invalidate();	//세션 종료
%>
<script type="text/javascript">
	alert('로그아웃');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>












