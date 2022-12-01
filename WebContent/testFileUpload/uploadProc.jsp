<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="config.Constants" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String name = "";
	String subject = "";
	String fileName1 = "";
	int fileSize1 = 0;
	String fileName2 = "";
	int fileSize2 = 0;

	String attachPath = Constants.ATTACH_PATH;
	String uploadPath = attachPath + request.getContextPath() + "/testUpload";
	int maxUpload = Constants.MAX_UPLOAD;
	
	try {
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadPath,
				maxUpload,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		
		Enumeration files = multi.getFileNames();
		String file1 = (String)files.nextElement();
		String file2 = (String)files.nextElement();
		
		fileName1 = multi.getFilesystemName(file1);
		java.io.File f1 = multi.getFile(file1);
		fileSize1 = (int)f1.length();
		
		fileName2 = multi.getFilesystemName(file2);
		java.io.File f2 = multi.getFile(file2);
		fileSize2 = (int)f1.length();
				
	} catch (Exception e) {
		//e.printStackTrace();
	}
%>

이름 : <%=name%><br>
제목 : <%=subject%><br>

파일이름1 : <%=fileName1%><br>
파일용량1 : <%=fileSize1%><br>

파일이름2 : <%=fileName2%><br>
파일용량2 : <%=fileSize2%><br>