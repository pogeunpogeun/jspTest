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
	String attachPath = "C:/JIJ/attach";
	String uploadPath = attachPath + "/testFile"+request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	

	String name="";
	String pw="";
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
				pw=array[1];
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
<h2>회원수정</h2>
<form name="f2">
	<table border="1" >
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="<%=id%>" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone" value="<%=phone%>"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" value="<%=email%>"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address" value="<%=address%>"></td>
		</tr>
		<tr>
            <td colspan="2" align="center">
            	<button type="button" onClick="sujung();">수정하기</button>
            </td>
         </tr>
	</table>
		<div style="magin-top:30px">
			<a href="#" onClick="move('list.jsp')">목록 | </a>
			<a href="#" onClick="move('chuga.jsp')">추가 | </a>
			<a href="#" onClick="moving('view.jsp')">상세보기 | </a>
			<a href="#" onClick="moving('sakje.jsp')">삭제</a>
		</div>
</form>
</body>

</html>
<script>
	function sujung() {
		if(f2.pw.value==<%=pw%>){
	    f2.action="sujengProc.jsp";
	    f2.method="post";
	    f2.submit();
		}else{
 			alert("비밀번호 틀림");
 			location.href="sujeng.jsp?id=<%=id%>"
 		}
	}
 	function move(value1){
 		location.href = value1;
 	}
 	function moving(value1){
 		f2.action=value1;
 		f2.method="post"
 		f2.submit();	
 	}
</script>