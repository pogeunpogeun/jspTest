<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String menuGubun = request.getParameter("menuGubun");
	//out.println("menuGubun : " + menuGubun);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="80%" align="center">
   <tr>
      <td height="100px" align="center">
      <!-- 상단 메뉴 시작 -->
      <jsp:include page="../include/inc_menu.jsp" flush="true"></jsp:include>   
      <!-- 상단 메뉴 종료 -->
      </td>
   </tr>
   <tr>
      <td height="300px" align="center">
      
      <%
      //member_list
      	String movePage = "../" + menuGubun.replace("_","/") + ".jsp";      
      %>
     	<jsp:include page="<%=movePage %>" flush="true"></jsp:include>

      </td>
   </tr>
   <tr>
      <td height="100px" align="center">
         <jsp:include page="../include/inc_bottom.jsp" flush="true"></jsp:include>
      </td>
   </tr>
</table>
</body>
</html>