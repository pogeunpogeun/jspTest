<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject" %>

<%
	request.setCharacterEncoding("UTF-8");

	String dbId = "hong";
	String dbPw = "1234";
	
	String name = request.getParameter("name");
	String kor_ = request.getParameter("kor");
	String eng_ = request.getParameter("eng");
	String mat_ = request.getParameter("mat");
	String sci_ = request.getParameter("sci");
	String his_ = request.getParameter("his");
	
	int kor = Integer.parseInt(kor_);
	int eng = Integer.parseInt(eng_);
	int mat = Integer.parseInt(mat_);
	int sci = Integer.parseInt(sci_);
	int his = Integer.parseInt(his_);
	
	int tot = kor + eng + mat + sci + his;
	double avg = tot / 5.0;
	
	String grade = "가";
	if (avg >= 90) {
		grade = "수";
	} else if (avg >= 80) {
		grade = "우";
	} else if (avg >= 70) {
		grade = "미";
	} else if (avg >= 60) {
		grade = "양";
	}
	
	JSONObject jsonObj = new JSONObject();
	jsonObj.put("name",name);
	jsonObj.put("kor",kor);
	jsonObj.put("eng",eng);
	jsonObj.put("mat",mat);
	jsonObj.put("sci",sci);
	jsonObj.put("his",his);
	jsonObj.put("tot",tot);
	jsonObj.put("avg",avg);
	jsonObj.put("grade",grade);
	
	out.println(jsonObj);
%>
