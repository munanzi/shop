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
        function buy(){
            $("#num").val($("#buyNum").val());
            document.orderForm.submit();
        }

        function addCart(){
            var goodsId=$("#goodsId").val();
            var num = $("#buyNum").val();
            $.post("${ctx }/cart/add", {goodsId:goodsId,num:num},function(data) {
                if(data.success=="true"){
                    alert("加入购物成功");
                }else{
                    alert("加入购物失败");
                }
            });
        }
    </script>

</head>
<body>
<form name="orderForm" action="${ctx}/order/confirmOrder.htm" method="post">
<input type="hidden" id="goodsId" name="goodsId" value="${fullProduct.product.productId}" >
<input type="hidden" id="num" name="num" >
</form>
      <div style="text-align:center; margin-left:auto; margin-right:auto">
${fullProduct.product.productTitle}
<br/>
<br/>

              价格： ${fullProduct.product.defaultPrice}
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
                        <c:forEach var="attrValue" begin="0" end="20" items="${attr.attrValue}">
                                    <a href="#" id="${attr.id}" onclick="selectAttr(this,${attrValue})" > ${attrValue}</a>
                        </c:forEach>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </c:if>

</table>
    购买数量：<input type="text" id="buyNum" value="1"/>
<br/>
    <input type="button" id="buy" value="立即购买" onclick="buy();"/>
    <input type="button" id="addCart" value="加入购物车" onclick="addCart();"/>
<br/>
    <form name="buyForm" action="order/buy.htm">
       <input type="hidden" name="goodsId" value="${fullProduct.product.defaultGoodsId}">
    </form>
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

    <br/>
    <br/>
    <br/>
<table  border="1" style="text-align:center; margin-left:auto; margin-right:auto">
包装列表
<c:if test="${fullProduct.packingList != null }">
    <c:forEach var="packingList" begin="0" end="20" items="${fullProduct.packingList}">
        <c:if test="${packingList != null }">
            <tr>
                <td>
            ${packingList.goodsName} *   ${packingList.num}
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
     图片列表
    <c:if test="${fullProduct.detailPicList != null }">
        <c:forEach var="productPic" begin="0" end="20" items="${fullProduct.detailPicList}">
            <c:if test="${productPic != null }">
                <tr>
                    <td>
                        <img width="400" height="280" alt="商品图片" title="${productPic.imageName}" src="${staticPath}/${productPic.url}">
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </c:if>

</table>
</div>
</body>
</html>