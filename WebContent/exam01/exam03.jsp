<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<table border="1">
<% 
	int sum = 0;
	for(int i=0; i<10; i++) { 
		sum += i + 1; %>
		<tr>
			<td><%=i+1 %></td>
			<td><%=sum %></td>
		</tr>
<% 	
	}
%>

</table>




