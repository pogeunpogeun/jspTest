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
<h2>시험정보수정</h2>
<form name="sujungForm">
<input type="hidden" name="sihumNo" value="<%=resultDto.getSihumNo() %>">
<table border="1" width="70%">
	<tr>
		<td>시험명</td>
		<td><input type="text" name="sihumName" id="sihumName" value="<%=resultDto.getSihumName()%>"></td>
	</tr>
	<tr>
		<td>시험날짜</td>
		<td><input type="date" name="sihumDate" id="sihumDate" value="<%=resultDto.getSihumDate()%>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
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