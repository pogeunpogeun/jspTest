<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String authorNo_ = request.getParameter("authorNo");
	int authorNo = Integer.parseInt(authorNo_);
	
	BookAuthorDTO arguDto = new BookAuthorDTO();
	arguDto.setAuthorNo(authorNo);
	
	BookAuthorDAO dao = new BookAuthorDAO();
	BookAuthorDTO resultDto = dao.getSelectOne(arguDto);
%>
<h2>저자수정</h2>
<form name="DirForm">
<input type="hidden" name="authorNo" id="authorNo" value="<%=authorNo %>">
<table border="1">
	<tr>
		<td>저자명</td>
		<td><input type="text" name="author" id="author" value="<%=resultDto.getAuthor()%>"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="formSubmit();">저장하기</button>
			<button type="button" onClick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>
<script>
	function formSubmit() {
		if(confirm('저장할까요?')) {
			document.DirForm.action="sujungProc.jsp";
			document.DirForm.method="post";
			document.DirForm.submit();
		}
	}
</script>