<%@page import="java.util.ArrayList"%>
<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    HaksaSungjukDAO dao = new HaksaSungjukDAO();	
	ArrayList<HaksaSungjukDTO> list = dao.getSelectAll();
	int totalRecord = list.size();
%>
<h2>학사성적</h2>
<form name="sungjukForm">
<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>성적번호</th>
		<th>학번</th>
		<th>시험번호</th>
		<th>국어점수</th>
		<th>영어점수</th>
		<th>수학점수</th>
		<th>과학점수</th>
		<th>역사점수</th>
		<th>총점</th>
		<th>평균</th>
		<th>등급</th>
		<th>등록일</th>
	</tr>
	<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="12" height="200px" align="center">
		등록된 정보가 없습니다.
		</td>
	</tr>
<% } %>

	<%
		int num = totalRecord;
		for(int i = 0; i<list.size(); i++) {
			HaksaSungjukDTO dto = list.get(i);
	%>
	<tr>
		<td><%=num %></td>
		<td><a href="#" onClick="move('view.jsp','<%=dto.getSungjukNo() %>');"><%=dto.getSungjukNo() %>
		<td><%=dto.getHakbun() %></td>
		<td><%=dto.getSihumNo() %></td>
		<td><%=dto.getKor() %></td>
		<td><%=dto.getEng() %></td>
		<td><%=dto.getMat() %></td>
		<td><%=dto.getSci() %></td>
		<td><%=dto.getHis() %></td>
		<td><%=dto.getTot() %></td>
		<td><%=dto.getAvg() %></td>
		<td><%=dto.getGrade() %></td>
		<td><%=dto.getRegiDate() %></td>
	</tr>
	<%
		num--;
		}
	%>		
</table>
</form>
<div style="border: 0px solid blue; width:80%; margin-top:10px; margin-bottom:10px;" align="right">
	|
	<a href="#" onclick="move('list.jsp','');">목록</a>
	|
	<a href="#" onclick="move('chuga.jsp','');">등록</a>
	|
</div>

<script>
function move(value1,value2){
	location.href = value1 + '?sungjukNo=' + value2;
}
</script>