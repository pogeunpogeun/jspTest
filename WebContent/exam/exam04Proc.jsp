<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	String mobile = request.getParameter("mobile");
	String email = request.getParameter("email");
	String idNum = request.getParameter("idNum");
	String add = request.getParameter("add");
	String gender = request.getParameter("gender");

%>
<%-- <a href="exam04Result.jsp?id=<%=id%>&name=<%=name%>">완료페이지로이동</a> --%>


<form name = "imsiForm">
<input text="text" name="id" value="<%=id %>">
<input text="text" name="name" value="<%=name %>">
</form>

<script>
function move() {
	location.href = "exam04Result.jsp?id=<%=id%>&name=<%=name%>";
}
function submitForm() {
	document.infoForm.action="exam04Result.jsp";
	document.infoForm.method = "post";
	document.infoForm.submit();
}
//move();
submitForm();
</script>
