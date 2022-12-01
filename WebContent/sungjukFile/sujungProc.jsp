<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_fileInfo.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String kor_ = request.getParameter("kor");
	String eng_ = request.getParameter("eng");
	String mat_ = request.getParameter("mat");
	String sci_ = request.getParameter("sci");
	String his_ = request.getParameter("his");
	
	String msg = name + "," + kor_ + "," + eng_ + "," + mat_ + "," + sci_ + "," + his_;
	
	String newValue = "";
	try {
		// java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String imsi = sReader.nextLine(); // 한 줄 전체를 imsi에 담음
			String[] imsiArray = imsi.split(",");
			if(name.equals(imsiArray[0])) {
				newValue += msg;			
			} else {
				newValue += imsi;
			}
			newValue += "\n";
		}
		sReader.close();
	} catch (Exception e) {
		//e.printStackTrace();
	}
	
	int result = 0;
	try {
		FileWriter fw = new FileWriter(uploadFile);
		fw.write(newValue);
		fw.close();
		result++;
	} catch (Exception e) {
		//e.printStackTrace();
		result = 0;
	}
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상적으로 수정되었습니다.');");
		out.println("location.href='view.jsp?name=" + name + "';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.');");
		out.println("location.href='chuga.jsp';");
		out.println("</script>");
	}
	

%>
