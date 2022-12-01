<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>도서 등록</h2>
<form name="DirForm">
<table border = "1">
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" id="subject"></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><input type="text" name="author" id="author"></td>
	</tr>
	<tr>
		<td>발행일</td>
		<td><input type="date" name="created" id="created"></td>
	</tr>
	<tr>
		<td>분류</td>
		<td><input type="text" name="profile" id="profile"></td>
	</tr>
	<tr>
		<td colspan = "2" align="center">
		<button type="button" onClick="formSubmit();">등록하기</button>
		<button type="button" onClick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>
<script>
	function formSubmit() {
		if (confirm('저장하시겠습니까?')) {
			document.DirForm.action="chugaProc.jsp";
			document.DirForm.method="post";
			document.DirForm.submit();
		}

	}
</script>