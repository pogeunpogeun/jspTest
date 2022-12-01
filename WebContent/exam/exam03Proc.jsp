<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    request.setCharacterEncoding("UTF-8");
    
    String name = request.getParameter("name");
    String idNum = request.getParameter("idNum");
    String contact = request.getParameter("contacts");
    String email = request.getParameter("name");
    
    String imsi1_ = idNum.substring(0,2);
    int imsi1 = Integer.parseInt(imsi1_);
    String imsi2 = idNum.substring(7,8);
    
    String gender = "여자";
    if(imsi2.equals("1") || imsi2.equals("3")) {
    	gender = "남자";
    }
    
    int age = 0;
    if(imsi2.equals("1") || imsi2.equals("2")) {
    	age = 2022 - (1900 + imsi1);
    } else {
    	age = 2022 - (2000 + imsi1);
    }
    	
    %>
</table>
    당신의 이름은 <%=name %>입니다. <br>
    당신의 주민번호는 <%=idNum %>입니다. <br>
    당신의 연락처는 <%=contact %>입니다. <br>
    당신의 이메일은 <%=email %>입니다. <br>
    당신의 성별은 <%=gender %>입니다. <br>
    당신의 나이는 <%=age %>세 입니다.


    