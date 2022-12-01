<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	String address = request.getParameter("address");
	String[] hobbys = request.getParameterValues("hobby");
	
	out.println("id: " + id + "<br>");
	out.println("pw: " + pw + "<br>");
	out.println("name: " + name + "<br>");
	out.println("grade: " + grade + "<br>");
	out.println("address: " + address + "<br>");
	
	String imsi="";
	for(int i=0; i<hobbys.length; i++) {
		if(!imsi.equals("")) {
			imsi += ",";
		}
		imsi += hobbys[i];
	}
		
	out.println("hobbys: " + imsi + "<br>");
%>


