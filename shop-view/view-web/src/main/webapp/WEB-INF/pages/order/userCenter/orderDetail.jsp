<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib uri="/WEB-INF/tld/JstlTag.tld" prefix="amount" %>
<html lang="zh-cn">
<head>

    <script type="text/javascript" src="${ctx }/common/js/menu.js"></script>

<script type="text/javascript">
        $(function () {
            $('#btn-tk').on('click', function () {
                showPopWin($('#tipTKQR'));
            });
            $(".close,.cancel").on('click', function () {
                hidePopWin($(".tip_p"));
            });
            $(".okBtn").on('click', function (e) {
//                alert("OK");
                hidePopWin($(".tip_p"));
            });
        });

//function refund(){
//    showPopWin($('#tipTKQR'));
//}
function refund(orderId){


    $.post("${ctx }/manageOrder/refund", {orderId:orderId,sellerRemark:$("#remark")},function(data) {
        if(data.success=="true"){
            showPopWin($('#tipTK'));
        }else{
            alert("退款失败");
        }
    });

}

</script>

</head>

<body>
<div class="bodyWrap"/>
<div class="cm_nav">
    <p class="md_basic_nav">
        <em>您的位置:</em>
        <em class="md_basic_nav_cur">首页</em>
        <span>&gt;</span>
        <em class="md_basic_nav_cur">订单管理</em>
        <span>&gt;</span>
        <em>订单详情</em>
    </p>
</div>
<!--layout-->
<div class="layout clearfix" style="margin-bottom: 30px;">
    <div id="content" class="clearfix">
        <div id="o-order" class="clearfix">
        <div class="o-title">
            订单信息
        </div>
        <div class="clearfix">
            <div class="fl o-info" style="width: 985px;">
                <table class="fl o-table">
                    <tr>
                        <td class="o-label">订单编号：</td>
                        <td class="o-value">${order.orderId}</td>
                    </tr>
                    <tr>
                        <td class="o-label">订单金额：</td>
                        <td class="o-value">${amount:display(order.amount)}</td>
                    </tr>
                </table>
                <table class="fl o-table">
                    <tr>
                        <td class="o-label">订单状态：</td>
                        <td class="o-value">${statusMap[order.status]}</td>
                    </tr>
                    <tr>
                        <td class="o-label">使用积分：</td>
                        <td class="o-value">${order.useIntegral}</td>
                    </tr>
                </table>
                <table class="fl o-table">
                    <tr>
                        <td class="o-label">支付方式：</td>
                        <td class="o-value"></td>
                    </tr>
                    <tr>
                        <td class="o-label">创建时间：</td>
                        <td class="o-value"><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
                </table>
            </div>
            <%--<div class="fl">--%>
            <%--<img src="images/pic_twocode_0.jpg"--%>
            <%--style="display: block;border: 1px solid #C2C2C2; margin: 10px auto;padding:5px;"/>--%>
            <%--<span>用宝聊扫描二维码联系买家</span>--%>
            <%--</div>--%>
        </div>
    </div>

        <div id="o-content">
            <ul class="o-t">
                <li class="o-c1 fl">
                    商品列表
                </li>
                <li class="o-c2 fl">
                    数量
                </li>
                <li class="o-c2 fl">
                    单价
                </li>
                <li class="o-c2 fl">
                    店铺
                </li>

            </ul>
            <%--<ul class="o-num">--%>
                <%--<li class="o-c1 fl">--%>
                    <%--订单编号：2014082029--%>
                <%--</li>--%>
                <%--<li class="o-c3 fr">--%>
                    <%--下单时间：2014-03-03  22:44--%>
                <%--</li>--%>
            <%--</ul>--%>
            <c:forEach var="orderGoods"  items="${goodsList}">
            <ul class="o-detail">
                <li class="o-c1 fl">
                    <div class="o-d ">
                        <img class="fl" src="${staticPath}/${orderGoods.picUrl}" width="90" height="90" border="1"/>

                        <div class="fl o-p-label">
                            <span>${orderGoods.goodsName} </span>

                            <div>
                                            <%--<span>--%>
                                                <%--单价：123.00--%>
                                            <%--</span><br/>--%>
                                            <%--<span>--%>
                                                <%--买家：zhangsan--%>
                                            <%--</span>--%>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="o-c2 fl">
                ${orderGoods.num}
                </li>
                <li class="o-c2 fl o-bold">
                        ${amount:display(orderGoods.price)}
                </li>
                <li class="o-c2 fl">
                    ${order.shopName}
                </li>

            </ul>
            </c:forEach>
        </div>
        <div id="o-addr" class="clearfix">
            <div class="o-title">
                收货信息
            </div>
            <div class="clearfix">
                <div class="fl o-info" style="width: 985px;">
                    <table class="fl o-table">
                        <tr>
                            <td class="o-label">买家账号：</td>
                            <td class="o-value">${order.userName}</td>
                        </tr>
                        <tr>
                            <td class="o-label">收货人姓名：</td>
                            <td class="o-value">${orderAddress.consignee}</td>
                        </tr>
                    </table>
                    <table class="fl o-table">
                        <tr>
                            <td class="o-label">收货人手机：</td>
                            <td class="o-value">${orderAddress.phoneNum}</td>
                        </tr>
                        <tr>
                            <td class="o-label">地址：</td>
                            <td class="o-value">${orderAddress.province}${orderAddress.city}${orderAddress.county}${orderAddress.address}</td>
                        </tr>
                    </table>
                    <table class="fl o-table">
                        <tr>
                            <td class="o-label">物流公司：</td>
                            <td class="o-value">${orderAddress.expressName}</td>
                        </tr>
                        <tr>
                            <td class="o-label">物流单号：</td>
                            <td class="o-value">${orderAddress.expressNo}</td>
                        </tr>
                    </table>
                </div>
                <%--<div class="fl">--%>
                    <%--<img src="images/pic_twocode_0.jpg"--%>
                         <%--style="display: block;border: 1px solid #C2C2C2; margin: 10px auto;padding:5px;"/>--%>
                    <%--<span>用宝聊扫描二维码联系买家</span>--%>
                <%--</div>--%>
            </div>
        </div>
        <div id="o-info">
            <div class="o-title">
                备注信息
            </div>
            <div style="padding-top: 20px;">
                <table style="line-height: 40px;">
                    <tr>
                        <td class="o-label o-label1">买家备注：</td>
                        <td class="o-value">${order.remark}</td>
                    </tr>
                    <tr>
                        <td class="o-label o-label1" style="line-height: 30px;">我的备注：</td>
                        <td class="o-value">
                            <%--<label class="defaultTips">您可添加关于订单的发货物流单号或其他备注</label>--%>
                            <textarea id="remark" class="o_textarea">${order.sellerRemark}</textarea>

                            <div class="o-tip">0/500中英文字符</div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input class="o-btn o-btn-save"  type="button" value="保存"/>     &nbsp;
                            <input class="o-btn o-btn-save"  type="button" value="取消"/>      &nbsp;
                            <input id="btn-tk" class="o-btn o-btn-save"  type="button" value="退款"/>      &nbsp;
                            <input class="o-btn o-btn-save"  type="button" value="发货"/>      &nbsp;
                            <input class="o-btn o-btn-save"  type="button" value="退货"/>      &nbsp;
                            <%--<div class="o-btn o-btn-save" style="margin-left: 10px;">--%>
                                <%--保存--%>
                            <%--</div>--%>

                            <%--<div class="o-btn o-btn-save" style="margin-left: 10px;">--%>
                                <%--取消--%>
                            <%--</div>--%>

                            <%--<div class="o-btn o-btn-save" style="margin-left: 10px;">--%>
                                <%--发货--%>
                            <%--</div>--%>

                            <%--<div class="o-btn o-btn-save" style="margin-left: 10px;">--%>
                                <%--退款--%>
                            <%--</div>--%>
                        </td>

                            <%--<li class="o-c2 fl">--%>
                                <%--<div class="o-btn o-btn-tk" id="btn-tk">--%>
                                    <%--退款--%>
                                <%--</div>--%>
                                <%--<div class="o-btn-d">--%>
                                    <%--<a class="o-btn-a" href="javascript:void(0)" target="_self">标记为发货</a>--%>
                                    <%--<a class="o-btn-a" href="javascript:void(0)" target="_self">取消交易</a>--%>
                                    <%--<!-- <a class="o-btn-a" href="javascript:void(0)" target="_self">修改价格</a> -->--%>
                                <%--</div>--%>
                            <%--</li>--%>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>


