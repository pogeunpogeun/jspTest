<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sihumNo_ = request.getParameter("sihumNo");
	int sihumNo = Integer.parseInt(sihumNo_);
	
	HaksaSihumDTO arguDto = new HaksaSihumDTO();
	arguDto.setSihumNo(sihumNo);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	HaksaSihumDTO resultDto = dao.getSelectOne(arguDto);
%>
<h2>시험정보상세보기</h2>
<table border="1" width="70%">
	<tr>
		<td>시험명</td>
		<td><%=resultDto.getSihumName() %></td>
	</tr>
	<tr>
		<td>시험번호</td>
		<td><%=resultDto.getSihumNo() %></td>
	</tr>
	<tr>
		<td>시험날짜</td>
		<td><%=resultDto.getSihumDate() %></td>
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
	<a href="#" onclick="move('sujung.jsp','<%=sihumNo %>');">수정</a>
	|
	<a href="#" onclick="move('sakje.jsp','<%=sihumNo %>');">삭제</a>
	|
</div>
<script>
	function move(value1, value2) {
		location.href =  value1 + '?sihumNo=' + value2;
	}
</script>