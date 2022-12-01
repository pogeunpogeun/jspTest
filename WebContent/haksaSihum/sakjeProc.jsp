<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String sihumNo_ = request.getParameter("sihumNo");
	int sihumNo = Integer.parseInt(sihumNo_);
	
	HaksaSihumDTO arguDto = new HaksaSihumDTO();
	arguDto.setSihumNo(sihumNo);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	int result = dao.setDelete(arguDto);
	if (result > 0) {
	      out.println("<script>");
	      out.println("alert('정상적으로 삭제되었습니다.');");
	      out.println("location.href='list.jsp?sihumNo=" + sihumNo + "';");
	      out.println("</script>");
	   } else {
	      out.println("<script>");
	      out.println("alert('정상적으로 삭제되지않았습니다.');");
	      out.println("location.href='sakje.jsp?sihumNo=" + sihumNo + "';");
	      out.println("</script>");
	   }
	
%>