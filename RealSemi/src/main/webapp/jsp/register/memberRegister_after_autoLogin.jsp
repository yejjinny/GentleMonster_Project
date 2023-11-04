<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String ctxPath = request.getContextPath();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
    window.onload = function(){
    	
    	alert("회원가입에 감사드립니다!!");
    	
    	const frm = document.loginFrm;
    	frm.action = "<%= ctxPath%>/register/login.gm";
    	frm.method = "post";
    	frm.submit();
    	
    }// end of window.onload = function(){}---------------

</script>

</head>
<body>
    <form name="loginFrm">
       <input type="hidden" name="email" value="${requestScope.email}" /> 
       <input type="hidden" name="pwd" value="${requestScope.pwd}" />
    </form>
</body>
</html>