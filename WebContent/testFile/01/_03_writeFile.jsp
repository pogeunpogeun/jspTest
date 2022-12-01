<%@page import="java.io.FileWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>파일에 쓰기</h2>
_03_writeFile.jsp

<%
	String attachPath = "C:/HHJ/attach"; // C:\\??\\attach
	String uploadPath =  attachPath + "/testFile/jspTest";
	String uploadFile = uploadPath + "/sample.txt";
	
	String content = "";
	content += "홍길동,90,80,70,60,50\n";
	content += "이성순,99,88,77,66,55\n";
	
	try {
		//FileWriter fw = new FileWriter(uploadFile); //write
		FileWriter fw = new FileWriter(uploadFile, true); //append
		fw.write(content);
		fw.close();
		System.out.println("저장성공");
	} catch (Exception e) {
		//e.printStackTrace();
		System.out.println("저장실패");
	}
%>
</body>
</html>