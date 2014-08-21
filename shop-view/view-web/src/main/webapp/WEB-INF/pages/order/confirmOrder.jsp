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
    <script type="text/javascript" src="${ctx }/common/js/cover.js"></script>

    <script language="JavaScript" type="text/javascript">
        $(document).ready(function(){
            $("#province").change(function(){
    	  var provinceId=$("#province").val();
    	  $.post("${ctx }/area/getSubArea",{areaId:provinceId},function callback(data){
                  $("#city").empty();
                  $.each(data,function(i,item){
                      $("#city").append("<option value='"+item.areaId+"'>"+item.areaName+"</option>");
                  });
                  $("#city").change( );
          });

        })
        $("#city").change(function(){
          var cityId=$("#city").val();
          $.post("${ctx }/area/getSubArea",{areaId:cityId},function(data){
            $("#county").empty();
            $.each(data,function(i,item){
                $("#county").append("<option value='"+item.areaId+"'>"+item.areaName+"</option>");
            });
          });
        })

        $("#province").change();

    })
   	function saveAddress(){
    	$.post("${ctx }/address/addAddress",{provinceId:$("#province").val(),cityId:$("#city").val(),postCode:$("#postCode").val(),
    		countyId:$("#county").val(),consignee:$("#consignee").val(),phoneNum:$("#phoneNum").val(),address:$("#address").val()},function(result){
    	    if(result.code="0"){
    	    	alert(result.addressId);
    	    	EV_closeAlert("newAddress")
    	    	$("#addressDiv").append('<tr><td><input type="radio" name="address" value = "'+result.addressId+'">'+
    	    			$("#userAddress.province") +'&nbsp;' + $("#userAddress.city")+' &nbsp;'+ $("#userAddress.county")  +
                      result.province + '&nbsp;'+ result.city + '&nbsp;' + result.county +
                        '&nbsp;' + result.address +'&nbsp;' + result.consignee + '&nbsp;' + result.phone_num +
    	    			+'</td></tr>');
    	    	

    	    	
    	    }else{
    	    	alert(result.messae);
    	    	
//     	    	<tr>
//                 <td><input type="radio" name="address" value = "${userAddress.addressId}">
//                     ${userAddress.province} &nbsp; ${userAddress.city} &nbsp; ${userAddress.county}
//                         &nbsp; ${userAddress.address}  &nbsp; ${userAddress.consignee}  &nbsp; ${userAddress.phone_num}
//                 </td>
//             </tr>
            
    	    }
    	  });
    }
    </script>

</head>



<body>
<form name="confirmOrderForm" action="${ctx }/order/submitOrder.htm">
 确认收货地址 <br/>
<div id="addressDiv">
<c:forEach var="userAddress" begin="0" end="20" items="${addressList}">
        <tr>
            <td><input type="radio" name="address" value = "${userAddress.addressId}">
                ${userAddress.province} &nbsp; ${userAddress.city} &nbsp; ${userAddress.county}
                    &nbsp; ${userAddress.address}  &nbsp; ${userAddress.consignee}  &nbsp; ${userAddress.phone_num}
            </td>
        </tr>
</c:forEach>
</div>
    <br/> <a href="#" onclick="EV_modeAlert('newAddress')"> 添加新地址 </a>
    <br/>
        
商品列表<br/>
<div id="productDiv">


</div>

</form>



<div id="newAddress"  style=" width:500px; background-color:#FFFFFF; border:1px solid #000000; padding:20px; overflow:hidden; display:none;">
<a href="javascript:EV_closeAlert('newAddress')">关闭</a>
    <br/>
 选择新地址： <select id="province" name="province">
            <c:forEach var="area" begin="0" end="20" items="${provinceList}">
                <option value="${area.areaId}">${area.areaName}</option>
            </c:forEach>
                    </select>
            <select id="city" name="city">
            </select>
            <select id="county" name="county">
            </select>
             <br/>

            详细地址：<input type="text" id="address" name="address"/>     <br/>
            邮编：<input type="text" id="postCode" name="postCode"/>       <br/>
            收件人：<input type="text" id="consignee" name="consignee"/>    <br/>
            手机号：<input type="text" id="phoneNum" name="phoneNum"/>     <br/>

            <br/>
           <input type="button" onclick="saveAddress();" value="保存地址" >
        </div>
</body>
</html>