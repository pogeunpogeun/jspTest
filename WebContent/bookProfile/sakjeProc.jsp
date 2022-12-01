<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String profileNo_ = request.getParameter("profileNo");
	
	int profileNo = Integer.parseInt(profileNo_);
	
	BookProfileDTO arguDto = new BookProfileDTO();
	arguDto.setProfileNo(profileNo);
	
	BookProfileDAO dao = new BookProfileDAO();
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('삭제 처리중 오류 발생.');");
		out.println("location.href='sakje.jsp?profileNo=" + profileNo + "';");
		out.println("</script>");
	}
%>