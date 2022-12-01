<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file = "../include/inc_dbInfo.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	String productName = request.getParameter("productName");
    	String productPrice_ = request.getParameter("productPrice");
    	String productContent = request.getParameter("productContent");
    	String productCategory = request.getParameter("productCategory");
    	String vendor = request.getParameter("vendor");
    	
/*     	int productPrice = 0;
    	try {
    		productPrice = Integer.parseInt(productPrice_);
    	} catch (Exception e) {
    		productPrice = 0;
    	} */
    	
    	String imsi = productPrice_;
    	for (int i=0; i<=9; i++) {
    		imsi = imsi.replace(i + "","");    		
    	}
    	int productPrice = 0;
    	if (imsi.equals("")) { // if length() <= 0
    		productPrice = Integer.parseInt(productPrice_);
    	}
    	
    	if(productName == null || productName.equals("")) {
    		out.println("상품이름 입력 오류");
    		return;
    	}
    	  	
    	if(productContent == null || productContent.equals("")) {
    		out.println("상품설명 입력 오류");
    		return;
    	}
    	if(productCategory == null || productCategory.equals("")) {
    		out.println("상품분류 입력 오류");
    		return;
    	}
    	if(vendor == null || vendor.equals("")) {
    		out.println("제조사 입력 오류");
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
    		String sql = "insert into product values (seq_product.nextval,?,?,?,?,?,sysdate)";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1,productName);
    		pstmt.setInt(2,productPrice);
    		pstmt.setString(3,productContent);
    		pstmt.setString(4,productCategory);
    		pstmt.setString(5,vendor);
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
