<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
String S_ID = (String)session.getAttribute("S_ID");
String S_NAME = (String)session.getAttribute("S_NAME");
String S_LEVEL = (String)session.getAttribute("S_LEVEL");
System.out.println(S_ID + "<- S_ID ");
System.out.println(S_NAME + "<- S_NAME ");
System.out.println(S_LEVEL + "<- S_LEVEL ");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������-ȸ������</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>
   <!-- Begin Wrapper -->
   <div id="wrapper">
         <!-- Begin Header -->
         <div id="header">
/module/top.jsp	<br/>         
��� �޴� <br/><br/>
<%	if(S_LEVEL == null){	%>
<!-- 01�α��� �� ȭ�� ���� -->
<a href="<%= request.getContextPath() %>/userinsert/user_insert_form.jsp">01ȸ������</a><br/><br/>
<form action="<%= request.getContextPath() %>/login/login_action.jsp" method="post">
���̵� : <input type="text" name="id">
��� : <input type="password" name="pw">
	<input type="submit" value="�α��� ��ư">
</form>
<!-- 01�α��� �� ȭ�� �� -->
<%	}else{	%>
<!-- 02 �α��� �� ȭ�� ���� -->
<%		if(S_LEVEL.equals("������")){ %>
<a href="<%= request.getContextPath() %>/userinsert/user_insert_form.jsp">01ȸ������</a>
<a href="<%= request.getContextPath() %>/goodssearch/goods_search_list.jsp">04��ǰ����Ʈ</a><br/><br/>
<%		}else if(S_LEVEL.equals("�Ǹ���")){ %>
<a href="<%= request.getContextPath() %>/userinsert/user_insert_form.jsp">01ȸ������</a>
<a href="<%= request.getContextPath() %>/goodsinsert/goods_insert_form.jsp">03��ǰ���</a>
<a href="<%= request.getContextPath() %>/goodssearch/goods_search_list.jsp">04��ǰ����Ʈ</a><br/><br/>
<%		}else if(S_LEVEL.equals("������")){ %>
<a href="<%= request.getContextPath() %>/userinsert/user_insert_form.jsp">01ȸ������</a>
<a href="<%= request.getContextPath() %>/usersearch/user_search_list.jsp">02ȸ������Ʈ</a>
<a href="<%= request.getContextPath() %>/goodsinsert/goods_insert_form.jsp">03��ǰ���</a>
<a href="<%= request.getContextPath() %>/goodssearch/goods_search_list.jsp">04��ǰ����Ʈ</a><br/><br/>
<%		} %>
<%= S_ID %> ���̵� / <%= S_NAME %> �� / <%= S_LEVEL %> ���� �α��� ��
<a href="<%= request.getContextPath() %>/login/logout.jsp">�α׾ƿ�</a>
<!-- 02 �α��� �� ȭ�� �� -->
<%	}	%>
		 </div>
		 <!-- End Header -->
		 
		 






		 
		 