<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");


	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String email=request.getParameter("email");
	String address=request.getParameter("address");


	
	String attachPath = "C:/JIJ/attach";
	String uploadPath = attachPath + "/testFile"+request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	
	String content = "";
	content=id+"|"+pw+"|"+name+"|"+phone+"|"+email+"|"+address+"\n";

	try {
		FileWriter fw = new FileWriter(uploadFile, true);
		fw.write(content);
		fw.close();
		out.print("<script>");
		out.print("location.href='list.jsp';");
		out.print("</script>");
	} catch(Exception e) {
		out.print("<script>");
		out.print("alert('저장실패')");
		out.print("location.href='chuga.jsp';");
		out.print("</script>");
	}
	
	
	
%>