<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String authorNo_ = request.getParameter("authorNo");
	
	int authorNo = Integer.parseInt(authorNo_);
	
	BookAuthorDTO arguDto = new BookAuthorDTO();
	arguDto.setAuthorNo(authorNo);
	
	BookAuthorDAO dao = new BookAuthorDAO();
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('삭제 처리중 오류 발생.');");
		out.println("location.href='sakje.jsp?authorNo=" + authorNo + "';");
		out.println("</script>");
	}
%>