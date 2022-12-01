<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String attachPath = "C:/HHJ/attach"; // C:\\??\\attach
	String uploadPath =  attachPath + "/testFile/jspTest";
	String uploadFile = uploadPath + "/sample.txt";
	
	try {
		List<String> lines = Files.readAllLines(Paths.get(uploadFile));
		System.out.println(lines + "<br>");
		
		out.println("--------------------------------------------");
		
		byte[] bytes = Files.readAllBytes(Paths.get(uploadFile));
		out.println(new String(bytes) + "<br>");
		
		out.println("--------------------------------------------");
		
		String str = Files.readString(Paths.get(uploadFile));
		out.println(str + "<br>");
				
	} catch (Exception e) {
		//e.printStackTrace();

    }
%>
</body>
</html>