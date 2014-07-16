<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../common/head.jsp" %>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
    <%@include file="../common/lib.jsp" %>


    <script>
        function buy(){

        }

        function addCart(){

        }
    </script>

</head>
<body>
<input type="hidden" id="goodsId" name="goodsId" >
      <div style="text-align:center; margin-left:auto; margin-right:auto">
${fullProduct.product.productTitle}
<br/>
<br/>

              价格： ${fullProduct.product.minPrice} - ${fullProduct.product.maxPrice}
    <br/>
              销量：  ${fullProduct.product.sales}
    <c:if test="${fullProduct.product.sales != fullProduct.goods.sales }">
                ,此款销量：${fullProduct.goods.sales}
    </c:if>
    <br/>
              库存 ：  ${fullProduct.goods.stock}
    <br/>
              累计评价：   ${fullProduct.product.commentTimes}
    <br/>
              商品评分     ${fullProduct.product.score}
<br/>
<br/>
<br/>

<table border="1" style="text-align:center; margin-left:auto; margin-right:auto">
    规格属性：<br/>
    <c:if test="${fullProduct.specAttrList != null }">
        <c:forEach var="attr" begin="0" end="20" items="${fullProduct.specAttrList}">
            <c:if test="${attr != null }">
                <tr>
                    <td>  ${attr.attrName} :
                        <c:forEach var="attrValue" begin="0" end="20" items="${attr.attrValues}">
                                    <a href="#" id="${attr.id}" onclick="selectAttr(this,${attrValue})" > ${attrValue}</a>
                        </c:forEach>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </c:if>

</table>
<br/>
    <input type="button" id="buy" onclick="buy"/>
    <input type="button" id="addCart" onclick="addCart"/>
<br/>
<br/>
<table  border="1" style="text-align:center; margin-left:auto; margin-right:auto">
    产品介绍：
    <c:if test="${fullProduct.usualAttrList!= null }">
        <c:forEach var="productAttr" begin="0" end="20" items="${fullProduct.usualAttrList}">
            <c:if test="${productAttr != null }">
                <tr>
                    <td>
                            ${productAttr.attrName} : ${productAttr.attrValue}
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </c:if>

</table>
<br/>
<br/>
<br/>
<table  border="1" style="text-align:center; margin-left:auto; margin-right:auto">
    参数列表：
    <c:if test="${fullProduct.groupAttrsMap!= null }">
        <c:forEach var="map" begin="0" end="20" items="${fullProduct.groupAttrsMap}">
            <c:if test="${map != null }">
                <tr >
                    <td colspan="2"  style="background:#808080">
                            ${map.key}
                    </td>
                </tr>
                <c:forEach var="productAttr" begin="0" end="20" items="${map.value}">
                    <tr>
                        <td> ${productAttr.attrName}</td> <td>${productAttr.attrValue}</td>
                    </tr>
                </c:forEach>
            </c:if>
        </c:forEach>
    </c:if>

</table>

</div>
</body>
</html>