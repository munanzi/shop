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
    <script type="text/javascript" src="${ctx }/common/libs/jquery.json2.5.1.js"></script>

    <script type="text/javascript">
        function buyNow(){
            var obj={};
            $('input[name="goods"]:checked').each(function(){
                var goodsId=  $(this).val();
                obj[goodsId]=$("#goods"+goodsId).val();
            });
//            alert($.toJSON(obj))  ;
            $("#jsonGoods").val($.toJSON(obj));
            document.cartBuyForm.submit();
        }
    </script>
</head>



<body>

<form name="cartBuyForm" action="${ctx}/order/confirmOrder2">

    <input type="hidden" id="jsonGoods" name="jsonGoods">
</form>

购物车
  <br/>
  

     <c:forEach var="map"  items="${goodsMap}">


                      ${map.key}
                <br/>
         <table  border="1" style="text-align:center;" >
             <tr>
                 <td>选择 </td>
                 <td> 商品</td>

                 <td> 价格</td>

                 <td>数量  </td>

                 <td> 金额</td>
             </tr>
          <c:forEach var="goodsView"  items="${map.value}">

              <tr>
                  <td><input type="checkbox" name="goods" value="${goodsView.goodsId}"> </td>
                  <td> ${goodsView.productTitle}</td>

                  <td> ${goodsView.price}</td>

                  <td><input type="text" id="goods${goodsView.goodsId}" name="goodsNum" value="${goodsView.num}">  </td>

                  <td> ${goodsView.amount}</td>
              </tr>
          </c:forEach>
        </table>
     </c:forEach>

      <input type="button" onclick="javascript:buyNow()" value="购买">


</body>
</html>