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

<h2>학생정보수정</h2>
<form name="sujungForm">
<input type="hidden" name="hakbun" value="<%=resultDto.getHakbun() %>">
<table border="1" width="70%">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" id="name" value="<%=resultDto.getName()%>"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone" id="phone" value="<%=resultDto.getPhone()%>"></td>
	</tr>
	<tr>
		<td>부모연락처</td>
		<td><input type="text" name="parentPhone" id="parentPhone" value="<%=resultDto.getParentPhone()%>"></td>
	</tr>
	<td rowspan="3">주소</td>
			<td>
				<input type="text" name="addr1" id="sample6_postcode" value="<%=resultDto.getAddr1()%>">
				<button type="button" onClick="sample6_execDaumPostcode();">우편번호 찾기</button>
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="addr2" id="sample6_address" value="<%=resultDto.getAddr2()%>">
			</td>
		</tr>
		<tr>
			<td>
				<input type="text" name="addr3" id="sample6_detailAddress" value="<%=resultDto.getAddr3()%>">
				<input type="text" name="addr4" id="sample6_extraAddress" value="<%=resultDto.getAddr4()%>">
			</td>
		</tr>
	<tr>
		<td colspan="2" align="center">
		<button type="button" onClick="sujung();">수정하기</button>
		</td>
	</tr>
</table>
</form>
<script>
	function sujung() {
		if (confirm('수정하시겠습니까?')) {
			document.sujungForm.action="sujungProc.jsp";
			document.sujungForm.method="post";
			document.sujungForm.submit();
	}
}
</script>
<%@ include file= "_inc_addressAPI.jsp"%>	