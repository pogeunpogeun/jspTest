<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String dan_ = request.getParameter("dan");
	int dan = 0;
	
	if(dan_ == null) {
		dan_ = "";
	} else {
		dan = Integer.parseInt(dan_);
	}	
	
	int startValue = dan;
	int endValue = 9;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>exam10.jsp</h2>

<form name = "guguForm">
입력 : 
<input type="text" name="dan" value="<%=dan_ %>">
<button type="button" onClick = "formSubmit();">확인</button>
</form>

<script>
function formSubmit() {
	document.guguForm.method = "post";
	document.guguForm.action = "exam10.jsp";
	document.guguForm.submit();
}
</script>

<hr>

<%
	if(dan <= 0) { return; }
		for(int i=startValue; i<=endValue; i++) {
			out.println(i + "<br>");
	
%>

		<table border = "0">
		 	<% for (int j=1; j<=9; j++) { %>
				<tr>
					<td><%=i %></td>
					<td>*</td>
					<td><%=j %></td>
					<td>=</td>
					<td><%=i*j %></td>
				</tr>
			<%} %>
		</table>
		<% if(i < endValue) { %>
		<hr> 
		<%} %>
	<%
		}
	%>

</table>
</body>
</html>