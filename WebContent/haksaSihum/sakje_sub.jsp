<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sihumNo_ = request.getParameter("sihumNo");
	int sihumNo = Integer.parseInt(sihumNo_);
	
	HaksaSihumDTO arguDto = new HaksaSihumDTO();
	arguDto.setSihumNo(sihumNo);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	HaksaSihumDTO resultDto = dao.getSelectOne(arguDto);
%>
    
<h2>시험정보삭제</h2>
<form name="sakjeForm">
<input type="hidden" name="sihumNo" value="<%=resultDto.getSihumNo() %>">
<table border="1" width="70%">
	<tr>
		<td>시험명</td>
		<td><%=resultDto.getSihumName() %></td>
	</tr>
	<tr>
		<td>시험번호</td>
		<td><%=resultDto.getSihumNo() %></td>
	</tr>
	<tr>
		<td>시험날짜</td>
		<td><%=resultDto.getSihumDate() %></td>
	</tr>
	<tr>
		<td>등록일</td>
		<td><%=resultDto.getRegiDate() %></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
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