<div id="tipTKQR" class="tip_p hide">
    <div class="popBox">
        <a href="#" class="u2_pbClose pbnClose close" title="关闭"></a>

        <div class="pbnContent">
            <h2>退款确认</h2>

            <div class="o-tip-tk">
                <p>确认退款后，会将该笔货款从你的商家账户中扣除并退还给买家。</p>
                <ul class="forms fl">
                    <li class="list_item clearfix">
                        <label class="label" style="width:160px; margin-right: 5px;">交易密码：</label>

                        <div class="fl">
                            <input id="p-name" class="input_text" type="text" maxlength="30" style="width:165px;"/>
                            <span class="tips errTips mt10 db"><span> </span> 密码错误，请重新输入</span>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="tip_btn">
                <a href="#" onclick="refund('${order.orderId}');" class="md_basic_btn">确定</a>
                <a href="#" class="md_basic_btn disabled cancel">取消</a>
            </div>
        </div>
        <div class="pbnBottom popbotSmall"></div>
    </div>
</div>
<div id="tipTK" class="tip_p hide">
    <div class="popBox">
        <a href="#" class="u2_pbClose pbnClose close" title="关闭"></a>

        <div class="pbnContent">
            <h2>提示</h2>

            <div class="tip_content">
                <p>退款成功，该笔货款已经退还给买家</p>
            </div>
            <div class="tip_btn">
                <a href="#"  class="md_basic_btn okBtn">确定</a>
                <a href="#" class="md_basic_btn disabled cancel">取消</a>
            </div>
        </div>
        <div class="pbnBottom popbotSmall"></div>
    </div>
</div>
<!-- 下架 -->
<div id="tipCZ" class="tip_p hide">
    <div class="popBox">
        <a href="#" class="u2_pbClose pbnClose close" title="关闭"></a>

        <div class="pbnContent">
            <h2>提示</h2>

            <div class="tip_content">
                <p>您商家账户中余额不足，请充值</p>
            </div>
            <div class="tip_btn">
                <a href="#" class="md_basic_btn okBtn">确定</a>
                <%--<a href="#" class="md_basic_btn disabled cancel">取消</a>--%>
            </div>
        </div>
        <div class="pbnBottom popbotSmall"></div>
    </div>
</div>


</body>
</html>
