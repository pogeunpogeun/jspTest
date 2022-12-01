
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setInfoNo(infoNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	BookInfoDTO resultDto = dao.getSelectOne(arguDto);
%>
<h2>저자수정</h2>
<form name="DirForm">
<input type="hidden" name="infoNo" id="infoNo" value="<%=infoNo %>">
<table border="1">
	<tr>
		<td>순번</td>
		<td><input type="text" name="infoNo" id="infoNo" value="<%=resultDto.getInfoNo()%>"></td>
	</tr>
		<tr>
		<td>제목</td>
		<td><input type="text" name="subject" id="subject" value="<%=resultDto.getSubject()%>"></td>
	</tr>
	<tr>
		<td>발행일</td>
		<td><input type="date" name="created" id="created"></td>
	</tr>
	<tr>
		<td>저자번호</td>
		<td><input type="text" name="authorNo" id="authorNo" value="<%=resultDto.getAuthorNo()%>"></td>
	</tr>
	<tr>
		<td>분류번호</td>
		<td><input type="text" name="profileNo" id="profileNo" value="<%=resultDto.getProfileNo()%>"></td>
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