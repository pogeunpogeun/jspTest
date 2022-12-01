<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file = "../include/inc_dbInfo.jsp" %>

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
         <table border="1" align="center">
         <h2>회원상세보기</h2>
            <tr>
            	<td>아이디</td>
            	<td><%=id %></td>			
            </tr>
            <tr>
            	<td>이름</td>
            	<td><%=name %></td>			
            </tr>
             <tr>
            	<td>전화번호</td>
            	<td><%=phone %></td>			
            </tr>
            <tr>
            	<td>이메일</td>
            	<td><%=email %></td>			
            </tr>
            <tr>
            	<td>주소</td>
            	<td><%=address %></td>			
            </tr>
           </table>
            <div style="borer : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
            |
            <a href="#" onClick="move('member2_list','');">목록</a>
            |
            <a href="#" onClick="move('member2_chuga','');">등록</a>
             |
            <a href="#" onClick="move('member2_sujung','<%=id%>');">수정</a>
             |
            <a href="#" onClick="move('member2_sakje','<%=id%>');">삭제</a>
            |
         </div>
<script>
function move(value1, value2) {
   location.href = "main.jsp?menuGubun=" + value1 + "&arg1=" + value2;
}
</script>

