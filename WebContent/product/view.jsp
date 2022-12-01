
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file = "../include/inc_dbInfo.jsp" %>
<%@include file = "_inc_top.jsp" %>
<%@page import="java.sql.Date"%>

<%
	String arg1_ = request.getParameter("arg1");
	if(arg1_ == null || arg1_.trim().equals("")) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
		return;
	}
	
	int productCode = Integer.parseInt(arg1_);
	
	String productName = "";
	int productPrice = 0;
	String productContent = "";
	String productCategory = "";
	String vendor  = "";
	Date regiDate = null;
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
		pstmt.setInt(1, productCode);
		rs = pstmt.executeQuery();	
		if (rs.next()) {
			productCode = rs.getInt("productCode");
			productName = rs.getString("productName");
			productPrice = rs.getInt("productPrice");
			productContent = rs.getString("productContent");
			productCategory = rs.getString("productCategory");
			vendor = rs.getString("vendor");
			regiDate = rs.getDate("regiDate");
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
<title>Insert title here</title>
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
         <table border="1" align="center">
         <h2>제품상세보기</h2>
            <tr>
            	<td>상품이름</td>
            	<td><%=productName %></td>			
            </tr>
            <tr>
            	<td>상품가격</td>
            	<td><%=productPrice %></td>			
            </tr>
             <tr>
            	<td>상품설명</td>
            	<td><%=productContent %></td>			
            </tr>
            <tr>
            	<td>상품분류</td>
            	<td><%=productCategory %></td>			
            </tr>
            <tr>
            	<td>제조사</td>
            	<td><%=vendor %></td>			
            </tr>
             <tr>
            	<td>등록일</td>
            	<td><%=regiDate %></td>			
            </tr>
            
           </table>
            <div style="borer : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
            |
            <a href="#" onClick="move('list.jsp','');">목록</a>
            |
            <a href="#" onClick="move('chuga.jsp','');">등록</a>
             |
            <a href="#" onClick="move('sujung.jsp','<%=productCode%>');">수정</a>
             |
            <a href="#" onClick="move('sakje.jsp','<%=productCode%>');">삭제</a>
            |
         </div>
         </td>
   </tr>
   <tr>
      <td height="100px" align="center">
         <%@ include file = "../include/inc_bottom.jsp" %>
      </td>
   </tr>
</table>

<script>
function move(value1, value2) {
   location.href = value1 + "?arg1=" + value2;
}
</script>
</body>
</html>