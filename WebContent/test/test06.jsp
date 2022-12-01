<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String imsiInfo01 = "홍길동/90/80/70";
	String imsiInfo02 = "이성순/99/88/77";
	String imsiInfo03 = "장천용/100/100/100";	
	String memo = imsiInfo01 + "|" + imsiInfo02 + "|" + imsiInfo03;
	
	String[] person = memo.split("[|]");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test06.jsp</title>
</head>
<body>
<h2>test06.jsp</h2>
<table border="1">
	<tr>
		<td>이름</td>
		<td>국어</td>
		<td>영어</td>
		<td>수학</td>
	</tr>
	<%
		for(int i = 0; i<person.length; i++) {
			String[] person1 = person[i].split("/");
			String name = person1[0];
			String kor = person1[1];
			String eng = person1[2];
			String mat = person1[3];
	%>
		<tr>
		<td><%=name %></td>
		<td><%=kor %></td>
		<td><%=eng %></td>
		<td><%=mat %></td>
	</tr>
	<%
		}
	%>
</table>
</body>
</html>