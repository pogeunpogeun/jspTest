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
<h2>시험결과수정</h2>
<form name="sujungForm">
<input type="hidden" name="sungjukNo" value="<%=resultDto.getSungjukNo() %>">
<table border="1" width="70%">
	<tr>
		<td>국어점수</td>
		<td><input type="text" name="kor" id="kor" value="<%=resultDto.getKor() %>"></td>
	</tr>
	<tr>
		<td>영어점수</td>
		<td><input type="text" name="eng" id="eng" value="<%=resultDto.getEng() %>"></td>
	</tr>
	<tr>
		<td>수학점수</td>
		<td><input type="text" name="mat" id="mat" value="<%=resultDto.getMat() %>"></td>
	</tr>
	<tr>
		<td>과학점수</td>
		<td><input type="text" name="sci" id="sci" value="<%=resultDto.getSci() %>"></td>
	</tr>
	<tr>
		<td>역사점수</td>
		<td><input type="text" name="his" id="his" value="<%=resultDto.getHis() %>"></td>
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
	if(confirm('수정할까요?')){
		document.sujungForm.action="sujungProc.jsp";
		document.sujungForm.method="post";
		document.sujungForm.submit();
	}
}
</script>