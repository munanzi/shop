<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
    <%@include file="common/lib.jsp" %>


    <script>
    </script>

</head>
<body>

<form name="UserLoginForm" action="logon.htm" method="post">
    username:<input id="userName" name="userName" value="hexizheng"/>
    <br/>
    password:<input id="password" name="password" value="${password}"/>
    <br/>
    ${error}
    <br/>
    <input type="submit" name="登陆" />
</form>

</body>
</html>