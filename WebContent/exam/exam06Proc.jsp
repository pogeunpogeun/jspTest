<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String[] array = new String[2];

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");
	String idNum = request.getParameter("idNum");
	String add = request.getParameter("add");
	
	String person1 = "";
	person1 += id + "/";
	person1 += pw + "/";
	person1 += name + "/";
	person1 += nickname + "/";
	person1 += mobile + "/";
	person1 += email + "/";
	person1 += idNum + "/";
	person1 += add;
	
	String id2 = request.getParameter("id2");
	String pw2 = request.getParameter("pw2");
	String name2 = request.getParameter("name2");
	String nickname2 = request.getParameter("nickname2");
	String mobile2 = request.getParameter("mobile2");
	String email2 = request.getParameter("email2");
	String idNum2 = request.getParameter("idNum2");
	String add2 = request.getParameter("add2");
	
	String person2 = "";
	person2 += id2 + "/";
	person2 += pw2 + "/";
	person2 += name2 + "/";
	person2 += nickname2 + "/";
	person2 += mobile2 + "/";
	person2 += email2 + "/";
	person2 += idNum2 + "/";
	person2 += add2;
	
	String person3 = person1 + "|" + person2;
	
	array[0] = person1;
	array[1] = person2;
%>

<%=person1 %>
<hr>
<%=person2 %>
<hr>
<%=person3 %>
<hr>
<%=array.length %> / <%=array[0] %> / <%=array[1] %>

