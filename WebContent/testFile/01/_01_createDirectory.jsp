<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>디렉토리 만들기</h2>
_01_createDirectory.jsp

<%
	String attachPath = "C:/HHJ/attach"; // C:\\??\\attach
	String uploadPath =  attachPath + "/testFile/aaa";
	
	java.io.File isDir = new java.io.File(uploadPath);
	
	if(isDir.exists()) {
		System.out.println("디렉토리존재");
	} else {
		System.out.println("디렉토리존재X");
		
		try {
			isDir.mkdirs();
			System.out.println("디렉토리 생성 성공");		
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println("디렉토리 생성 실패");
		}
	}
%>

</body>
</html>