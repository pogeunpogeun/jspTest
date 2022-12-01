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

<h2>도서 수정</h2>
<form name="sujungForm">
<input type="hidden" name="no" value="<%=resultDto.getNo() %>">
<table border = "1">
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" id="subject" value="<%=resultDto.getSubject() %>"></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><input type="text" name="author" id="author" value="<%=resultDto.getAuthor() %>"></td>
	</tr>
	<tr>
		<td>발행일</td>
		<td><input type="date" name="created" id="created" value="<%=resultDto.getCreated() %>"></td>
	</tr>
	<tr>
		<td>분류</td>
		<td><input type="text" name="profile" id="profile" value="<%=resultDto.getProfile() %>"></td>
	</tr>
	<tr>
		<td colspan = "2" align="center">
		<button type="button" onClick="sujung();">수정하기</button>
		</td>
	</tr>
</table>
</form>
<script>
	function sujung() {
		if (confirm('수정하시겠습니까?')) {
			document.sujungForm.action="sujungProc.jsp";
			document.sujungForm.method="post";
			document.sujungForm.submit();
		}

	}
</script>