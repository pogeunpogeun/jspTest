<%@page import="java.util.ArrayList"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BookAuthorDAO dao = new BookAuthorDAO();
	ArrayList<BookAuthorDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
%>

<h2>저자목록</h2>
<form name="listForm">
<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>저자</th>
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
         BookAuthorDTO dto = list.get(i);
   %>
         <tr>
            <td><%=num %>(<%=dto.getAuthorNo() %>)</td>
            <td>
            	<input type="text" name="author_<%=i %>" value="<%=dto.getAuthor() %>">
            </td>
            <td><%=dto.getRegiDate() %></td>
            <td>
               <a href="#" onClick="move('sujung.jsp','<%=dto.getAuthorNo() %>')">[수정]</a>
               <a href="#" onClick="move('sakje.jsp','<%=dto.getAuthorNo() %>')">[삭제]</a>
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
		location.href =  value1 + '?authorNo=' + value2;
	}
	function sujung() {
		if(confirm('수정할까요?')) {
		document.listForm.action="listSujungProc.jsp";
		document.listForm.method="post";
		document.listForm.submit();			
		}
	}
</script>