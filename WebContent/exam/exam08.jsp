<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="exam08Form">
<table border="1">
	<tr>
		<td>관심분야</td>
		<td>
			<input type="checkbox" name="hobby1" value="영화"> 영화 &nbsp;
			<input type="checkbox" name="hobby2" value="독서"> 독서 &nbsp;
			<input type="checkbox" name="hobby3" value="음악"> 음악 &nbsp;
			<br>
			<input type="checkbox" name="hobby4" value="캠핑"> 캠핑 &nbsp;
			<input type="checkbox" name="hobby5" value="골프"> 골프 &nbsp;
			<input type="checkbox" name="hobby6" value="등산"> 등산 &nbsp;
			<br>
			<input type="checkbox" name="hobby7" value="스쿠버"> 스쿠버 &nbsp;
			<input type="checkbox" name="hobby8" value="모터사이클"> 모터사이클 &nbsp;
			<input type="checkbox" name="hobby9" value="자동차"> 자동차 &nbsp;		
		</td>
	</tr>
	<tr>
	<td colspan="2">
	<button type="button" onClick="formSubmit();">확인</button>
	</tr>	
</table>
</form>
<script>
	function formSubmit() {
		document.exam08Form.action="exam08Proc.jsp";
		document.exam08Form.method="post";
		document.exam08Form.submit();
	}
</script>
</body>
</html>