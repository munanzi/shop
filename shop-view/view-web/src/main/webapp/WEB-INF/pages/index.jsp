<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />


    <script>
    </script>

</head>
<body>



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
    <tr>
        <c:if test="${productList != null }">
            <c:forEach var="product" begin="0" end="3" items="${productList}">
                <c:if test="${product != null }">

                    <td>
                        <a href="${ctx}/product/detail.htm?productId=${product['productId']}" >${product['productName']}</a>

                            ${product['defaultPrice']}


                        <img width="400" height="280" alt="商品图片" title="商品图片" src="${staticPath}/${product.picUrl}">
                    </td>


                </c:if>
            </c:forEach>

        </c:if>
    </tr>
    <tr>
        <c:if test="${productList != null }">
            <c:forEach var="product" begin="3" end="6" items="${productList}">
                <c:if test="${product != null }">

                    <td>
                        <img width="400" height="280" alt="商品图片" title="商品图片" src="${staticPath}/${product.picUrl}">
                        <a href="${ctx}/product/detail.htm?productId=${product['productId']}" >${product['productName']}</a>

                        ${product['defaultPrice']}


                    </td>


                </c:if>
            </c:forEach>

        </c:if>
    </tr>
</table>


</body>
</html>

