<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="staticPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%--<link rel="stylesheet" type="text/css" href="${ctx }/common/css/import.css">--%>
    <link rel="stylesheet" type="text/css" href="${ctx }/common/css/base.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/common/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/common/css/manage.css" />
    <link rel="stylesheet" type="text/css" href="${ctx }/common/css/new_table.css" />
    <script type="text/javascript" src="${ctx }/common/libs/jquery1.11.1.js"></script>
<decorator:head />
</head>

<body>


<%@include file="./head.jsp" %>


	<decorator:body />

<%@include file="./tail.jsp" %>
</body>

</html>
