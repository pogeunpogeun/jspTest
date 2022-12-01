<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String age = request.getParameter("age");

%>
<table border="1">
	<tr>
		<td>이름</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=addr %></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=age %></td>
	</tr>	
</table>