<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib uri="/WEB-INF/tld/JstlTag.tld" prefix="amount" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="Keywords" content="" />
    <meta name="Description" content="" />
    <link rel="stylesheet" type="text/css" href="${staticPath}/common/libs/jquery-ui-1.11.1.custom/jquery-ui.css" />
    <script type="text/javascript"  src="${staticPath}/common/libs/jquery-ui-1.11.1.custom/jquery-ui.js"></script>
    <script type="text/javascript"  src="${staticPath}/common/libs/jquery-ui-1.11.1.custom/jquery.ui.datepicker-zh-CN.js"></script>
    <%--<script type="text/javascript" src="js/menu.js"></script>--%>
    <%--<script type="text/javascript" src="js/manage.js"></script>--%>
    <script type="text/javascript"  src="${staticPath}/common/js/common.js"></script>

<script>

$(document).ready(function(){
    $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
    var dates = $('#beginDate, #endDate').datepicker({
        dateFormat: 'yy-mm-dd',
        onSelect: function(selectedDate) {
            var option = this.id == "beginDate" ? "minDate" : "maxDate";
            var instance = $(this).data("datepicker");
            var date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
            dates.not(this).datepicker("option", option, date);
        },
        maxDate:''
    });
});

function queryOrder(){

    document.OrderQueryForm.submit();
}


</script>

</head>
<body>




<div class="cm_nav">
    <p class="md_basic_nav">
        <em>您的位置:</em>
        <em class="md_basic_nav_cur">首页</em>
        <span>&gt;</span>
        <em class="md_basic_nav_cur">用户中心</em>
        <span>&gt;</span>
        <em>订单列表</em>
    </p>
</div>
<div class="mainWrap layout clearfix">
<div class="aside">
    <ul class="asideMenu">
        <li><a href="#" class="hover"></span>订单列表</a></li>
        <li><a href="#">收货地址</a></li>
    </ul>
    <div class="menuTip"></div>
</div>
<!--订单列表-->
<div class="fl w770 pl40 goodsManageR">
<form name="OrderQueryForm" action="${ctx}/userCenter/orderList" method="post">
<div class="goodsManageSearch">
    <ul class="clearfix">
        <li class="fl">
            <em>商品名称</em>
            <div class="select w226">
                <input type="text" name="productName" class="goodsname"  value="${queryOrderPO.productName}"/>
            </div>
        </li>
        <li class="fl ml48">
            <em>订单编号</em>
            <div class="select w166 clearfix">
                <input type="text" name="orderId" class="ordercode" value="${queryOrderPO.orderId}"/>
            </div>
        </li>
        <li class="fr">

        </li>
        <li class="fl mt10">
            <em>下单时间</em>
            <div class="select w105">
                <input type="text" readonly="true" id="beginDate" name="beginDate" class="upGoodsDate" value="${queryOrderPO.beginDate}"/>
                <i><!--下拉按钮--></i>
            </div>
            <div class="select w105 ml14">
                <input type="text" readonly="true" id="endDate" name="endDate" class="upGoodsDate" value="${queryOrderPO.endDate}" />
                <i><!--下拉按钮--></i>
            </div>
        </li>
        <li class="fl ml48 mt10">
            <%--<em>卖家账号</em>--%>
            <%--<div class="select w166 clearfix">--%>
                <%--<input type="text" name="sellerName" class="ordercode" />--%>
            <%--</div>--%>
                <em>订单状态</em>
                <div class="select w166">
                    <select name="status">
                        <option value="">请选择</option>
                        <c:forEach var="map"  items="${statusMap}">
                            <option value="${map.key}" <c:if test="${queryOrderPO.status==map.key}">selected</c:if>   >${map.value}</option>
                        </c:forEach>
                    </select>
                </div>
        </li>
        <li class="fr mt10 goodsManageSearchBtn">
            <a href="javascript:queryOrder()" target="_self">查询</a>
        </li>
    </ul>
