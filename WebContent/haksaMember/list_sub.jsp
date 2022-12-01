<%@page import="java.util.ArrayList"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    HaksaMemberDAO dao = new HaksaMemberDAO();
    ArrayList<HaksaMemberDTO> list = dao.getSelectAll();
    int totalRecord = list.size();
    
%>
<h2>학사정보</h2>
<form name="memberForm">
<table border="1" width ="80%" align="center">
<tr>
	<th>순번</th>
	<th>학번</th>
	<th>이름</th>
	<th>연락처</th>
	<th>부모연락처</th>
	<th>주소</th>
	<th>등록일</th>
</tr>

<% if (totalRecord == 0) { %>
	<tr>
		<td colspan = "7" height="200px" align="center">등록된 내용이 없습니다.</td>
	</tr>
	<%} %>
	
	<%
		int num = totalRecord;
		for(int i = 0; i<list.size(); i++) {
			HaksaMemberDTO dto = list.get(i);
	%>
	<tr>
		<td><%=num %></td>
		<td><a href="#" onClick="move('view.jsp','<%=dto.getHakbun() %>');"><%=dto.getHakbun() %></a></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getPhone() %></td>
		<td><%=dto.getParentPhone() %></td>
		<td><%=dto.getAddr1() %>&nbsp;<%=dto.getAddr2() %>&nbsp;<%=dto.getAddr3() %>&nbsp;<%=dto.getAddr4() %></td>
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
	location.href = value1 + '?hakbun=' + value2;
}
</script>