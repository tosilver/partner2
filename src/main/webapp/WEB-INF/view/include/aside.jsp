<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="admin-sidebar">
    <ul class="nav navbar-nav side-nav" id="sidebar">
        <li class="collapsed-content">
            <ul>
                <li class="search"><!-- Collapsed search pasting here at 768px --></li>
            </ul>
        </li>

        <li class="navigation" id="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="#navigation">导航 <i class="fa fa-angle-up"></i></a>

            <ul class="menu">
                <!--单选框 格式如下-->
                <%--<li class="active">
                    <a href="${pageContext.request.contextPath}/WEB-INF/view/index.jsp">
                        <i class="fa fa-tachometer"></i> Dashboard
                        <span class="badge badge-red">1</span>
                    </a>
                </li>--%>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-list"></i> 账号管理 <b class="fa fa-plus dropdown-plus"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${ctx}/merchant/info">
                                <i class="fa fa-caret-right"></i> 基本资料
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-caret-right"></i> Validation
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-caret-right"></i> Form Wizard
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
                            <a href="ui-elements.html">
                                <i class="fa fa-caret-right"></i> UI Elements
                            </a>
                        </li>
                        <li>
                            <a href="typography.html">
                                <i class="fa fa-caret-right"></i> Typography
                            </a>
                        </li>
                        <li>
                            <a href="tiles.html">
                                <i class="fa fa-caret-right"></i> Tiles
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar end -->
</aside>
