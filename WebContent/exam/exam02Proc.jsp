<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	

	String dbId = "kim";
	String dbPw = "0987";
	
	String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    String result = "로그인실패";
    if(id.equals(dbId) && pw.equals(dbPw)) {
    	result = "로그인성공";
    }
    out.println(result);
  
%>
