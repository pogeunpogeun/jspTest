<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>시험정보등록</h2>
<form name="chugaForm">
<table border="1" width="70%">
	<tr>
		<td>시험명</td>
		<td><input type="text" name="sihumName" id="sihumName"></td>
	</tr>
	<tr>
		<td>시험날짜</td>
		<td><input type="date" name="sihumDate" id="sihumDate"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button type="button" onClick="chuga();">등록하기</button>
		</td>
	</tr>
</table>
</form>
<script>
function chuga() {
	if(confirm('등록할까요?')){
		document.chugaForm.action="chugaProc.jsp";
		document.chugaForm.method="post";
		document.chugaForm.submit();
	}
}
</script>