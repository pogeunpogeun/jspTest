<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");


	String id=request.getParameter("id");
	if(id==null || id.trim().equals("")){
		
		out.print("<script>");
		out.print("alert('오류 발생')");
		out.print("location.href='list.jsp';");
		out.print("</script>");
		return;
	}
	String attachPath = "C:/HHJ/attach";
	String uploadPath = attachPath + "/testFile"+request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	

	String name="";
	String phone="";
	String email="";
	String address="";
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			String[] array=data.split("[|]");
			
			if(id.equals(array[0])){
				name=array[2];
				phone=array[3];
				email=array[4];
				address=array[5];
			}
		}
		
		sReader.close();
		//System.out.println();
	} catch(Exception e) {
		//e.printStackTrace();
		//System.out.println();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원상세보기</h2>
	<table border="1" >
		<tr>
			<td>아이디</td>
			<td><%=id%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=phone%></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=email%></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=address%></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<div style="magin-top:30px">
					<a href="#" onClick="move('list.jsp')">목록 | </a>
					<a href="#" onClick="move('chuga.jsp')">추가 | </a>
					<a href="#" onClick="moving('<%=id%>','sujeng.jsp')">수정 | </a>
					<a href="#" onClick="moving('<%=id%>','sakje.jsp')">삭제</a>
				</div>
			</td>
		</tr>
	</table>
<form name="f1">
<input type="hidden" name="id">
</form>
</body>

</html>
<script>
 	function move(value1){
 		location.href = value1;
 	}
 	function moving(value1,value2){
 		f1.id.value=value1;
 		f1.action=value2;
 		f1.method="post"
 		f1.submit();
 	}
</script>
