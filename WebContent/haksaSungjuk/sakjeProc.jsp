<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String sungjukNo_ = request.getParameter("sungjukNo");
	int sungjukNo = Integer.parseInt(sungjukNo_);
	
	HaksaSungjukDTO arguDto = new HaksaSungjukDTO();
	arguDto.setSungjukNo(sungjukNo);
	
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	int result = dao.setDelete(arguDto);
	
	if (result > 0) {
	      out.println("<script>");
	      out.println("alert('정상적으로 삭제되었습니다.');");
	      out.println("location.href='list.jsp?sungjukNo=" + sungjukNo + "';");
	      out.println("</script>");
	   } else {
	      out.println("<script>");
	      out.println("alert('정상적으로 삭제되지않았습니다.');");
	      out.println("location.href='sakje.jsp?sungjukNo=" + sungjukNo + "';");
	      out.println("</script>");
	   }
	
	
%>
