<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_fileInfo.jsp" %>


<%	
	ArrayList<String> list = new ArrayList<>();
	try {
		//java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while (sReader.hasNextLine()) {
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
<title>회원목록</title>
</head>
<body>

<table border="1" width="80%" align="center">
   <tr>
      <td height="100px" align="center">
      <!-- 상단 메뉴 시작 -->
      <%@include file = "../include/inc_menu.jsp" %>   
      <!-- 상단 메뉴 종료 -->
      </td>
   </tr>
   <tr>
      <td height="300px" align="center">
      <!-- 본문 내용 시작 -->
         <h2>회원목록</h2>
         <table border="1" align="center">
            <tr>
               <th>순번</th>
               <th>아이디</th>
               <th>이름</th>
               <th>전화번호</th>
               <th>이메일</th>
               <th>주소</th>
            </tr>
            <% 
            	int totalCounter = 1;
            	for (int i=0; i<list.size(); i++) { 
            	String[] imsiArray = list.get(i).split("/");
            	String id = imsiArray[0];
            	String name = imsiArray[1];
            	String phone = imsiArray[2];
            	String email = imsiArray[3];
            	String address = imsiArray[4];
            	
            %>           
            	<tr>
	               <td><%=totalCounter %></td>
	               <td><%=imsiArray[0] %></td>
	               <td><a href="#" onClick = "move('viewFile','<%=imsiArray[1]%>');"><%=imsiArray[1] %></a></td>
	               <td><%=imsiArray[2] %></td>
	               <td><%=imsiArray[3] %></td>
	               <td><%=imsiArray[4] %></td>
           		</tr>
            <% 
            	totalCounter++;
            	} 
            %>

         </table>

         <div style="borer : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
            |
            <a href="#" onClick="move('listFile','');">목록</a>
            |
            <a href="#" onClick="move('chugaFile','');">등록</a>
            |
         </div>
         <!-- 본문 내용 종료 -->
      </td>
   </tr>
   <tr>
      <td height="100px" align="center">
         <%@ include file = "../include/inc_bottom.jsp" %>
      </td>
   </tr>
</table>

<script>
function move(value1,value2) {
   location.href = value1 + ".jsp?name=" + value2;
}
</script>
</body>
</html>