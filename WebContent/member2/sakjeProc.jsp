<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file = "../include/inc_dbInfo.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <%
    	request.setCharacterEncoding("UTF-8");
    
    	String arg1 = request.getParameter("arg1");
    	String passwd = request.getParameter("passwd");
   	
    	if(arg1 == null || arg1.trim().equals("")) {
    		out.println("<script>");
    		out.println("alert('정상적인 접속이 아닙니다.');");
    		out.println("location.href= 'list.jsp';");
    		out.println("</script>");
    		return;
    	}
    	
    	if(passwd == null || passwd.trim().equals("")) {
    		out.println("비밀번호 비정상");
    		return;
    	}
    	Connection conn = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	int result = 0;
    	try {	
    		Class.forName(dbDriver);
    		conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
    		System.out.println("오라클접속성공");
    		//--------------------------------------------------
		  	String sql = "delete from member where id=? and passwd=?";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1,arg1);
    		pstmt.setString(2,passwd);
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
    	      //response.sendRedirect("<script>alert('정상적으로 수정되었습니다');location.href='view.jsp?arg1=" + arg1 + "';</script>");//view.jsp의 getParameter("arg1") 
    	      out.print("<script>");
    	      out.print("alert('정상적으로 삭제되었습니다');");
    	      out.print("location.href='main.jsp?menuGubun=member2_list';");
    	      out.print("</script>");
    	   } else {
    	      out.print("<script>");
    	      out.print("alert('삭제처리 중 오류가 발생했습니다');");
    	      out.print("location.href='main.jsp?menuGubun=member2_sakje&arg1" + arg1 + "';");
    	      out.print("</script>");
    	   }
    	//response.sendRedirect("view.jsp");

    %>
    	
    	

    
    