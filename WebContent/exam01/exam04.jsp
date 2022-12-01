<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form name="submitForm" method="post" action="exam04Proc.jsp">
<table border="1">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="addr"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age"></td>
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