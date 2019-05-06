<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<html>
<head>
    <title>宝芝琳</title>
    <meta name="apple-mobile-web-app-title" content="宝芝琳商户平台"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8"/>

    <link rel="icon" type="image/ico" href="http://tattek.com/minimal/assets/images/favicon.ico"/>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">

    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/animate/animate.min.css">

    <link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/assets/js/vendor/mmenu/css/jquery.mmenu.all.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/vendor/videobackground/css/jquery.videobackground.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/bootstrap-checkbox.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/vendor/rickshaw/css/rickshaw.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/vendor/morris/css/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/vendor/tabdrop/css/tabdrop.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/vendor/summernote/css/summernote.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/vendor/summernote/css/summernote-bs3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/vendor/chosen/css/chosen.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/vendor/chosen/css/chosen-bootstrap.css">

    <link href="${pageContext.request.contextPath}/assets/css/minimal.css" rel="stylesheet">

</head>
<body class="bg-1">

<!-- Preloader -->
<div class="mask">
    <div id="loader"></div>
</div>
<!--/Preloader -->

<!--/Preloader -->
<div id="wrap">

    <!-- Make page fluid -->
    <div class="row">
        <!-- 页面头部 -->
        <%@ include file="../include/head.jsp" %>
        <!-- 页面头部 /-->
    </div>
    <!-- 内容区域 -->
    <div id="content" class="col-md-12">
        <!-- page header -->
        <div class="pageheader">


            <h2><i class="fa fa-tachometer"></i> Dashboard
                <span>// Place subtitle here...</span></h2>

        </div>
        <!-- /page header -->

        <!-- content main container -->
        <div class="main">
            <!-- tile -->
            <section class="tile color transparent-black">



                <!-- tile header -->
                <div class="tile-header">
                    <h1><strong>提现账户</strong> 列表</h1>
                    <div class="search">
                        <input type="text" placeholder="Search...">
                    </div>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <!-- /tile header -->
                <!-- tile widget -->
                <div class="tile-widget bg-transparent-black-2">
                    <div class="row">

                        <button type="button" class="btn btn-danger margin-bottom-20">新增</button>

                    </div>
                </div>
                <!-- /tile widget -->



                <!-- tile body -->
                <div class="tile-body nopadding">

                    <table class="table table-bordered table-sortable">
                        <thead>
                        <tr>
                            <th>
                                <div class="checkbox check-transparent">
                                    <input type="checkbox" value="1" id="allchck">
                                    <label for="allchck"></label>
                                </div>
                            </th>
                            <th class="sortable sort-alpha sort-asc">编号</th>
                            <th class="sortable sort-alpha">账号类型</th>
                            <th class="sortable sort-alpha">银行名称</th>
                            <th class="sortable sort-alpha">卡号</th>
                            <th class="sortable sort-alpha">真实姓名</th>
                            <th class="sortable sort-alpha">联系电话</th>
                            <th class="sortable sort-alpha">添加时间</th>
                            <th style="width: 30px;"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="checkbox check-transparent">
                                    <input type="checkbox" value="1" id="chck01">
                                    <label for="chck01"></label>
                                </div>
                            </td>
                            <td>Mark</td>
                            <td>Otto</td>
                            <td>Otto</td>
                            <td>Otto</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td>@mdo</td>
                            <td><a href="#" class="check-toggler checked"></a></td>
                        </tr>
                        </tbody>
                    </table>

                </div>
                <!-- /tile body -->


                <!-- tile footer -->
                <div class="tile-footer bg-transparent-black-2 rounded-bottom-corners">
                    <div class="row">

                        <div class="col-sm-4 text-right sm-center">
                            <ul class="pagination pagination-xs nomargin pagination-custom">
                                <li class="disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
                            </ul>
                        </div>

                    </div>
                </div>
                <!-- /tile footer -->




            </section>
            <!-- /tile -->
        </div>
    </div>
</div>
<!-- 内容区域 /-->
</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/vendor/mmenu/js/jquery.mmenu.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/vendor/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/vendor/nicescroll/jquery.nicescroll.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/vendor/animate-numbers/jquery.animateNumbers.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/vendor/videobackground/jquery.videobackground.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/vendor/blockui/jquery.blockUI.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/flot/jquery.flot.time.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/flot/jquery.flot.selection.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/flot/jquery.flot.animator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/flot/jquery.flot.orderBars.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/easypiechart/jquery.easypiechart.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/rickshaw/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/rickshaw/d3.v2.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/rickshaw/rickshaw.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/morris/morris.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/tabdrop/bootstrap-tabdrop.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/summernote/summernote.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/chosen/chosen.jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/minimal.min.js"></script>

</body>
</html>
