<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

<link href="${ctx}/assets/proxy/css/page.css" rel="stylesheet">
<%--<link href="${ctx}/assets/proxy/css/iconfont.css" rel="stylesheet">--%>
<link href="${ctx}/assets/proxy/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/assets/proxy/css/bootstrap-datetimepicker.min.css" rel="stylesheet">




<!-- 页面头部 -->
<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top navbar-transparent-black mm-fixed-top lin" role="navigation" id="navbar"style="/*border: 1px solid red;*/flex-direction: column;;
justify-content: center;">
    <!-- .nav-collapse -->
    <div class="navbar-collapse">

        <!-- Quick Actions -->
        <!-- Branding --><%--头部的左边div--%>
        <div class="navbar-header col-md-2">
            <a class="navbar-brand header_left" href="${pageContext.request.contextPath}/main">
                <strong>Bao Zhi Lin</strong>
            </a>
            <div class="sidebar-collapse">
                <a href="#"style="position: center">
                    <i style="display: inline-block;font-family: FontAwesome;font-style: normal;font-weight: normal" class="fa-bars"></i>
                </a>
            </div>
        </div>
        <!-- Branding end -->
        <!-- .nav-collapse -->

        <!-- Page refresh -->
        <ul class="nav navbar-nav refresh" >
            <li class="divided" style="height: 44px;list-style: none;
            margin: 0 auto;">
                <a href="#" class="page-refresh">
                    <i class="fa-refresh" style="height: max-content;list-style: none;margin: 0 auto; display: inline-block;font-family: FontAwesome;font-style: normal;font-weight: normal"></i>
                </a>
            </li>
        </ul>

        <%--我的测试地点~--%>
        <ul class="nav navbar-nav refresh" style="display: flex;flex-direction: column;justify-content: center;">
            <li class="" style="height: 44px;list-style: none;
            margin: 0 auto;width: 800px">
                <a href="#" class="">
                    <%-- <i class="" style="height: max-content;list-style: none;margin: 0 auto;align-content: center;text-align: center">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <font size="4px" color="black">您的账号信息：通道余额：${pool}；冻结资金：${amount}</font>
                     </i>--%>
                </a>
            </li>
        </ul>

        <!-- /Page refresh -->
        <!-- Quick Actions -->
        <ul class="nav navbar-nav quick-actions">
            <li class="dropdown divided user" id="current-user">
                <a class="dropdown-toggle options" data-toggle="dropdown" href="#">
                    登录用户：<shiro:principal/><%--登录的用户--%> <i class="fa fa-caret-down"></i>
                </a>

                <ul class="dropdown-menu arrow settings">

                    <li>
                        <h3>切换颜色:</h3>
                        <ul id="color-schemes">
                            <li><a href="#" class="bg-2"></a></li>
                            <li><a href="#" class="bg-1"></a></li>

                            <li><a href="#" class="bg-3"></a></li>
                            <li><a href="#" class="bg-4"></a></li>
                            <li><a href="#" class="bg-5"></a></li>
                            <li><a href="#" class="bg-6"></a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="${ctx}/logout"><i class="fa fa-power-off"></i> 退出</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>

    <!-- 页面头部 /-->
    <!-- Sidebar，左边菜单栏 -->
    <!--侧边栏-->
    <aside class="sidebar">
        <section class="sidebar-max">
            <ul class="sidebar_ul">
                <li class="header_li">导航</li>

                <%--<a class="icon-Oval iconfont" href="${ctx}/merchant/list">
                    <li class="nav_click click nav_li">
                        <span class="nav_span nav_span01">个人资料</span>
                    </li>
                </a>--%>



                <a class="icon-Oval iconfont" href="${ctx}/qrcode/list">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">二维码管理</span>
                    </li>
                </a>


                <a class="icon-Oval iconfont" href="${ctx}/bankCradAdd/list">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">银行卡管理</span>
                    </li>
                </a>

                <a class="icon-Oval iconfont" href="${ctx}/recharge/add">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">通道充值</span>
                    </li>
                </a>

                <a class="icon-Oval iconfont" href="${ctx}/recharge/list">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">个人充值记录</span>
                    </li>
                </a>

                <%--<a class="icon-Oval iconfont" href="${ctx}/recharge/AgencyList">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">待审批充值</span>
                    </li>
                </a>--%>

                <a class="icon-Oval iconfont" href="${ctx}/QRChannel/list">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">通道余额</span>
                    </li>
                </a>


                <a class="icon-Oval iconfont" href="${ctx}/trade/list">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">确认收款</span>
                    </li>
                </a>

                <a class="icon-Oval iconfont" href="${ctx}/admin/createUser">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">新增会员</span>
                    </li>
                </a>

                <a class="icon-Oval iconfont" href="${ctx}/Agency/add">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">新增代理</span>
                    </li>
                </a>


                <a class="icon-Oval iconfont" href="${ctx}/QRChannel/add">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">新增代理通道</span>
                    </li>
                </a>

                <a class="icon-Oval iconfont" href="${ctx}/Agency/listOne">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">一级代理列表</span>
                    </li>
                </a>

                <a class="icon-Oval iconfont" href="${ctx}/Agency/listTwo">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">二级代理列表</span>
                    </li>
                </a>

                <a class="icon-Oval iconfont" href="${ctx}/Agency/listThree">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">三级代理列表</span>
                    </li>
                </a>
<%--
                <a class="icon-Oval iconfont">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">抢单管理</span>
                    </li>
                </a>


                <a class="icon-Oval iconfont">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">抢单记录</span>
                    </li>
                </a>




                <a class="icon-Oval iconfont">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">保证金充值</span>
                    </li>
                </a>



                <a class="icon-Oval iconfont">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">保证金转移</span>
                    </li>
                </a>



                <a class="icon-Oval iconfont">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">保证金流水</span>
                    </li>
                </a>


                <a class="icon-Oval iconfont">
                    <li class="nav_click nav_li">
                        <span class="nav_span nav_span01">联系客服</span>
                    </li>
                </a>--%>
            </ul>
        </section>
    </aside>


