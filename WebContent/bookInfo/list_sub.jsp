<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>

<%
	BookInfoDAO dao = new BookInfoDAO();
	ArrayList<BookInfoDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
%>
<h2>도서정보</h2>
<form name="infoForm">
<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>발행일</th>
		<th>저자번호</th>
		<th>분류번호</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>

	<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="6" height="200px" align="center">등록된 내용이 없습니다.</td>
	</tr>
	<% } %>
	<%
		int temp = 0;
		int num = totalRecord;
		for(int i=0; i < list.size(); i++) {
			BookInfoDTO dto = list.get(i);
		
	%>
	<tr>
		<td><%=num %>(<%=dto.getInfoNo() %>)</td>
		<td><input type="text" name="infoNum_<%=i %>"
			value="<%=dto.getSubject() %>"></td>
		<td><%=dto.getCreated() %></td>
		<td><%=dto.getAuthorNo() %></td>
		<td><%=dto.getProfileNo() %></td>
		<td><%=dto.getRegiDate() %></td>
		<td><a href="#"
			onClick="move('sujung.jsp','<%=dto.getInfoNo() %>')">[수정]</a> <a
			href="#" onClick="move('sakje.jsp','<%=dto.getInfoNo() %>')">[삭제]</a>
		</td>
	</tr>
	<%
			num--;
			temp++;
		}
	%>
</table>
<input type="hidden" name="totalCounter" value="<%=temp%>">
</form>
<div style="borer : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
 <a href="#" onClick="sujung();">수정</a>
|
 <a href="#" onClick="move('list.jsp','');">목록</a>
|
<a href="#" onClick="move('chuga.jsp','');">등록</a>
|
</div>
<script>
	function move(value1, value2) {
		location.href = value1 + '?infoNo=' + value2;
	}
	function sujung() {
		if(confirm('수정할까요?')) {
			document.infoForm.action="listSujungProc.jsp";
			document.infoForm.method="post";
			document.infoForm.submit();
		}
	}
</script>
