<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>파일 만들기</h2>
_02_createFile.jsp

<%
	String attachPath = "C:/HHJ/attach"; // C:\\??\\attach
	String uploadPath =  attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	// C:/HHJ/attach/testFile/aaa/test01.txt
	
	File f = new File(uploadFile);
	
	if(f.exists()) {
		System.out.println("파일이 존재함");
	} else {
		System.out.println("파일이 존재안함");
	}
	
	if(f.createNewFile()) {
		System.out.println("파일 생성됨 : " + f.getName());
	} else {
		System.out.println("파일이 생섬안됨");
	}
	
%>

</body>
</html>