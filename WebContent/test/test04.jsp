<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>text04.jsp</h2>

<hr>
<table border="1" width="100px">

	<%
		int sum = 0;
		for(int i = 1; i<10; i++) {
			sum += i;
	%>
		<tr>
			<td><%=i %></td>
			<td><%=sum %></td>
		</tr>
	<%
		}
	%>

</table>

<hr>

<table border="1" width="500px">
	<tr bgcolor="#FFF333">
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<%
		for(int i=1; i<=10; i++) {
			/* String imsiBg = "";
			if(i % 2 == 0) {
				imsiBg = "bgcolor = 'gray'";
			} */
	%>
	
		<%
			if (i % 2 == 0) { %>
			<tr bgcolor = "gray">
		<% } else { %>
			<tr bgcolor = "magenta">
		<% } %>
		<td><%=i %></td>
		<td>연습입니다.</td>
		<td>홍길동</td>
		<td>2022-08-02</td>
		<td>21</td>
	</tr>
	<%
		}
	%>

</table>

<hr>

<table border="1" width="500px">
	<tr bgcolor="#FFF333">
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%
		int k = 0;
		while (k < 5) {
			
	%>
		<tr>
			<td><%=k %></td>
			<td>연습입니다.</td>
			<td>홍길동</td>
			<td>2022-08-02</td>
			<td>21</td>
		</tr>
		<%
			k++;
		}
		%>

</body>
</html>