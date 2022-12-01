<%@page import="memberBasic.MemberBasicDTO"%>
<%@page import="memberBasic.MemberBasicDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	String pwChk  = request.getParameter("pwChk");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String jumin1 = request.getParameter("jumin1");
	String jumin2 = request.getParameter("jumin2");
	String juso1 = request.getParameter("juso1");
	String juso2 = request.getParameter("juso2");
	String juso3 = request.getParameter("juso3");
	String juso4 = request.getParameter("juso4");
	
       out.println("id : " + id + "<br>");
	   out.println("passwd : " + passwd + "<br>");
	   out.println("pwChk : " + pwChk + "<br>");
	   out.println("name : " + name + "<br>");
	   out.println("phone : " + phone + "<br>");
	   out.println("email : " + email + "<br>");
	   out.println("jumin1 : " + jumin1 + "<br>");
	   out.println("jumin2 : " + jumin2 + "<br>");
	   out.println("juso1 : " + juso1 + "<br>");
	   out.println("juso2 : " + juso2 + "<br>");
	   out.println("juso3 : " + juso3 + "<br>");
	   out.println("juso4 : " + juso4 + "<br>"); 
	
	int failCounter = 0;
	if(id == null || id.trim().equals("")) { failCounter++; }
	if(passwd == null || passwd.trim().equals("")) { failCounter++; }
	if(pwChk == null || pwChk.trim().equals("")) { failCounter++; }
	if(name == null || name.trim().equals("")) { failCounter++; }
	if(phone == null || phone.trim().equals("")) { failCounter++; }
	if(email == null || email.trim().equals("")) { failCounter++; }
	if(jumin1 == null || jumin1.trim().equals("")) { failCounter++; }
	if(jumin2 == null || jumin2.trim().equals("")) { failCounter++; }
	
 	if(jumin1.trim().length() != 6) { failCounter++; }
	if(jumin2.trim().length() != 7) { failCounter++; }	 
	
	if(juso1 == null || juso1.trim().equals("")) { failCounter++; }
	if(juso2 == null || juso2.trim().equals("")) { failCounter++; }
	if(juso3 == null || juso3.trim().equals("")) { failCounter++; }
	if(juso4 == null || juso4.trim().equals("")) {
		juso4 = "-";
	}


	if(!passwd.equals(pwChk)) { failCounter++; }

	if(failCounter > 0) {
		out.println("<script>");
		out.println("alert('입력한 값이 정확하지 않습니다');");
		out.println("location.href = 'chuga.jsp';");
		out.println("</script>");
		return;
	}
	
	String jumin = jumin1 + jumin2;
	   
	MemberBasicDTO dto = new MemberBasicDTO();	
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setName(name);
	dto.setPhone(phone);
	dto.setEmail(email);
	dto.setJumin(jumin);
	dto.setJuso1(juso1);
	dto.setJuso2(juso2);
	dto.setJuso3(juso3);
	dto.setJuso4(juso4);
	
	MemberBasicDAO dao = new MemberBasicDAO();
	int result = dao.setInsert(dto);
	
	String ment = "등록 중 오류가 발생했습니다.";
	String moveUrl = "chuga.jsp";
	
	if(result > 0) {
		ment = "정상적으로 등록되었습니다.";
		moveUrl = "list.jsp";
	} 
	out.println("<script>");
	out.println("alert('" + ment + "');");
	out.println("location.href = '" + moveUrl + "';");
	out.println("</script>");
%>