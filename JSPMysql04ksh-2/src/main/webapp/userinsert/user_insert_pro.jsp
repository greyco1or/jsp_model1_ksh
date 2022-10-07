<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "kr.or.ksmart.dao.Udao" %>

<% request.setCharacterEncoding("EUC-KR"); %>

<jsp:useBean id="u" class="kr.or.ksmart.dto.User"/>
<jsp:setProperty name="u" property="*"/>
<%
	Udao udao = new Udao();
	udao.uInsert(u);
	response.sendRedirect(request.getContextPath() + "/usersearch/user_search_list.jsp");
%>





















	