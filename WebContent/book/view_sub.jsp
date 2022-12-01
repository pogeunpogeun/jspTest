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

<h2>도서 상세보기</h2>
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
</table>
<div style="borer : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
|
 <a href="#" onClick="move('list.jsp','');">목록</a>
|
<a href="#" onClick="move('chuga.jsp','');">등록</a>
|
<a href="#" onClick="move('sujung.jsp','<%=no %>');">수정</a>
|
<a href="#" onClick="move('sakje.jsp','<%=no %>');">삭제</a>

</div>
<script>
	function move(value1, value2) {
		location.href =  value1 + '?no=' + value2;
	}
</script>
