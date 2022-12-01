
<%@page import="java.sql.Date"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String subject = request.getParameter("subject");
	String created_ = request.getParameter("created");
	String authorNo_ = request.getParameter("authorNo");
	String profileNo_ = request.getParameter("profileNo");
	
	Date created = Date.valueOf(created_);
	int authorNo = Integer.parseInt(authorNo_);
	int profileNo = Integer.parseInt(profileNo_);
	
	System.out.println("subject : " + subject);
	System.out.println("created : " + created);
	System.out.println("authorNo : " + authorNo);
	System.out.println("profileNo : " + profileNo);

	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setSubject(subject);
	arguDto.setCreated(created);
	arguDto.setAuthorNo(authorNo);
	arguDto.setProfileNo(profileNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	int result = dao.setInsert(arguDto);
	
	System.out.println(result);
	
	if(result > 0) {
		out.println("<script>location.href='list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('추가 처리중 오류 발생.');");
		out.println("location.href='chuga.jsp';");
		out.println("</script>");
	}
%>