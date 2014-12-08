<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
    <%--<%@include file="common/lib.jsp" %>--%>


    <script>
    </script>

</head>
<body>

<form name="UserLoginForm" action="${ctx }/logon.htm" method="post">
    用户名:<input id="userName" name="userName" value="hexizheng"/>
    <br/>
    密码:<input id="password" name="password" value="${password}"/>
    <br/>
    ${error}
    <br/>
    <input type="submit" name="登陆" />
</form>

<br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>


<br/><br/><br/>   <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

</body>
</html>