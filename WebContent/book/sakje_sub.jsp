<%@page import="book.model.dto.BookDTO"%>
<%@page import="book.model.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	BookDTO arguDto = new BookDTO();
	arguDto.setNo(no);
	
	BookDAO dao = new BookDAO();
	BookDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>도서 삭제</h2>
<form name="sakjeForm">
<input type="hidden" name="no" value="<%=resultDto.getNo() %>">
<table border = "1">
	<tr>
		<td>제목</td>
		<td><%=resultDto.getSubject() %></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><%=resultDto.getAuthor() %></td>
	</tr>
	<tr>
		<td>발행일</td>
		<td><%=resultDto.getCreated() %></td>
	</tr>
	<tr>
		<td>분류</td>
		<td><%=resultDto.getProfile() %></td>
	</tr>
	<tr>
		<td colspan = "2" align="center">
		<button type="button" onClick="sakje();">삭제하기</button>
		</td>
	</tr>
</table>
</form>
<script>
	function sakje() {
		if (confirm('삭제하시겠습니까?')) {
			document.sakjeForm.action="sakjeProc.jsp";
			document.sakjeForm.method="post";
			document.sakjeForm.submit();
		}

	}
</script>