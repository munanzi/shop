<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    </head>
<body>

<c:if test="empty ${exception.message }">
    <p>操作失败</p>
</c:if>
<c:if test="${exception.message!=''}">
    <p>${exception.message }</p>
</c:if>

error jsp
</body>
</html>