<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	HaksaMemberDTO resultDto = dao.getSelectOne(arguDto);

%>
<h2>학생상세보기</h2>
<table border="1" width="70%">

	<tr>
		<td>이름</td>
		<td><%=resultDto.getName() %></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><%=resultDto.getPhone() %></td>
	</tr>
	<tr>
		<td>부모연락처</td>
		<td><%=resultDto.getParentPhone() %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=resultDto.getAddr1() %>&nbsp;<%=resultDto.getAddr2() %>&nbsp;<%=resultDto.getAddr3() %>&nbsp;<%=resultDto.getAddr4() %></td>
	</tr>
	<tr>
		<td>등록일</td>
		<td><%=resultDto.getRegiDate() %></td>
	</tr>
</table>
<div style="border: 0px solid blue; width:70%; margin-top:10px; margin-bottom:20px;" align="right">
	|
	<a href="#" onclick="move('list.jsp','');">목록</a>
	|
	<a href="#" onclick="move('chuga.jsp','');">등록</a>
	|
	<a href="#" onclick="move('sujung.jsp','<%=hakbun %>');">수정</a>
	|
	<a href="#" onclick="move('sakje.jsp','<%=hakbun %>');">삭제</a>
	|
</div>
<script>
	function move(value1, value2) {
		location.href =  value1 + '?hakbun=' + value2;
	}
</script>