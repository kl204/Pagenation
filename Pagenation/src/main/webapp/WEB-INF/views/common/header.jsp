<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.page.gyu.vo.MemberVO"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>	
  <meta charset="UTF-8">
<title>Header</title>

</head>
<body>



<table border=0  width="100%">
  <tr>
     <td>
		<a href="${contextPath}/">
			<img src="${contextPath}/resources/image/duke_swing.gif" />
		</a>
     </td>
     <td>
       <h1><font size=30>스프링실습 홈페이지!!</font></h1>
	 </td>
     <td>
     <% MemberVO member = (MemberVO)session.getAttribute("login");

		String memberId ="";
		boolean admin = false;
		boolean flag = false;
		
		if(member !=null){
			flag = true;
			memberId = member.getUserId();
			admin = memberId.equals("2");
		}
		
		%>

          <%if(flag){ 
          	 if(admin){%>
            <h3>환영합니다. <%= memberId %>님!</h3>
            <a href="${contextPath}/visitor/logout.do?flag=true"><h3>로그아웃</h3></a>
			<% } else if(!admin) { %>
				<h3>환영합니다. <%= memberId %>님!</h3>
            	<a href="${contextPath}/visitor/logout.do?flag=true"><h3>로그아웃</h3></a>
				<%} %>
	        <% } else {%>
	        <a href="${contextPath}/visitor/viewLogin.do"><h3>로그인</h3></a>
	        
     		<% } %>
     </td>
       
  </tr>
</table>


</body>
</html>