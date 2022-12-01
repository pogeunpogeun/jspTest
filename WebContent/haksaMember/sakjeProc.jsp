<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	int result = dao.setDelete(arguDto);
	
	if (result > 0) {
	      out.println("<script>");
	      out.println("alert('정상적으로 삭제되었습니다.');");
	      out.println("location.href='list.jsp?no=" + hakbun + "';");
	      out.println("</script>");
	   } else {
	      out.println("<script>");
	      out.println("alert('정상적으로 삭제되지않았습니다.');");
	      out.println("location.href='sakje.jsp?no=" + hakbun + "';");
	      out.println("</script>");
	   }

%>