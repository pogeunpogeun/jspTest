<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.ArrayList" %>
    
<%
/* 	ArrayList<String> list = new ArrayList<>();	
	String imsi = "";
	
	String name1 = "홍길동";
	int kor1 = 90;
	int eng1 = 80;
	int mat1 = 70;
	
	imsi = name1 + "|" + kor1 + "|" + eng1 + "|" + mat1;
	list.add(imsi);

	String name2 = "이성순";
	int kor2 = 99;
	int eng2 = 88;
	int mat2 = 77;
	
	imsi = name2 + "|" + kor2 + "|" + eng2 + "|" + mat2;
	list.add(imsi);
	
	String name3 = "장천용";
	int kor3 = 100;
	int eng3 = 100;
	int mat3 = 100;
	
	imsi = name3 + "|" + kor3 + "|" + eng3 + "|" + mat3;
	list.add(imsi); */
	
	ArrayList<String> list = new ArrayList<>();	
	
	for(int i=1; i<=3; i++) {
		String name;
		int kor;
		int eng;
		int mat;
		String imsi;
		
		if(i == 1) {
			name = "홍길동";
			kor = 90;
			eng = 80;
			mat = 70;
		} else if (i == 2) {
			name = "이성순";
			kor = 99;
			eng = 88;
			mat = 77;
		} else {
			name = "장천용";
			kor = 100;
			eng = 100;
			mat = 100;
		}
		imsi =  name + "|" + kor + "|" + eng + "|" + mat;
		list.add(imsi);
		
	}
	out.println(list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test08.jsp</title>
</head>
<body>

<h2>test08.jsp</h2>
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

	for(int i = 0; i<list.size(); i++) {
		String[] array1 = list.get(i).split("[|]");
		String name = array1[0];
		String kor = array1[1];
		String eng = array1[2];
		String mat = array1[3];	
		
		sumKor += Integer.parseInt(kor);
		sumEng += Integer.parseInt(eng);
		sumMat += Integer.parseInt(mat);
	%>
	<%
	}
	%>
</table>

</body>
</html>