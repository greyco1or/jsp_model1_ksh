<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%@ page import = "kr.or.ksmart.dao.Udao" %>

<%
	String send_id = request.getParameter("send_id");
	System.out.println(send_id + " << send_id");
	Udao udao = new Udao();
	udao.uDelete(send_id);
	
	response.sendRedirect(request.getContextPath() + "/usersearch/user_search_list.jsp");
	
%>