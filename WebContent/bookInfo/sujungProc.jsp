<%@page import="java.sql.Date"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String infoNo_ = request.getParameter("infoNo");
	String subject = request.getParameter("subject");
	String created_ = request.getParameter("created");
	String authorNo_ = request.getParameter("authorNo");
	String profileNo_ = request.getParameter("profileNo");
	
	Date created = Date.valueOf(created_);
	int infoNo = Integer.parseInt(infoNo_);
	int authorNo = Integer.parseInt(authorNo_);
	int profileNo = Integer.parseInt(profileNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setInfoNo(infoNo);
	arguDto.setSubject(subject);
	arguDto.setCreated(created);
	arguDto.setAuthorNo(authorNo);
	arguDto.setProfileNo(profileNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리중 오류 발생.');");
		out.println("location.href='sujung.jsp?infoNo=" + infoNo + "';");
		out.println("</script>");
	}
%>