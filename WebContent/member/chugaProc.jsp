
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file = "../include/inc_dbInfo.jsp" %>

    <%
    	request.setCharacterEncoding("UTF-8");
    	String id = request.getParameter("id");
    	String passwd = request.getParameter("passwd");
    	String pwCheck = request.getParameter("pwCheck");
    	String name = request.getParameter("name");
    	String phone = request.getParameter("phone");
    	String email = request.getParameter("email");
    	String address = request.getParameter("address");
    	
    	if(id == null || id.equals("")) {
/*     		out.println("아이디가 입력안댐");
    		//response.sendRedirect("chuga.jsp");
    		out.println("function move() {");
    		out.println("alert('aaa');");
    		out.println("location.href = 'chuga.jsp';");
    		out.println("}");
    		out.println("move();");
    		out.println("</script>"); */
%>
	    <script>
			function move() {
				location.href = 'chuga.jsp';
				//history.go(-1); - 바로 전 페이지
				//history.back(); - 바로 전 페이지
			}
			move();
		</script>
<% 
			 return;
    	}
    	if(passwd == null || passwd.equals("")) {
    		out.println("비밀번호가 입력안댐");
    		return;
    	}
    	if(pwCheck == null || pwCheck.equals("")) {
    		out.println("비밀번호 확인이 입력안댐");
    		return;
    	}
    	if(name == null || name.equals("")) {
    		out.println("이름이 입력안댐");
    		return;
    	}
    	if(phone == null || phone.equals("")) {
    		out.println("연락처가 입력안댐");
    		return;
    	}
    	if(email == null || email.equals("")) {
    		out.println("이메일이 입력안댐");
    		return;
    	}
    	if(address == null || address.equals("")) {
    		out.println("즈소가 입력안댐");
    		return;
    	}
    	
/*     	out.println("id" + id);
    	out.println("pw" + pw);
    	out.println("pwCheck" + pwCheck);
    	out.println("name" + name);
    	out.println("tel" + tel);
    	out.println("email" + email);
    	out.println("add" + add); */
    	

    	
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	int result = 0;
    	
    	try {
    		Class.forName(dbDriver);
    		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
    		System.out.println("오라클접속성공");
    		//--------------------------------------------------
    		String sql = "insert into member (id,passwd,name,phone,email,address,regiDate) values (?,?,?,?,?,?,sysdate)";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1,id);
    		pstmt.setString(2,passwd);
    		pstmt.setString(3,name);
    		pstmt.setString(4,phone);
    		pstmt.setString(5,email);
    		pstmt.setString(6,address);
    		result = pstmt.executeUpdate();
    		//--------------------------------------------------
    	} catch (Exception e) {
    		System.out.println("오라클접속실패");
    	} finally {
    		if (rs != null) { rs.close(); }
    		if (pstmt != null) { pstmt.close(); }
    		if (conn != null) { conn.close(); }
    		System.out.println("오라클접속해제");
    	}
    	
    	if(result > 0) {
    		response.sendRedirect("list.jsp");
    	} else {
    		//response.sendRedirect("chuga.jsp");
    		out.println("<script>");
    		out.println("alert('추가 처리 중 오류가 발생했습니다.');");
    		out.println("location.href='chuga.jsp';");
    		out.println("</script>");
    	}
%>
