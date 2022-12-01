<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_fileInfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	String content = id + "/" + name + "/" + phone + "/" + email + "/" + address + "\n";

	int result = 0;
	try {
		//FileWriter fw = new FileWriter(uploadFile); //write
		FileWriter fw = new FileWriter(uploadFile, true); //append
		fw.write(content);
		fw.close();
		result++;
	} catch (Exception e) {
		//e.printStackTrace();
		result = 0;
	}
	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상적으로 등록되었습니다.');");
		out.println("location.href='listFile.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.');");
		out.println("location.href='chugaFile.jsp';");
		out.println("</script>");		
	}
%>