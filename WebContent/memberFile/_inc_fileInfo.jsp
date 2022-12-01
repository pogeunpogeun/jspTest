<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import = "config.Constants" %>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%
	String attachPath = Constants.ATTACH_PATH;
	String uploadPath = attachPath + request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	
	java.io.File isDir = new java.io.File(uploadPath);
	if (!isDir.exists()) {
		try {
			isDir.mkdirs();
		} catch (Exception e) {
			//e.printStackTrace();
		}
	}
	java.io.File f = new java.io.File(uploadFile);
	if (!f.exists()) {
		f.createNewFile();
	}
	
%>
