<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sungjukNo_ = request.getParameter("sungjukNo");
	int sungjukNo = Integer.parseInt(sungjukNo_);
	
	HaksaSungjukDTO arguDto = new HaksaSungjukDTO();
	arguDto.setSungjukNo(sungjukNo);
	
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	HaksaSungjukDTO resultDto = dao.getSelectOne(arguDto);
	
%>
<h2>시험성적상세보기</h2>
<table border="1" width="70%">
	<tr>
		<td>국어점수</td>
		<td><%=resultDto.getKor() %></td>
	</tr>
	<tr>
		<td>영어점수</td>
		<td><%=resultDto.getEng() %></td>
	</tr>
	<tr>
		<td>수학점수</td>
		<td><%=resultDto.getMat() %></td>
	</tr>
	<tr>
		<td>과학점수</td>
		<td><%=resultDto.getSci() %></td>
	</tr>
	<tr>
		<td>역사점수</td>
		<td><%=resultDto.getHis() %></td>
	</tr>
	<tr>
		<td>학번</td>
		<td><%=resultDto.getHakbun() %></td>
	</tr>
	<tr>
		<td>시험번호</td>
		<td><%=resultDto.getSihumNo() %></td>
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
	<a href="#" onclick="move('sujung.jsp','<%=sungjukNo %>');">수정</a>
	|
	<a href="#" onclick="move('sakje.jsp','<%=sungjukNo %>');">삭제</a>
	|
</div>
<script>
	function move(value1, value2) {
		location.href =  value1 + '?sungjukNo=' + value2;
	}
</script>