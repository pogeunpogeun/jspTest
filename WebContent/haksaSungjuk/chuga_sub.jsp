<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>시험결과등록</h2>
<form name="chugaForm">
<table border="1" width="70%">
	<tr>
		<td>국어점수</td>
		<td><input type="text" name="kor" id="kor"></td>
	</tr>
	<tr>
		<td>영어점수</td>
		<td><input type="text" name="eng" id="eng"></td>
	</tr>
	<tr>
		<td>수학점수</td>
		<td><input type="text" name="mat" id="mat"></td>
	</tr>
	<tr>
		<td>과학점수</td>
		<td><input type="text" name="sci" id="sci"></td>
	</tr>
	<tr>
		<td>역사점수</td>
		<td><input type="text" name="his" id="his"></td>
	</tr>
		<tr>
		<td>학번</td>
		<td><input type="text" name="hakbun" id="hakbun"></td>
	</tr>
		<tr>
		<td>시험번호</td>
		<td><input type="text" name="sihumNo" id="sihumNo"></td>
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
