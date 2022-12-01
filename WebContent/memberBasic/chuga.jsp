<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" width="80%" align="center">
	<tr>
		<td height="100px" align="center">
			<jsp:include page="../include/inc_menu.jsp" flush="true"></jsp:include>
		</td>
	</tr>
		<!-- 본문내용 -->
	<tr>
		<td height = "450px" align = "center">
		<%@include file="chuga_sub.jsp" %>
		</td>
	</tr>
		<!-- 본문내용끝 -->
	<tr>
		<td height="100px" align="center">
			<jsp:include page="../include/inc_bottom.jsp" flush="true"></jsp:include>
		</td>
	</tr>	
</table>
<script>
	function chuga() {
		if(confirm('가입하시겠습니까?')) {
			document.chugaForm.action = "chugaProc.jsp";
			document.chugaForm.method = "post";
			document.chugaForm.submit();
		}
	}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>