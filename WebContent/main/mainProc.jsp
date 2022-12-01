<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String includePage = "";
	String menuGubun = request.getParameter("menuGubun");
	
	String tmpPage = "";
	tmpPage = menuGubun.replace("_","/");
	tmpPage = tmpPage + ".jsp";
	tmpPage = "../" + tmpPage;
	
	includePage = tmpPage;

%>
<jsp:include page="<%=includePage %>" flush="true"></jsp:include>

	

