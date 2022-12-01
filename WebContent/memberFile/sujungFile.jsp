<%@ include file = "_inc_fileInfo.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String info = "";
	try {
		// java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String imsi = sReader.nextLine();
			String[] imsiArray = imsi.split("/");
			if(name.equals(imsiArray[1])) {
				info = imsi;
				break;
			}
		}
		sReader.close();
	} catch (Exception e) {
		//e.printStackTrace();
	}
	String[] tempArray = info.split("/");
	String id = tempArray[0];
	//String name = tempArray[1];
	String phone = tempArray[2];
	String email = tempArray[3];
    String address = tempArray[4];
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
<table border="1" width="80%" align="center">
   <tr>
      <td height="100px" align="center">
      <!-- 상단 메뉴 시작 -->
      <%@include file = "../include/inc_menu.jsp" %>   
      <!-- 상단 메뉴 종료 -->
      </td>
   </tr>
   <tr>
      <td height="300px" align="center">
      <!-- 본문 내용 시작 -->
		<h2>회원정보수정</h2>
		<form name="sujungForm">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><%=id %><input type="hidden" name="id" value="<%=id %>"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=name %><input type="hidden" name="name" value="<%=name %>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value="<%=phone%>"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="<%=email%>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" value="<%=address%>"></td>
			</tr>
			<tr>
				<td colspan="2">
				<button type="button" onClick="sujung();">수정하기</button>
				</td>
			</tr>		
		</table>
		</form>		
		</td>
	</tr>
	<tr>
		<td height="100px;" align="center">
		 	Copyright 1900-2022 by localhost Co.LTD All Rights Reserved.
		</td>
	</tr>
</table>
<script>
	function sujung() {
		document.sujungForm.action = "sujungFileProc.jsp";
		document.sujungForm.method = "post";
		document.sujungForm.submit();
}
</script>


</body>
</html>