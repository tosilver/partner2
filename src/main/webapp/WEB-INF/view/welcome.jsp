<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<html>
<head>
    <title>欢迎页面</title>

    <script type="text/javascript" src="${ctxAssets}/3rd-lib/echarts/echarts.min.js"></script>
</head>
<body>
<body class="bg-1">

<!-- Preloader -->
<div class="mask"><div id="loader"></div></div>
<!--/Preloader -->

<!--/Preloader -->
<div id="wrap">

    <!-- Make page fluid -->
    <div class="row">
        <!-- 页面头部 -->
        <%@ include file="include/head.jsp" %>
        <!-- 页面头部 /-->
        <!-- 内容区域 -->
        <div id="content" class="col-md-12">
            <div class="card-container col-lg-3 col-sm-6 col-sm-12">
                <div class="card card-greensea hover">
                    <div class="front">

                        <div class="media">
                      <span class="pull-left">
                        <i class="fa fa-usd media-object"></i>
                      </span>

                            <div class="media-body">
                                <small>Sales</small>
                                <h2 class="media-heading animate-number" data-value="169541" data-animation-duration="1500">0</h2>
                            </div>
                        </div>

                        <div class="progress-list">
                            <div class="details">
                                <div class="title">This month plan %</div>
                            </div>
                            <div class="status pull-right bg-transparent-black-1">
                                <span class="animate-number" data-value="42" data-animation-duration="1500">0</span>%
                            </div>
                            <div class="clearfix"></div>
                            <div class="progress progress-little progress-transparent-black">
                                <div class="progress-bar animate-progress-bar" data-percentage="42%"></div>
                            </div>
                        </div>

                    </div>
                    <div class="back">
                        <a href="#">
                            <i class="fa fa-bar-chart-o fa-4x"></i>
                            <span>Check Summary</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 内容区域 /-->
    </div>
</div>

</body>
</html>