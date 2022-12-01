<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>

<%@include file = "../include/inc_dbInfo.jsp" %>
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
	
	String id = "";
	String passwd = "";
	String name = "";
	String phone = "";
	String email = "";
	String address = "";
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
		String sql = "select * from member where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, arg1);
		rs = pstmt.executeQuery();	
		if (rs.next()) {
			id = rs.getString("id");
			passwd = rs.getString("passwd");
			name = rs.getString("name");
			phone = rs.getString("phone");
			email = rs.getString("email");
			address = rs.getString("address");
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
		<h2>회원정보수정</h2>
		<form name="sujungForm">
		<input type="text" name="arg1" value="<%=id%>">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=name %></td>
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
<script>
	function sujung() {
		document.sujungForm.action = "mainProc.jsp?menuGubun=member2_sujungProc";
		document.sujungForm.method = "post";
		document.sujungForm.submit();
}
</script>