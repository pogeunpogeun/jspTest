<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>파일 읽기</h2>


<%
	String attachPath = "C:/HHJ/attach"; // C:\\??\\attach
	String uploadPath =  attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while (sReader.hasNextLine()) {
			String data = sReader.nextLine();
			out.println(data + "<br>");
		}
		sReader.close();
	} catch (Exception e) {
		//e.printStackTrace();

    }
%>

</body>
</html>