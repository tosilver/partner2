<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<!-- 页面头部 -->
<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top navbar-transparent-black mm-fixed-top" role="navigation" id="navbar">
    <!-- .nav-collapse -->
    <div class="navbar-collapse">
        <!-- Quick Actions -->
        <!-- Branding -->
        <div class="navbar-header col-md-2">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/main">
                <strong>Bao Zhi Lin</strong>
            </a>
            <div class="sidebar-collapse">
                <a href="#">
                    <i class="fa fa-bars"></i>
                </a>
            </div>
        </div>
        <!-- Branding end -->
        <!-- .nav-collapse -->


            <!-- Page refresh -->
            <ul class="nav navbar-nav refresh">
                <li class="divided">
                    <a href="#" class="page-refresh"><i class="fa fa-refresh"></i></a>
                </li>
            </ul>
            <!-- /Page refresh -->
            <!-- Quick Actions -->
            <ul class="nav navbar-nav quick-actions">
                <li class="dropdown divided user" id="current-user">
                    <a class="dropdown-toggle options" data-toggle="dropdown" href="#">
                        <shiro:principal/> <i class="fa fa-caret-down"></i>
                    </a>

                    <ul class="dropdown-menu arrow settings">

                        <li>
                            <h3>切换颜色:</h3>
                            <ul id="color-schemes">
                                <li><a href="#" class="bg-1"></a></li>
                                <li><a href="#" class="bg-2"></a></li>
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
    <!-- Sidebar -->
    <ul class="nav navbar-nav side-nav" id="sidebar">

        <li class="collapsed-content">
            <ul>
                <li class="search"><!-- Collapsed search pasting here at 768px --></li>
            </ul>
        </li>

        <li class="navigation" id="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="#navigation">导航菜单 <i class="fa fa-angle-up"></i></a>

            <ul class="menu">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-list"></i> 账号管理 <b class="fa fa-plus dropdown-plus"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${ctx}/merchant/list">
                                <i class="fa fa-caret-right"></i> 基本资料
                            </a>
                        </li>
                        <li>
                            <a href="${ctx}/qrcode/list">
                                <i class="fa fa-caret-right"></i> 二维码管理
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-pencil"></i> 资金管理 <b class="fa fa-plus dropdown-plus"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${ctx}/recharge/add">
                                <i class="fa fa-caret-right"></i> 通道充值
                            </a>
                        </li>
                        <li>
                            <a href="${ctx}/recharge/list">
                                <i class="fa fa-caret-right"></i> 充值记录
                            </a>
                        </li>
                        <li>
                            <a href="${ctx}/QRChannel/list">
                                <i class="fa fa-caret-right"></i> 通道余额
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="${ctx}/trade/list">
                        <i class="fa fa-play-circle"></i> 确认收款
                    </a>
                </li>
            </ul>

        </li>

    </ul>
    <!-- Sidebar end -->
    <!--/.nav-collapse -->