<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="submitForm" method="post" action="exam05Proc.jsp">
<table border="1">
	<tr>
		<td>사원번호</td>
		<td><input type="text" name="empNo"></td>
	</tr>
	<tr>
		<td>사원명</td>
		<td><input type="text" name="empName"></td>
	</tr>
	<tr>
		<td>부서명</td>
		<td><input type="text" name="dept"></td>
	</tr>
	<tr>
		<td>급여</td>
		<td><input type="text" name="salary"></td>
	</tr>
	<tr>
		<td>부서장명</td>
		<td><input type="text" name="leader"></td>
	</tr>
	<tr>
		<td colspan="2"><button type="button" onClick="submit();">입력하기</button></td>
	</tr>		
</table>
</form>
<script>
function submit() {
	document.submitForm.submit();
}
</script>