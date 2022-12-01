<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String imsiInfo01 = "홍길동/90/80/70";
	String imsiInfo02 = "이성순/99/88/77";
	String imsiInfo03 = "장천용/100/100/100";	
	
	String[] array = new String[3];
	array[0] = imsiInfo01;
	array[1] = imsiInfo02;
	array[2] = imsiInfo03;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test07.jsp</title>
</head>
<body>
<h2>test07.jsp</h2>
<table border = "1">
<tr>
	<td>이름</td>
	<td>국어</td>
	<td>영어</td>
	<td>수학</td>
</tr>
<%

	int sumKor = 0;
	int sumEng = 0;
	int sumMat = 0;

	for(int i = 0; i<array.length; i++) {
		String[] array1 = array[i].split("/");
		String name = array1[0];
		String kor = array1[1];
		String eng = array1[2];
		String mat = array1[3];	
		
		sumKor += Integer.parseInt(kor);
		sumEng += Integer.parseInt(eng);
		sumMat += Integer.parseInt(mat);
		
%>
	<tr>
		<td><%=name %></td>
		<td><%=kor %></td>
		<td><%=eng %></td>
		<td><%=mat %></td>
	</tr>
	<%
	}
	
		double avgKor = sumKor / 3.0;
		double avgEng = sumEng / 3.0;
		double avgMat = sumMat / 3.0;
	%>
	<tr>
		<td>&nbsp;</td>
		<td><%=avgKor + "/" + sumKor %></td>
		<td><%=avgEng + "/" + sumEng %></td>
		<td><%=avgMat + "/" + sumMat %></td>
	</tr>
	
</table>
</body>
</html>