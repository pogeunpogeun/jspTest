<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	HaksaMemberDTO resultDto = dao.getSelectOne(arguDto);
%>
<h2>학생정보삭제</h2>
<form name="sakjeForm">
<input type="text" name="hakbun" value="<%=resultDto.getHakbun() %>">
<table border="1" width="70%">
	<tr>
		<td>이름</td>
		<td><%=resultDto.getName()%></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><%=resultDto.getPhone()%></td>
	</tr>
	<tr>
		<td>부모연락처</td>
		<td><%=resultDto.getParentPhone()%></td>
	</tr>
	<tr>
	<td rowspan="3">주소</td>
			<td>
				<%=resultDto.getAddr1()%>
				<%=resultDto.getAddr2()%>
				<%=resultDto.getAddr3()%>
				<%=resultDto.getAddr4()%>
			</td>
		</tr>
	<tr>
		<td colspan="2" align="center">
		<button type="button" onClick="sakje();">삭제하기</button>
		</td>
	</tr>
</table>
</form>
<script>
	function sakje() {
		if (confirm('삭제하시겠습니까?')) {
			document.sakjeForm.action="sakjeProc.jsp";
			document.sakjeForm.method="post";
			document.sakjeForm.submit();
	}
}
</script>
