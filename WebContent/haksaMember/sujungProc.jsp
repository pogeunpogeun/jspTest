<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String parentPhone = request.getParameter("parentPhone");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String addr3 = request.getParameter("addr3");
	String addr4 = request.getParameter("addr4");
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	arguDto.setName(name);
	arguDto.setPhone(phone);
	arguDto.setParentPhone(parentPhone);
	arguDto.setAddr1(addr1);
	arguDto.setAddr2(addr2);
	arguDto.setAddr3(addr3);
	arguDto.setAddr4(addr4);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	int result = dao.setUpdate(arguDto);
	
	if (result > 0) {
	      out.println("<script>");
	      out.println("alert('정상적으로 수정되었습니다.');");
	      out.println("location.href='view.jsp?hakbun=" + hakbun + "';");
	      out.println("</script>");
	   } else {
	      out.println("<script>");
	      out.println("alert('정상적으로 수정되지않았습니다.');");
	      out.println("location.href='sujung.jsp?hakbun=" + hakbun + "';");
	      out.println("</script>");
	   }
	
%>