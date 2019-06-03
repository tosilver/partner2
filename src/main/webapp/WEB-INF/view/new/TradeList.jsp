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
    <%--   <div id="content" class="col-md-12">
           <!-- page header -->
           <div class="pageheader">


               <h2><i class="fa fa-tachometer"></i> Dashboard
                   <span>// Place subtitle here...</span></h2>

           </div>
           <!-- /page header -->

           <!-- content main container -->
           <div class="main">

               <!-- tile -->
               <section class="tile color transparent-white">
                   <form id="searchForm" class="form-horizontal" role="form" action="${ctx}/trade/list" method="get">
                       <input type="hidden" name="pageIndex" value="${page.pageIndex}"/>
                       <input type="hidden" name="pageSize" value="${page.pageSize}"/>
                       <!-- tile header -->
                       <div class="tile-header">
                           <h1><strong>订单</strong>列表</h1>
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
                                   <th class="sortable sort-asc">订单号</th>
                                   <th class="sortable sort-numeric">二维码</th>
                                   <th class="sortable sort-amount">交易金额</th>
                                   <th class="sortable sort-amount">支付状态</th>
                                   <th class="sortable sort-amount">调用时间</th>
                                   <th style="width: 120px;">操作</th>
                               </tr>
                               </thead>
                               <tbody>
                               <c:forEach items="${page.list}" var="trade" varStatus="status">
                                   <tr>
                                       <td>${trade.merchantOrderNo}</td>
                                       <td>${trade.qrcode.name}</td>
                                       <td>${trade.totalAmount}</td>
                                       <td>
                                           <c:if test="${trade.tradeState == 0}"><span style="color: #5e35b1">未支付</c:if>
                                           <c:if test="${trade.tradeState == 1}">已支付</c:if>
                                           <c:if test="${trade.tradeState == 2}">客服确认支付</c:if>
                                       </td>
                                       <td><fmt:formatDate value='${trade.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/></td>
                                       <td>
                                           <c:if test="${trade.tradeState==0}">
                                               <a href="${ctx}/trade/updateStatus?id=${trade.id}&status=1"
                                                  onclick="return confirm('确认收款吗？', this.href)">确认收款</a>
                                           </c:if>
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
       </div>--%>


    <!--保证金转移-->
    <div class="primary">
        <h1>抢单管理</h1>
        <form id="searchForm" action="${ctx}/trade/list" method="get" class="am-form-inline">
            <input type="hidden" name="pageIndex" value="${page.pageIndex}"/>
            <input type="hidden" name="pageSize" value="${page.pageSize}"/>

            <%--<span class="code">二维码类型</span>
            <select class="form-control control">
                <option value="">请选择</option>
                <option value="1">微信</option>
                <option value="0">支付宝</option>
            </select>--%>
            <span class="code">支付状态</span>
            <select class="form-control control" name="tradeState">
                <option value="">请选择</option>
                <option value="0" <c:if test="${page.params.tradeState eq 0}">selected</c:if>>等待支付</option>
                <option value="1" <c:if test="${page.params.tradeState eq 1}">selected</c:if>>完成支付</option>
            </select>
            <button class="btn" type="submit" style="vertical-align: inherit;">搜索</button>
        </form>
        <c:if test="${qrChannel.status==0}">
            <button class="btn" style="vertical-align: inherit;background: green;"
                    onclick="window.location='${ctx}/QRChannel/updateStatus?id=${qrChannel.id}&status=1' ">开始抢单
            </button>
        </c:if>
        <c:if test="${qrChannel.status==1}">
            <button class="btn" style="vertical-align: inherit;background: green;"
                    onclick="window.location='${ctx}/QRChannel/updateStatus?id=${qrChannel.id}&status=0' ">停止抢单
            </button>
        </c:if>
        <div class="Total">
            <p class="Total_p01">
						<span>
							总价：${not empty sumMoney ? sumMoney : "0.0"}
						</span>
            </p>
            <form class="form-horizontal">
                <div class="primary_div">
                    <ul>
                        <li class="col_li">订单号</li>
                        <li class="col_li1">二维码</li>
                        <li class="col_li2">交易金额</li>
                        <li class="col_li3">支付状态</li>
                        <li class="col_li4">调用时间</li>
                        <li class="col_li5">操作</li>
                    </ul>

                    <c:forEach items="${page.list}" var="trade" varStatus="status">
                        <ul>
                            <li class="col_li">${trade.merchantOrderNo}</li>
                            <li class="col_li1">${trade.qrcode.name}</li>
                            <li class="col_li2">${trade.totalAmount}</li>
                            <li class="col_li3">
                                <c:if test="${trade.tradeState == 0}"><span style="color: #5e35b1">未支付</c:if>
                                        <c:if test="${trade.tradeState == 1}">已支付</c:if>
                                        <c:if test="${trade.tradeState == 2}">客服确认支付</c:if>
                                        <c:if test="${trade.tradeState == 3}">超时支付</c:if>
                            </li>
                            <li class="col_li4">
                                <fmt:formatDate value='${trade.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/>
                            </li>
                            <li class="col_li5">
                                <c:if test="${trade.tradeState==0}">
                                    <a href="${ctx}/trade/updateStatus?id=${trade.id}&status=1"
                                       onclick="return confirm('确认收款吗？', this.href)">确认收款</a>
                                </c:if>
                            </li>
                        </ul>
                    </c:forEach>
                    <%@ include file="../include/pagination.jsp" %>
                </div>
            </form>
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
