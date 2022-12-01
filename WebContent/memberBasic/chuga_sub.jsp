<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>회원등록</h2>
	<form name="chugaForm">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="pwChk"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" name="jumin1" style="width: 60px;">
					-
					<input type="password" name="jumin2" style="width: 60px;">
				</td>
			</tr>				
			<tr>
				<td rowspan="3">주소</td>
				<td>
					<input type="text" name="juso1" id="sample6_postcode" placeholder="우편번호">
					<button type="button" onClick="sample6_execDaumPostcode();">우편번호 찾기</button>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="juso2" id="sample6_address" placeholder="주소">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="juso3" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" name="juso4" id="sample6_extraAddress" placeholder="참고항목">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<button type="button" onClick="chuga();">가입하기</button>
				</td>
			</tr>		
		</table>
	</form>
<%@ include file= "_inc_addressAPI.jsp"%>		