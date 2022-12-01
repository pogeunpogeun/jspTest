<%@page import="haksaSungjuk.model.dao.HaksaSungjukDAO"%>
<%@page import="haksaSungjuk.model.dto.HaksaSungjukDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sungjukNo_ = request.getParameter("sungjukNo");
	String kor_ = request.getParameter("kor");
	String eng_ = request.getParameter("eng");
	String mat_ = request.getParameter("mat");
	String sci_ = request.getParameter("sci");
	String his_ = request.getParameter("his");

	int sungjukNo = Integer.parseInt(sungjukNo_);
	int kor = Integer.parseInt(kor_);
	int eng = Integer.parseInt(eng_);
	int mat = Integer.parseInt(mat_);
	int sci = Integer.parseInt(sci_);
	int his = Integer.parseInt(his_);
	
	int tot = kor + eng + mat + sci + his;
	int avg = tot / 5;
	
	String grade = "가";
	if(avg >= 90) {
		grade = "수";
	} else if (avg >= 80) {
		grade = "우";
	} else if (avg >= 70) {
		grade = "미";
	} else if (avg >= 60) {
		grade = "양";
	}
	
	HaksaSungjukDTO arguDto = new HaksaSungjukDTO();
	arguDto.setSungjukNo(sungjukNo);
	arguDto.setKor(kor);
	arguDto.setEng(eng);
	arguDto.setMat(mat);
	arguDto.setSci(sci);
	arguDto.setHis(his);
	arguDto.setTot(tot);
	arguDto.setAvg(avg);
	arguDto.setGrade(grade);
		
	HaksaSungjukDAO dao = new HaksaSungjukDAO();
	int result = dao.setUpdate(arguDto);

	if (result > 0) {
	      out.println("<script>");
	      out.println("alert('정상적으로 수정되었습니다.');");
	      out.println("location.href='view.jsp?sungjukNo=" + sungjukNo + "';");
	      out.println("</script>");
	   } else {
	      out.println("<script>");
	      out.println("alert('정상적으로 수정되지않았습니다.');");
	      out.println("location.href='sujung.jsp?sungjukNo=" + sungjukNo + "';");
	      out.println("</script>");
	   }
	
%>