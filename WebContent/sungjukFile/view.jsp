<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_fileInfo.jsp" %> <!-- 변수 공유를 위해 JSP액션태그 대신 Include 사용 -->
<%
	String name = request.getParameter("name");
	String info = "";
	try {
		// java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String imsi = sReader.nextLine(); // 한 줄 전체를 imsi에 담음
			String[] imsiArray = imsi.split(",");
			if(name.equals(imsiArray[0])) {
				info = imsi; 
				break;
			}
		}
		sReader.close();
	} catch (Exception e) {
		//e.printStackTrace();
	}
	String[] tempArray = info.split(",");
	//String name = tempArray[0];
	String kor_ = tempArray[1];
	String eng_ = tempArray[2];
	String mat_ = tempArray[3];
	String sci_ = tempArray[4];
	String his_ = tempArray[5];
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>성적관리(상세보기)</h2>
<table border="1">
	<tr>
		<td>이름</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>국어</td>
		<td><%=kor_ %></td>
	</tr>
	<tr>
		<td>영어</td>
		<td><%=eng_ %></td>
	</tr>
	<tr>
		<td>수학</td>
		<td><%=mat_ %></td>
	</tr>
	<tr>
		<td>과학</td>
		<td><%=sci_ %></td>
	</tr>
	<tr>
		<td>역사</td>
		<td><%=his_ %></td>
	</tr>
	<tr>
		<td height="30px" colspan="7" align="right">
			<a href="#" onClick="move('list','')">목록</a>
			|
			<a href="#" onClick="move('chuga','')">등록</a>
			|
			<a href="#" onClick="move('sujung','<%=name%>')">수정</a>
			|
			<a href="#" onClick="move('sakje','<%=name%>')">삭제</a>
		</td>
	</tr>
</table>
<script>
	function move(value1, value2) {
		location.href = value1 + ".jsp?name=" + value2;
	}

</script>
</body>
</html>