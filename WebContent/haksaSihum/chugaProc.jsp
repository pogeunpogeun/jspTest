<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String sihumName = request.getParameter("sihumName");
	String sihumDate_ = request.getParameter("sihumDate");
	
	Date sihumDate = Date.valueOf(sihumDate_);
	
	HaksaSihumDTO arguDto = new HaksaSihumDTO();
	arguDto.setSihumName(sihumName);
	arguDto.setSihumDate(sihumDate);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href= 'list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('추가 처리중 오류 발생');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
%>