<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_fileInfo.jsp" %>

<%
	ArrayList<String> list = new ArrayList<>();
	try {
		// java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String imsi = sReader.nextLine();
			list.add(imsi);
		}
		sReader.close();
	} catch (Exception e) {
		//e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>성적관리(목록)</h2>
<table border="1">
	<tr>
		<th>순번</th>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>과학</th>
		<th>역사</th>
	</tr>

	<% 	
		int imsiNo = 1;
		for(int i=0; i<list.size(); i++) { 	
			String[] imsiArray = list.get(i).split(",");
			String name = imsiArray[0];
			String kor_ = imsiArray[1];
			String eng_ = imsiArray[2];
			String mat_ = imsiArray[3];
			String sci_ = imsiArray[4];
			String his_ = imsiArray[5];
	%>
	<tr>
		<td><%=imsiNo %></td>
		<td><a href="#" onClick="move('view','<%=name %>');"><%=name %></td>
		<td><%=kor_ %></td>
		<td><%=eng_ %></td>
		<td><%=mat_ %></td>
		<td><%=sci_ %></td>
		<td><%=his_ %></td>	
	<% 
			imsiNo++; // 2
		} 
	%>
	<tr>
		<td height="30px" colspan="7" align="right">
			<a href="#" onClick="move('list','')">목록</a>
			|
			<a href="#" onClick="move('chuga','')">등록</a>
		</td>
	</tr>
</table>
<script>
	function move(value1, value2) {
		location.href = value1 + '.jsp?name=' + value2;
	}
</script>

</body>
</html>