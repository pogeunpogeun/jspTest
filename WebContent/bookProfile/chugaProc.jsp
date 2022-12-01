<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String profile = request.getParameter("profile");
	
	BookProfileDTO arguDto = new BookProfileDTO();
	arguDto.setProfile(profile);
	
	BookProfileDAO dao = new BookProfileDAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('추가 처리중 오류 발생.');");
		out.println("location.href='chuga.jsp';");
		out.println("</script>");
	}
%>