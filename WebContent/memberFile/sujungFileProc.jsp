<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_fileInfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	String content = id + "/" + name + "/" + phone + "/" + email + "/" + address;
	
	String newValue = "";
	try {
		// java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String imsi = sReader.nextLine(); // 한 줄 전체를 imsi에 담음
			String[] imsiArray = imsi.split("/");
			if(name.equals(imsiArray[1])) {
				newValue += content;			
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
		out.println("location.href='viewFile.jsp?name=" + name + "';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.');");
		out.println("location.href='chugaFile.jsp';");
		out.println("</script>");
	}
	

%>