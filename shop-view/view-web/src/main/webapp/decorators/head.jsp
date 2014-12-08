<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <!-- header 开始 -->
    <div class="site-top">
        <!--灰色导航-->
        <div class="site-nav clearfix">
            <div class="site-nav-bd">
                <!--头部左侧菜单-->
                <ul class="site-nav-bd-l">
                    <!--未登录-->
                    <c:if test ="${sessionScope.SESSION_USER==null}">
                    <li class="menu menu-login">
                        <a href="${ctx }/login" class="orange">登录</a>
                        <span>-</span>
                        <a href="#" class="orange">注册</a>
                    </li>
                    </c:if>
                    <c:if test ="${sessionScope.SESSION_USER!=null}">
                    <!--登录后-->
                    <li class="menu user-name">
                        <div class="menu-hd menu-light">
                            <a href="#" title="183******13">183******13</a>
                            <i class="arrow-icon"></i><!--箭头-->
                        </div>
                        <!--个人信息收起-->
                        <div class="menu-bd">
                            <div class="user-layout">
                                <div class="user-main user-box">
                                    <div class="user-m-top">
                                        <div class="user-info">
                                            <p>可提现余额：</p>
                                            <p><em>5,746,819,290</em><span>（商城）</span></p>
                                        </div>
                                    </div>
                                    <div class="user-m-bottom clearfix">
                                        <span class="fl">进行中的任务<a href="#" class="orange mlr5">6</a>个</span>
                                        <span class="fr">失败任务<a href="#" class="orange mlr5">109</a>个</span>
                                    </div>
                                </div>
                                <div class="user-medal clearfix">
                                    <a href="#" class="menu orange" title="充值">充值</a>
                                    <span class="site-nav-pipe"></span>
                                    <a href="#" class="menu orange" title="提现">提现</a>
                                    <div class="fr">
                                        <i class="exit-icon"></i><!--图标-->
                                        <a href="${ctx }/logout" title="退出" class="orange">退出</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    </c:if>
                    <li class="site-nav-pipe"></li>
                    <!--有消息-->
                    <li class="menu user-news">
                        <div class="menu-hd hi-icon-effect">
                            <a href="#" title="消息">
                                <i class="message-icon hi-icon"></i><!--图标-->
                                消息
                                <span class="orange">4</span>
                                <i class="arrow-icon"></i><!--箭头-->
                            </a>
                        </div>
                        <!--消息main-->
                        <div class="menu-bd">
                            <div class="user-layout">
                                <div class="user-main user-message">
                                    <h2>新消息<i class="number-icon">4</i></h2>
                                    <dl>
                                        <dt>
                                            <i class="notice-icon"></i><!--图标-->
                                            <span>通知</span>
                                        </dt>
                                        <dd>
                                            <a href="#">商城彩票频道充值返利活动通知商城彩票频道充值返利活动通知</a>
                                        </dd>
                                        <dt>
                                            <i class="system-icon"></i><!--图标-->
                                            <span>系统</span>
                                        </dt>
                                        <dd>
                                            <a href="#">商城彩票频道充值返利活动通知</a>
                                        </dd>
                                        <dt>
                                            <i class="activity-icon"></i><!--图标-->
                                            <span>活动</span></dt>
                                        <dd>
                                            <a href="#">商城彩票频道充值返利活动通知</a>
                                        </dd>
                                        <dt>
                                            <i class="activity-icon"></i><!--图标-->
                                            <span>活动</span>
                                        </dt>
                                        <dd>
                                            <a href="#">商城彩票频道充值返利活动通知</a>
                                        </dd>
                                    </dl>
                                </div>
                                <div class="user-medal">
                                    <a href="#" title="查看全部消息" class="menu orange">查看全部消息</a>
                                <span class="fr">
                                    <a href="#" title="我的留言" class="orange">我的留言<em>（12）</em></a>
                                </span>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="site-nav-pipe"></li>
                    <!--没有消息-->
                    <li class="menu user-news">
                        <div class="menu-hd  hi-icon-effect">
                            <a href="#" title="消息">
                                <i class="message-no-icon  hi-icon"></i><!--图标-->
                                消息
                                <i class="arrow-icon"></i><!--箭头-->
                            </a>
                        </div>
                        <!--消息main-->
                        <div class="menu-bd">
                            <div class="user-layout">
                                <div class="user-main user-message">
                                    <h2>没有新消息</h2>
                                    <div class="no-news"></div><!--图片-->
                                </div>
                                <div class="user-medal">
                                    <a href="#" title="查看全部消息" class="menu orange">查看全部消息</a>
                                <span class="fr">
                                    <a href="#" title="我的留言" class="orange">我的留言<em>（12）</em></a>
                                </span>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="site-nav-pipe"></li>
                    <li class="menu menu-hd hi-icon-effect">
                        <a href="${ctx }/cart/init" title="购物车">
                            <i class="redbag-icon hi-icon"></i><!--图标-->
                            购物车
                            <span class="new-icon"></span><!--图标NEW-->
                        </a>
                    </li>
                    <li class="site-nav-pipe"></li>
                    <li class="menu menu-hd hi-icon-effect">
                        <a href="#" title="推广赚钱">
                            <i class="spread-icon hi-icon"></i><!--图标-->
                            推广赚钱
                        </a>
                    </li>
                </ul>
                <!--头部右侧菜单-->
                <ul class="site-nav-bd-r">
                    <li class="menu menu-hd">
                        <a href="#" title="用户中心">用户中心</a>
                    </li>
                    <li class="site-nav-pipe"></li>
                    <li class="menu menu-hd">
                        <a href="#" title="安全中心">安全中心</a>
                    </li>
                    <li class="site-nav-pipe"></li>
                    <li class="menu menu-hd">
                        <a href="#" title="帮助中心">帮助中心</a>
                    </li>
                    <li class="site-nav-pipe"></li>
                    <li class="menu menu-hd">
                        <a href="#" title="商家登陆">商家登陆</a>
                    </li>
                    <li class="site-nav-pipe"></li>
                    <li class="menu menu-hd hi-icon-effect">
                        <a href="#" title="手机逛商城">
                            <i class="iphone-icon hi-icon"></i><!--图标-->
                            手机逛商城
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="site-top">
        <!--红色导航-->
        <div class="header">
            <div class="header-bd clearfix">
                <h1><a href="#" title="商城">商城</a></h1><!--LOGO-->
                <!--导航-->
                <ul class="nav">
                    <li><a href="${ctx }/category/index" title="首页" class="hover">首页</a></li>
                    <li><a href="#" title="商品管理">商品管理</a></li>
                    <li><a href="${ctx }/userCenter/orderList" title="交易管理">交易管理</a></li>
                    <li><a href="#" title="商家管理">商家管理</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- header 结束 -->


</div>