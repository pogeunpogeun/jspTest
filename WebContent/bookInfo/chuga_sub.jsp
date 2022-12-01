<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>도서 등록</h2>
<form name="DirForm">
<table border="1">
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" id="subject"></td>
	</tr>
	<tr>
		<td>발행일</td>
		<td><input type="date" name="created" id="created"></td>
	</tr>
	<tr>
		<td>저자번호</td>
		<td><input type="text" name="authorNo" id="authorNo"></td>
	</tr>
	<tr>
		<td>분류번호</td>
		<td><input type="text" name="profileNo" id="profileNo"></td>
	</tr>		
	<tr>
		<td colspan="2">
			<button type="button" onClick="formSubmit();">등록하기</button>
			<button type="button" onClick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>
<script>
	function formSubmit() {
		if(confirm('저장할까요?')) {
			document.DirForm.action="chugaProc.jsp";
			document.DirForm.method="post";
			document.DirForm.submit();
			alert('aaa');
		}
	}
</script>