</div>
</form>
<table class="custOrderTb">
    <thead>
    <th class="orderCon"><div>订单内容<span><!--解决IE7下有右白边--></span></div></th>
    <th class="orderNum"><div>数量</div></th>
    <th class="orderSumMoney"><div>总金额(元)</div></th>
    <th class="orderState"><div>订单状态</div></th>
    <th class="orderOption"><div>操作</div></th>
    </thead>

<c:forEach var="map"  items="${orderMap}">
<tbody>
    <tr class="subTitleInfo">
        <td colspan="5" class="clearfix">
            <span class="fl">订单编号：${map.key}</span>
            <span class="fl">${map.value[0].shopName}</span>
            <span class="fr">下单时间：<fmt:formatDate value="${map.value[0].createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </span>
        </td>
    </tr>
        <c:forEach var="queryOrderRO"  items="${map.value}">
            <tr class="custOrderData">
                <td class="lbor">
                    <div class="custOrderCon">
                        <img src="${staticPath}/${queryOrderRO.picUrl}" alt="#" />
                        <div>
                            <p>${queryOrderRO.goodsName}</p>
                            <div class="mt5 c888">
                                <span>单价：${amount:display(queryOrderRO.price)}</span><br/>
                                <span>买家：${queryOrderRO.userName}</span>
                            </div>
                        </div>
                    </div>
                </td>
                <td><div class="custOrderNum">${queryOrderRO.num}</div></td>
                <td>
                    <div class="custOrderSumMoney">
                        <p><strong>${amount:display(queryOrderRO.amount)}</strong><em>&nbsp;</em></p>
                        <div class="editMoney">
                            <input type="text" name="inputNumber" />
                            <a href="javascript:void(0)" target="_self">保存</a>
                        </div>
                    </div>
                </td>
                <td><div class="custOrderState">${statusMap[queryOrderRO.status]}</div></td>
                <td class="rbor">
                    <div class="custOrderOption">
                        <c:if test="${queryOrderRO.status==1}">
                            <a href="" target="_self">取消交易</a>
                        </c:if>
                        <a href="${ctx}/userCenter/orderDetail?orderId=${queryOrderRO.orderId}" target="_self">订单详情</a>
                        <c:if test="${queryOrderRO.status==4}">
                            <a href="" target="_self">申请退货</a>
                        </c:if>
                        <c:if test="${queryOrderRO.status==3}">
                            <a href="" target="_self">待发货</a>
                        </c:if>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>

    </c:forEach>

</table>


<%--<div class="dataTables_paginate paging_full_numbers" id="example_paginate">--%>
    <%--<span class="first paginate_button paginate_button_disabled" id="example_first">首页</span><span class="previous paginate_button paginate_button_disabled" id="example_previous">上一页</span><span><span class="paginate_active">1</span><span class="paginate_button">2</span></span><span class="next paginate_button" id="example_next">下一页</span><span class="last paginate_button" id="example_last">末页</span>--%>

<%--</div>--%>
    <div class="dataTables_paginate paging_full_numbers" id="example_paginate2">
            <c:set var="formName" value="OrderQueryForm"/>
            <%@ include file="../../common/page.jsp"%>
        <div class="clearfix"></div>
    </div>


</div>
</div>



<script type="text/javascript">

    $(document).ready(function(){
        $(".custOrderSumMoney").each(function(){
            var _this=$(this);
            _this.find("em").click(function(){
                var _thisEm=$(this);
                var _getValue=_thisEm.prev("strong").text();
                var _editInputParent=_thisEm.parent().next("div.editMoney");
                _thisEm.parent().hide();

                _editInputParent.children("input").val(_getValue);
                _thisEm.parent().next("div.editMoney").show();
            })
        })
        $(".editMoney").each(function(){
            var _this=$(this);
            _this.children("a").click(function(){
                var _inputValue=$(this).prev("input").val();
                if(_inputValue!=""&&_inputValue!=null){
                    _this.prev("p").children("strong").text(_inputValue);
                }
                _this.hide().prev().show();
            })
        })
    })
</script>



</body>
</html>

