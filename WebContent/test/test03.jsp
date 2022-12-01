<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String name = "홍길동";
int kor = 90;
int eng = 80;
int mat = 70;
int tot = kor + eng + mat;
int avg = tot / 3;

String grade = "가";
if (avg >= 90) {
	grade = "수";
} else if (avg >= 80) {
	grade = "우";
} else if (avg >= 70) {
	grade = "미";
} else if (avg >= 60) {
	grade = "양";
}

String gradeDisplayText01 = "<font style='color: red; font-weight: bold;'>";
String gradeDisplayText02 = "</font>";
if (grade.equals("수") || grade.equals("우")) {
	gradeDisplayText01 = "<font style = 'color: red; font-weight: bold;'>";
}

String gradeDisplayText = gradeDisplayText01 + "(' + grade +')" + gradeDisplayText02;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h2>test03.jsp</h2>

	<table border="1" align="center">
		<tr>
			<td width="100px">이름</td>
			<td width="300px"><font style="color: blue; font-weight: bold;"><%=name%></td>
		</tr>

		<%
		if (kor > 60) {
		%>
		<tr>
			<td>국어</td>
			<td><%=kor%></td>
		</tr>
		<%
		}
		%>

		<tr>
			<td>영어</td>
			<td><%=eng%></td>
		</tr>

		<tr>
			<td>수학</td>
			<td><%=mat%></td>
		</tr>

		<tr>
			<td>총합</td>
			<td><%=tot%></td>
		</tr>

		<tr>
			<td>평균</td>
			<td>
			<%=avg%>
			&nbsp;
			<% if(grade.equals("수") || grade.equals("우")) { %>
			(<font style="color: red; font-weight: bold;"><%=grade %></font>)
			<% } else { %>
			(<%=grade %>)
			<% } %>
			&nbsp; / &nbsp;
			<%=gradeDisplayText01 %>(<%=grade %>)<%=gradeDisplayText02 %>
			&nbsp; / &nbsp;
			<%=gradeDisplayText %>
			</td>
		</tr>
		<tr>
<%-- 			<td>등급</td>
			<td>
				<%
				if (grade.equals("수") || grade.equals("우")) {
				%> avg >= 80
				<font style="color: red; font-weight: bold;"><%=grade%></font> <%
				 } else {
				 %>
				 <%=grade%> <%
				 }
				 %>
			</td>
		</tr>
 --%>
	</table>
</body>
</html>