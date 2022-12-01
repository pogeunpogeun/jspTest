<%@page import="java.util.ArrayList"%>
<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    HaksaSihumDAO dao = new HaksaSihumDAO();	
	ArrayList<HaksaSihumDTO> list = dao.getSelectAll();
	int totalRecord = list.size();
%>
<h2>시험정보</h2>
<form name="testForm">
<table border="1" width="80%" align="center">
<tr>
	<th>순번</th>
	<th>시험번호</th>
	<th>시험명</th>
	<th>시험날짜</th>
	<th>등록일</th>
</tr>

<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="5" height="200px" align="center">
		등록된 정보가 없습니다.
		</td>
	</tr>
<% } %>

	<%
		int num = totalRecord;
		for(int i = 0; i<list.size(); i++) {
			HaksaSihumDTO dto = list.get(i);
	%>
	<tr>
		<td><%=num %></td>
		<td><a href="#" onClick="move('view.jsp','<%=dto.getSihumNo() %>');"><%=dto.getSihumNo() %></td>
		<td><%=dto.getSihumName() %></td>
		<td><%=dto.getSihumDate() %></td>
		<td><%=dto.getRegiDate() %></td>
	</tr>
	<%
		num--;
		}
	%>
</table>
</form>
<div style="border: 0px solid blue; width:80%; margin-top:10px; margin-bottom:10px;" align="right">
	|
	<a href="#" onclick="move('list.jsp','');">목록</a>
	|
	<a href="#" onclick="move('chuga.jsp','');">등록</a>
	|
</div>

<script>
function move(value1,value2){
	location.href = value1 + '?sihumNo=' + value2;
}
</script>