<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ include file="/module/top.jsp" %>
<%@ include file="/module/left.jsp" %>
		       
��ǰ���ȭ�� <br><br>	 
       
<form action="<%= request.getContextPath() %>/goodsinsert/goods_insert_action.jsp" method="post">
<!-- 	<input type="hidden" name="g_code"> -->	
<input type="hidden" name="u_id" value="<%= S_ID %>">
<!-- ��ǰ�ڵ� / ��ǰ�� / ī�װ� - û��,��ä / ���� / ���� / ������ / ��� / ����� -->
	��ǰ�� : <input type="text" name="g_name"> <br>
	ī�װ� : <input type="text" name="g_cate"> <br>
	���� : <input type="text" name="g_weight"> <br>
	���� : <input type="text" name="g_price"> <br>
	������ : <input type="text" name="g_local"> <br>
	��� : <input type="text" name="g_level"> <br>
	<input type="submit" value="��ǰ��Ϲ�ư">
</form>	          		 

<%@ include file="/module/hadan.jsp" %>
