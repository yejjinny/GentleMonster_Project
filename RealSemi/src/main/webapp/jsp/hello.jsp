<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
    <h1>로그인</h1>
    <a href="javascript:kakaoLogin()"><img src="<%= ctxPath %>/image/kakao_login.png" style="width: 200px"></a>
    <button>네이버 로그인</button>
</div>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">
    Kakao.init('d28d0cfccd906b0d9711e0ca120e7b52');
    function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                    	console.log(response);
                    	console.log(response.kakao_account['email']);
                    	console.log(response.kakao_account['profile']['nickname']);
                        alert(response.id)
                    },
                    fail: function (error) {
                        alert(JSON.stringify(error))
                    },
                })
            },
            fail: function (error) {
                alert(JSON.stringify(error))
            },
        })
    }
</script>
</body>
</html>