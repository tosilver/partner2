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
<%--<div id="wrap">

    <!-- Make page fluid -->
    <div class="row">
        <!-- 页面头部 -->
        <%@ include file="../include/head.jsp" %>
        <!-- 页面头部 /-->
    </div>
    <!-- 内容区域 -->
    <div id="content" class="col-md-12">
        <!-- page header -->
        <!-- /page header -->

        <!-- content main container -->
        <div class="main">
            <!-- tile -->
            <section class="tile color transparent-white">
                <form id="searchForm" class="form-horizontal" role="form" action="${ctx}/recharge/list" method="get">
                    <input type="hidden" name="pageIndex" value="${page.pageIndex}"/>
                    <input type="hidden" name="pageSize" value="${page.pageSize}"/>
                    <!-- tile header -->
                    <div class="tile-header">
                        <h1><strong>充值</strong>记录</h1>
                        <div class="controls">
                            <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                            <a href="#" class="remove"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <!-- /tile header -->
                    <!-- tile body -->
                    <div class="tile-body no-vpadding">

                        <table class="table table-custom table-sortable">
                            <thead>
                            <tr>
                                <th class="sortable sort-asc">序号</th>
                                <th class="sortable sort-numeric">充值单号</th>
                                <th class="sortable sort-numeric">商城名称</th>
                                <th class="sortable sort-amount">银行卡号</th>
                                <th class="sortable sort-amount">银行名称</th>
                                <th class="sortable sort-amount">真实姓名</th>
                                <th class="sortable sort-amount">充值金额</th>
                                <th class="sortable sort-amount">充值时间</th>
                                <th style="width: 50px;">状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.list}" var="recharge" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${recharge.tradeNo}</td>
                                    <td>${recharge.merchantCompany}</td>
                                    <td>${recharge.cardNo}</td>
                                    <td>${recharge.bankName}</td>
                                    <td>${recharge.customerName}</td>
                                    <td>${recharge.amount}</td>
                                    <td><fmt:formatDate value='${recharge.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/></td>
                                    <td>
                                        <c:if test="${recharge.status == 0}"><span style="color: #0D47A1">充值中</c:if>
                                        <c:if test="${recharge.status == 1}"><span style="color:red">充值完成</c:if>
                                            <c:if test="${recharge.status == 2}"><span style="color: #4a148c">驳回</c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                    <!-- /tile body -->


                    <!-- tile footer -->
                    <!-- /tile footer -->
                    <%@ include file="../include/pagination.jsp" %>
                </form>
            </section>
        </div>
    </div>
</div>--%>
<%@ include file="../include/head.jsp" %>
<div class="primary">
    <h1>待审批充值记录</h1>
    <span class="code">通道</span>
    <select class="form-control control01 nav_sel">
        <option value="">请选择</option>
        <option value="">支付成功</option>
        <option value="">支付超时</option>
    </select>
    <!---->
    <span class="code nav_code">银行卡类型</span>
    <select class="form-control control01 nav_sel">
        <option value="">请选择</option>
        <option value="">支付成功</option>
        <option value="">支付超时</option>
    </select>
    <!---->
    <!---->
    <button class="btn" >搜索</button>
    <div class="nav_h1">
        <p>保证金总额：879.47</p>
        <p>冻结金额：0.47</p>
        <p>可用金额：879.47</p>
    </div>
    <!---->
    <div class="Total">
        <div class="primary_div">
            <ul class="nav_ul">
                <li style="width: 6% !important;">序号</li>
                <li style="width: 16% !important;">充值单号</li>
                <li style="width: 11% !important;">通道名称</li>
                <li style="width: 11% !important;">银行卡号</li>
                <li style="width: 9% !important;">银行名称</li>
                <li style="width: 8% !important;">持卡人姓名</li>
                <li style="width: 8% !important;">充值金额</li>
                <li style="width: 11% !important;">充值时间</li>
                <li style="width: 10% !important;">状态</li>
                <li style="width: 10% !important;">操作</li>
            </ul>
            <c:forEach items="${page.list}" var="recharge" varStatus="status">
                <div class="Total_p p nav_p">
                    <p style="width: 6%;">${status.index + 1}</p>
                    <p style="width: 16%;">${recharge.tradeNo}</p>
                    <p style="width: 11%;">${recharge.merchantCompany}</p>
                    <p style="width: 11%;">${recharge.cardNo}</p>
                    <p style="width: 9%;">${recharge.bankName}</p>
                    <p style="width: 8%;">${recharge.customerName}</p>
                    <p style="width: 8%;">${recharge.amount}</p>
                    <p style="width: 11%;"><fmt:formatDate value='${recharge.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>
                    </p>
                    <p style="width: 10%;">
                        <c:if test="${recharge.status == 0}"><span style="color: #0D47A1">待审核</c:if>
                        <c:if test="${recharge.status == 1}"><span style="color:red">审核完成</c:if>
                            <c:if test="${recharge.status == 2}"><span style="color: #4a148c">驳回</c:if>
                    </p>
                    <p style="width: 10%;">
                        <c:if test="${recharge.status==0}">
                            <a href="${ctx}/recharge/updateStatus?id=${recharge.id}&status=1"
                               onclick="return confirm('确认收款吗？', this.href)">确认审核</a>
                        </c:if>
                    </p>
                </div>
            </c:forEach>

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
