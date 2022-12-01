<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test01.jsp</title>
</head>
<body>

<% 
String name = "홍길동";
int age = 10;
String gender = "여자";
%>
당신의 이름은 <% out.println(name); %>입니다.<br>
당신의 나이는 <% out.print(age); %>입니다.<br>
당신의 성별은 <% out.print(gender); %> 입니다.

</body>
</html>

