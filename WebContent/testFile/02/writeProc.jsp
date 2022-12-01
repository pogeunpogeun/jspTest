<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.FileWriter"%>
<%

	request.setCharacterEncoding("UTF-8");		
		
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	


	String attachPath = "C:/HHJ/attach";
	String uploadPath =  attachPath + "/testFile" + request.getContextPath();;
	String uploadFile = uploadPath + "/sample.txt";
	
	String imsi = "";
	imsi += name + ",";
	imsi += email + ",";
	imsi += subject + ",";
	imsi += content+"\n";
	
	String ment = "";
	try {
		FileWriter fw = new FileWriter(uploadFile, true);
		fw.write(imsi);
		fw.close();
		ment = "저장성공";
	} catch (Exception e) {
		//e.printStackTrace();
		ment = "저장실패";
	}
	
	out.println("<script>");
	out.println("alert('" + ment + "');");
	out.println("location.href = 'write.jsp';");
	out.println("</script>");
	


%>
writeProc.jsp
attach/testFile/jspTest/sample.txt
홍길동,hong@gmail.com,제목1,내용1