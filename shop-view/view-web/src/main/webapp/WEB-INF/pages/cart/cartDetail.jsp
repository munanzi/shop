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

    <script language="JavaScript" type="text/javascript">  
   
    </script>
</head>



<body>


<table  border="1" style="text-align:center; margin-left:auto; margin-right:auto">
  

     <c:forEach var="map"  items="${goodsMap}">
          <tr >
              <td colspan="2"  style="background:#808080">
                      ${map.key}
              </td>
          </tr>
          <c:forEach var="goodsView"  items="${map.value}">
          	  <input type="checkbox" name="goods" value="${goodsView.goodsId}"> 
              <tr>
                  <td> ${goodsView.productTile}</td> 
              
                  <td> ${goodsView.price}</td> 
             
                  <input type="text" name="goodsNum" value="${goodsView.num}"> 
              
                  <td> ${goodsView.amount}</td> 
              </tr>
          </c:forEach>
     </c:forEach>


</table>

</body>
</html>