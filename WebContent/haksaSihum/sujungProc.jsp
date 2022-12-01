<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String sihumNo_ = request.getParameter("sihumNo");
	int sihumNo = Integer.parseInt(sihumNo_);
	
	String sihumName = request.getParameter("sihumName");
	String sihumDate_ = request.getParameter("sihumDate");
	
	Date sihumDate = Date.valueOf(sihumDate_);
	
	HaksaSihumDTO arguDto = new HaksaSihumDTO();
	arguDto.setSihumNo(sihumNo);
	arguDto.setSihumName(sihumName);
	arguDto.setSihumDate(sihumDate);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	int result = dao.setUpdate(arguDto);
	
	if (result > 0) {
	      out.println("<script>");
	      out.println("alert('정상적으로 수정되었습니다.');");
	      out.println("location.href='view.jsp?sihumNo=" + sihumNo + "';");
	      out.println("</script>");
	   } else {
	      out.println("<script>");
	      out.println("alert('정상적으로 수정되지않았습니다.');");
	      out.println("location.href='sujung.jsp?sihumNo=" + sihumNo + "';");
	      out.println("</script>");
	   }
%>