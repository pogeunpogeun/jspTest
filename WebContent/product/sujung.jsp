<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@include file = "../include/inc_dbInfo.jsp" %>
<%@include file = "_inc_top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String arg1 = request.getParameter("arg1");

	if(arg1 == null || arg1.trim().equals("")) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
		return;
	}
	
	int productCode = 0;
	String productName = "";
	int productPrice = 0;
	String productContent = "";
	String productCategory = "";
	String vendor  = "";
	Date regiDate;
	String strRegiDate = "";
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int result = 0;
	try {
		Class.forName(dbDriver);
		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		System.out.println("오라클접속성공");
		//--------------------------------------------------
		String sql = "select * from product where productCode=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, arg1);
		rs = pstmt.executeQuery();	
		if (rs.next()) {
			productCode = rs.getInt("productCode");
			productName = rs.getString("productName");
			productPrice = rs.getInt("productPrice");
			productContent = rs.getString("productContent");
			productCategory = rs.getString("productCategory");
			vendor = rs.getString("vendor");
			regiDate = rs.getDate("regiDate");
			strRegiDate = rs.getString("regiDate");		
		}
		//--------------------------------------------------
	} catch (Exception e) {
		System.out.println("오라클접속실패");
	} finally {
		if (rs != null) { rs.close(); }
		if (pstmt != null) { pstmt.close(); }
		if (conn != null) { conn.close(); }
		System.out.println("오라클접속해제");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보수정</title>
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
		<h2>상품정보수정</h2>
		<form name="sujungForm">
		<input type="text" name="arg1" value="<%=productCode%>" readonly>
		<table border="1">
			<tr>
				<td>상품이름</td>
				<td><input type="text" name="productName" value="<%=productName%>"></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="text" name="productPrice" value="<%=productPrice%>"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><input type="text" name="productContent" value="<%=productContent%>"></td>
			</tr>
			<tr>
				<td>상품분류</td>
				<td><input type="text" name="productCategory" value="<%=productCategory%>"></td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" name="vendor" value="<%=vendor%>"></td>
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
		document.sujungForm.action = "sujungProc.jsp";
		document.sujungForm.method = "post";
		document.sujungForm.submit();
}
</script>


</body>
</html>

</body>
</html>