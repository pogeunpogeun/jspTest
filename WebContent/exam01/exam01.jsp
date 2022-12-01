<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int oddSum = 0;
	int evenSum = 0;
	
	for(int i=1; i<=100; i++) {
		if(i%2 == 0) {
			evenSum += i;
		} else {
			oddSum += i;
		}
		
	} 
	
	out.println("1부터 100까지 홀수의 합은 " + oddSum + " 입니다." + "<br>" );
	out.println("1부터 100까지 짝수의 합은 " + evenSum + " 입니다." );
	
%>