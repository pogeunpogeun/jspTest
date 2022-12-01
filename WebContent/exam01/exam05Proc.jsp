<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String empNo = request.getParameter("empNo");
	String empName = request.getParameter("empName");
	String dept = request.getParameter("dept");
	String salary = request.getParameter("salary");
	String leader = request.getParameter("leader");

%>
<table border="1">
	<tr>
		<td>사원번호</td>
		<td><%=empNo %></td>
	</tr>
	<tr>
		<td>사원명</td>
		<td><%=empName %></td>
	</tr>
	<tr>
		<td>부서명</td>
		<td><%=dept %></td>
	</tr>
	<tr>
		<td>급여</td>
		<td><%=salary %></td>
	</tr>
	<tr>
		<td>부서장명</td>
		<td><%=leader %></td>
	</tr>		
</table>