<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_fileInfo.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String kor_ = request.getParameter("kor");
	String eng_ = request.getParameter("eng");
	String mat_ = request.getParameter("mat");
	String sci_ = request.getParameter("sci");
	String his_ = request.getParameter("his");
	
	String msg = name + "," + kor_ + "," + eng_ + "," + mat_ + "," + sci_ + "," + his_ + "\n";
	
	// 파일 저장 과정
	int result = 0;
	try {
		FileWriter fw = new FileWriter(uploadFile, true);
		fw.write(msg);
		fw.close();
		result++;
	} catch (Exception e) {
		//e.printStackTrace();
		result = 0;
	}
	
	// 저장여부 판별 과정
	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상적으로 등록되었습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.');");
		out.println("location.href='chuga.jsp';");
		out.println("</script>");		
	}

	
%>
