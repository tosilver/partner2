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

    <link type="text/css" rel="stylesheet" media="all"
          href="${pageContext.request.contextPath}/assets/js/vendor/mmenu/css/jquery.mmenu.all.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/js/vendor/videobackground/css/jquery.videobackground.css">
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

                <form id="searchForm" class="form-horizontal" role="form" action="${ctx}/bankCradAdd/list" method="get">

                    <input type="hidden" name="pageIndex" value="${page.pageIndex}"/>
                    <input type="hidden" name="pageSize" value="${page.pageSize}"/>


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

                            <button type="button" class="btn btn-primary btn-lg margin-bottom-20"
                                    onclick="window.location='${ctx}/bankCradAdd/add'">新增
                            </button>

                        </div>
                    </div>
                    <!-- /tile widget -->
                    <!-- tile body -->
                    <div class="tile-body nopadding">

                        <form id="Form" class="form-horizontal" role="form" action="${ctx}/bankCradAdd/list" method="get">

                            <table class="table table-bordered table-sortable">
                                <thead>
                                    <tr>
                                        <th class="sortable sort-alpha">序号</th>
                                        <th class="sortable sort-alpha ">商户ID</th>
                                        <th class="sortable sort-alpha">账号类型</th>
                                        <th class="sortable sort-alpha">银行名称</th>
                                        <th class="sortable sort-alpha">银行卡号</th>
                                        <th class="sortable sort-alpha">真实姓名</th>
                                        <th class="sortable sort-alpha">联系电话</th>
                                        <th class="sortable sort-alpha">添加时间</th>
                                        <th class="sortable sort-amount">状态</th>
                                        <th class="sortable sort-amount">操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${page.list}" var="bankCradAdd" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${bankCradAdd.merchantId}</td>
                                            <td>
                                                <c:if test="${bankCradAdd.accountType == 0}">银行卡</c:if>
                                                <c:if test="${bankCradAdd.accountType == 1}">支付宝</c:if>
                                                <c:if test="${bankCradAdd.accountType == 2}">微信<%--<span style="color:red">微信</span>--%></c:if>
                                            </td>
                                            <td>${bankCradAdd.bankName}</td>
                                            <td>${bankCradAdd.cardNo}</td>
                                            <td>${bankCradAdd.customerName}</td>
                                            <td>${bankCradAdd.phoneNum}</td>
                                            <td>${bankCradAdd.createTime}</td>

                                            <td>${bankCradAdd.status== 0 ? "<font color='#FF0000'>停用</font>":"可用" }</td>
                                            <td>
                                                <c:if test="${bankCradAdd.status==1}">
                                                    <a href="${ctx}/bankCradAdd/updateStatus?id=${bankCradAdd.id}&status=0"
                                                       onclick="return confirm('确认要停用该收款码吗？', this.href)">停用</a>
                                                </c:if>
                                                <c:if test="${bankCradAdd.status==0}">
                                                    <a href="${ctx}/bankCradAdd/updateStatus?id=${bankCradAdd.id}&status=1"
                                                       onclick="return confirm('确认要启用该收款码吗？', this.href)">启用</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <!-- /tile body -->

                    <!-- tile footer -->
                    <%@ include file="../include/pagination.jsp" %>
                    <!-- /tile footer -->
                </form>
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
<script type="text/javascript"
        src="${pageContext.request.contextPath}/assets/js/vendor/mmenu/js/jquery.mmenu.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/assets/js/vendor/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/assets/js/vendor/nicescroll/jquery.nicescroll.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/assets/js/vendor/animate-numbers/jquery.animateNumbers.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/assets/js/vendor/videobackground/jquery.videobackground.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/assets/js/vendor/blockui/jquery.blockUI.js"></script>

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
