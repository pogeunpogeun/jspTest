<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String[] subjects = new String[5]; // 5개으 ㅣ값을 담는 배열
	subjects[0] = "국어";
	subjects[1] = "영어";
	subjects[2] = "수학";
	subjects[3] = "과학";
	subjects[4] = "역사";
	
	int[] score = new int[5];
	score[0] = 90;
	score[1] = 80;
	score[2] = 70;
	score[3] = 60;
	score[4] = 50;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test05.jsp</title>
</head>
<body>

<h2>test05.jsp</h2>

<table border = "1">
	<tr>
		<td>과목</td>
		<td>점수</td>
	</tr>
	<%
		for(int i = 0; i < subjects.length; i++) {
			
	%>
	<tr>
		<td><%=subjects[i] %></td>
		<td><%=score[i] %></td>
	</tr>
	<%
		}
	%>
</table>
</body>
</html>