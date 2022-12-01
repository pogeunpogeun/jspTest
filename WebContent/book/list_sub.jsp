<%@page import="java.util.ArrayList"%>
<%@page import="book.model.dto.BookDTO"%>
<%@page import="book.model.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BookDAO dao = new BookDAO();
	ArrayList<BookDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
%>

    
<h2>도서목록</h2>
<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>저자</th>
		<th>발행일</th>
		<th>분류</th>
		<th>등록일</th>
	</tr>
	
	<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="6" height="200px" align="center">등록된 내용이 없습니다.</td>
	</tr>
	<% } %>
	<%
		int num = totalRecord;
		for(int i = 0; i<list.size(); i++) {
			BookDTO dto = list.get(i);
				
	%>
			<tr>
				<td><%=num %></td>
				<td><a href="#" onClick="move('view.jsp','<%=dto.getNo()%>');"><%=dto.getSubject() %></a></td>
				<td><%=dto.getAuthor() %></td>
				<td><%=dto.getCreated() %></td>
				<td><%=dto.getProfile() %></td>
				<td><%=dto.getRegiDate() %></td>
			</tr>	
	<%
				num--;
		}
	%>
</table>
<div style="borer : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
|
 <a href="#" onClick="move('list.jsp','');">목록</a>
|
<a href="#" onClick="move('chuga.jsp','');">등록</a>
|
</div>
<script>
	function move(value1, value2) {
		location.href =  value1 + '?no=' + value2;
	}
</script>