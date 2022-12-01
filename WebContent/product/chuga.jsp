<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		
<%@include file = "_inc_top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>
<table border="1" width="80%" align="center">
	<tr>
		<td height="100px;" align="center">
		<%@include file = "../include/inc_menu.jsp" %>

		</td>
	</tr>
	<tr>
		<td height="300px;" align="center">
		<h2>회원등록</h2>
	<form name="chugaForm">
		<table border="1">
			<tr>
				<td>상품이름</td>
				<td><input type="text" name="productName"></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="text" name="productPrice"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><input type="text" name="productContent"></td>
			</tr>
			<tr>
				<td>상품분류</td>
				<td>
					<select name="productCategory">
					<option value="">-선택-</option>
					<option value="식료품">식료품</option>
					<option value="뷰티">뷰티</option>
					<option value="가전제품">가전제품</option>
					<option value="문구/팬시">문구/팬시</option>
					<option value="생활용품">생활용품</option>
					<option value="인테리어소품">인테리어소품</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" name="vendor"></td>
			</tr>
			<tr>
				<td colspan="2">
				<button type="button" onClick="add();">등록하기</button>
			    </td>
			</tr>
			
		</table>
	</form>
	</tr>
			<tr>
				<td height="100px;" align="center">
		 			Copyright 1900-2022 by localhost Co.LTD All Rights Reserved.
				</td>
			</tr>
	</table>
	<script>
		function add() {
			document.chugaForm.action="chugaProc.jsp";
			document.chugaForm.method="post";
			document.chugaForm.submit();
		}
	</script>
</body>
</html>