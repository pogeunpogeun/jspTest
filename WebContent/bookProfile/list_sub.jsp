<%@page import="bookProfile.model.dto.BookProfileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BookProfileDAO dao = new BookProfileDAO();
	ArrayList<BookProfileDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
%>

<h2>분류목록</h2>
<form name="categoryForm">
<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>분류</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	
	<% if(totalRecord == 0) { %>
	<tr>
		<td colspan="3" height="200px" align="center">등록된 내용이 없습니다.</td>
	</tr>
	<% } %>	
	<%
	  int temp = 0;
      int num = totalRecord;
      for(int i=0; i < list.size(); i++) {
         BookProfileDTO dto = list.get(i);
   %>
         <tr>
            <td><%=num %>(<%=dto.getProfileNo() %>)</td>
            <td>
            	<input type="text" name="author_<%=i %>" value="<%=dto.getProfile() %>">
            </td>
            <td><%=dto.getRegiDate() %></td>
            <td>
               <a href="#" onClick="move('sujung.jsp','<%=dto.getProfileNo() %>')">[수정]</a>
               <a href="#" onClick="move('sakje.jsp','<%=dto.getProfileNo() %>')">[삭제]</a>
            </td>
         </tr>
   <%        
         num--;
   		 temp++;
      } 
   %>
</table>
<input type="hidden" name="totalCounter" value="<%=temp%>">
</form>
<div style="borer : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
 <a href="#" onClick="sujung();">수정</a>
|
 <a href="#" onClick="move('list.jsp','');">목록</a>
|
<a href="#" onClick="move('chuga.jsp','');">등록</a>
|
</div>
<script>
	function move(value1, value2) {
		location.href =  value1 + '?profileNo=' + value2;
	}
	function sujung() {
		if(confirm('수정할까요?')) {
		document.categoryForm.action="listSujungProc.jsp";
		document.categoryForm.method="post";
		document.categoryForm.submit();			
		}
	}
</script>