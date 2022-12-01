<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="memberBasic.MemberBasicDAO"%>
<%@page import="memberBasic.MemberBasicDTO"%>
<%
	String no_ = request.getParameter("no");
	
	int failCounter = 0;
	if(no_ == null || no_.trim().equals("")) {
		failCounter++;
	}
	
	int no = 0;
	try {
		no = Integer.parseInt(no_);
	} catch (Exception e) {
		//e.printStackTrace();
		no = 0;
	}
	
	if(no <= 0) {
		failCounter++;
	}
	
	if(failCounter > 0) {
		out.println("<script>");
		out.println("alert('비정상적인 접근.');");
		//out.println("location.href='list.jsp';");
		out.println("</script>");
	}
	MemberBasicDTO arguDto = new MemberBasicDTO();
	arguDto.setNo(no);
	
	MemberBasicDAO dao = new MemberBasicDAO();
	MemberBasicDTO resultDto = dao.getSelectOne(arguDto);
%>
<h2>회원상세보기</h2>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><%=resultDto.getId() %></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><%=resultDto.getName() %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=resultDto.getPhone() %></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><%=resultDto.getEmail() %></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><%=resultDto.getJumin().substring(0,7) %>*******</td>
			</tr>				
			<tr>
				<td>주소</td>
				<td><%=resultDto.getJuso1() %> <%=resultDto.getJuso2() %> <%=resultDto.getJuso3() %> <%=resultDto.getJuso4() %></td>
			</tr>
			<tr>
				<td>등록일</td>
				<td><%=resultDto.getRegiDate() %></td>
			</tr>					
		</table>
<div style="borer : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
|
 <a href="#" onClick="move('list.jsp','');">목록</a>
|
<a href="#" onClick="move('chuga.jsp','');">등록</a>
|
<a href="#" onClick="move('sujung.jsp','<%=resultDto.getNo() %>');">수정</a>
|
<a href="#" onClick="move('sakje.jsp','<%=resultDto.getNo() %>');">삭제</a>
</div>

<script>
	function move(value1,value2) {
		location.href = value1 + '?no=' + value2
	}
</script>
	
