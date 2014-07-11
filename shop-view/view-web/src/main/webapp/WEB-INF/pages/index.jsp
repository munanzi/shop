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


hello ${userName}


<table>

    <c:if test="${catList != null }">
        <c:forEach var="category" begin="0" end="20" items="${catList}">
            <c:if test="${category != null }">
                <tr>
                    <td>
                        <a href="${ctx}/category/index.htm?catId=${category['catId']}" >${category['name']}</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </c:if>

</table>

<table>

    <c:if test="${productList != null }">
        <c:forEach var="product" begin="0" end="20" items="${productList}">
            <c:if test="${product != null }">
                <tr>
                    <td>
                        <a href="${ctx}/product/detail.htm?productId=${product['productId']}" >${product['productName']}</a>

                        ${product['minPrice']} -    ${product['maxPrice']}


                        <img width="400" height="280" alt="商品图片" title="商品图片" src="${ctx}/${product.picUrl}">
                    </td>

                </tr>
            </c:if>
        </c:forEach>
    </c:if>

</table>


</body>
</html>

