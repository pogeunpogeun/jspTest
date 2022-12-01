<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String[] name = request.getParameterValues("name");
	String grade = request.getParameter("grade");
	
	String imsi = "";
	for(int i=0; i<name.length; i++) {
		if(!name.equals("")) {
			imsi += ",";
		}
		imsi += name[i];
	}
	imsi = imsi.substring(1);
	out.println("이름: " + imsi + "<br>");
	out.println("회원등급: " + grade + "<br>");



%>


