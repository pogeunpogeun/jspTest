<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>학사정보등록</h2>
<form name="chugaForm">
<table border="1">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone" id="phone"></td>
	</tr>
	<tr>
		<td>부모연락처</td>
		<td><input type="text" name="parentPhone" id="parentPhone"></td>
	</tr>
	<tr>
		<td rowspan="3">주소</td>
			<td>
				<input type="text" name="addr1" id="sample6_postcode" placeholder="우편번호">
				<button type="button" onClick="sample6_execDaumPostcode();">우편번호 찾기</button>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="addr2" id="sample6_address" placeholder="주소">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="addr3" id="sample6_detailAddress" placeholder="상세주소">
				<input type="text" name="addr4" id="sample6_extraAddress" placeholder="참고항목">
			</td>
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
	if(confirm('저장할까요?')){
		document.chugaForm.action="chugaProc.jsp";
		document.chugaForm.method="post";
		document.chugaForm.submit();
	}
}
</script>
<%@ include file= "_inc_addressAPI.jsp"%>	