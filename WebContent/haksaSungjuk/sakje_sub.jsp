<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sungjukNo_ = request.getParameter("sungjukNo");
	int sungjukNo = Integer.parseInt(sungjukNo_);
	
	HaksaSungjukDTO arguDto = new HaksaSungjukDTO();
	arguDto.setSungjukNo(sungjukNo);
	
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	HaksaSungjukDTO resultDto = dao.getSelectOne(arguDto);
	
%>   
<h2>시험결과삭제</h2>
<form name="sakjeForm">
<input type="hidden" name="sungjukNo" value="<%=resultDto.getSungjukNo() %>">
<table border="1" width="70%">
	<tr>
		<td>학번</td>
		<td><%=resultDto.getHakbun() %></td>
	</tr>
	<tr>
		<td>시험번호</td>
		<td><%=resultDto.getSihumNo() %></td>
	</tr>
	<tr>
		<td>국어점수</td>
		<td><%=resultDto.getKor() %></td>
	</tr>
	<tr>
		<td>영어점수</td>
		<td><%=resultDto.getEng() %></td>
	</tr>
	<tr>
		<td>수학점수</td>
		<td><%=resultDto.getMat() %></td>
	</tr>
	<tr>
		<td>과학점수</td>
		<td><%=resultDto.getSci() %></td>
	</tr>
	<tr>
		<td>역사점수</td>
		<td><%=resultDto.getHis() %></td>
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