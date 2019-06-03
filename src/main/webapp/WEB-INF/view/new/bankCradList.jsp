<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<html>
<head>
    <title>宝芝琳</title>
    <meta name="apple-mobile-web-app-title" content="宝芝琳商户平台"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8"/>

<%--
    <link rel="icon" type="image/ico" href="http://tattek.com/minimal/assets/images/favicon.ico"/>
--%>
    <!-- Bootstrap -->
    <%--<link href="${pageContext.request.contextPath}/assets/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">

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

    <link href="${pageContext.request.contextPath}/assets/css/minimal.css" rel="stylesheet">--%>

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
    <div class="primary">
        <%--<h1>银行卡管理</h1>
        <span class="code">类型</span>
        <select class="form-control control">
            <option value="">请选择</option>
            <option value="">中国银行</option>
            <option value="">工商银行</option>
            <option value="">招商银行</option>
        </select>
        <span class="code">卡号</span>
        <input type="text" class="inp"/>
        <button class="btn" style="vertical-align: inherit;">搜索</button>--%>
        <%--<button class="btn" style="vertical-align: inherit;background: green;"onclick="window.location='${ctx}/bankCradAdd/add'">添加银行卡</button>--%>
        <div class="Total">
            <button class="btn" style="vertical-align: inherit;background: green;"onclick="window.location='${ctx}/bankCradAdd/add'">添加银行卡</button>
            <div class="">
                <ul>
                    <li style="width:5%;">序号</li>
                    <li  style="width:16.5%;">代理ID</li>
                    <li  style="width:6%;">账号类型</li>
                    <li  style="width:7%;">银行名称</li>
                    <li   style="width:18.5%;">银行卡号</li>
                    <li  style="width:8%;">银行卡编号</li>
                    <li  style="width:6%;">真实姓名</li>
                    <li  style="width:9%;">联系电话</li>
                    <li  style="width:12%;">添加时间</li>
                    <li  style="width:5%;">状态</li>
                    <li  style="width:5%;">操作</li>

                </ul>
                <c:forEach items="${page.list}" var="bankCradAdd" varStatus="status">
                    <ul>
                        <li  style="width:5%;">${status.index + 1}</li>
                        <li   style="width:16.5%;">${bankCradAdd.merchantId}</li>
                        <li  style="width:6%;"><c:if test="${bankCradAdd.accountType == 0}">银行卡</c:if>
                            <c:if test="${bankCradAdd.accountType == 1}">支付宝</c:if>
                            <c:if test="${bankCradAdd.accountType == 2}">微信</c:if>
                        </li>
                        <li  style="width:7%;">${bankCradAdd.bankName}</li>
                        <li  style="width:18.5%;">${bankCradAdd.cardNo}</li>
                        <li  style="width:8%;">${bankCradAdd.bankMark}</li>
                        <li  style="width:6%;">${bankCradAdd.customerName}</li>
                        <li  style="width:9%;">${bankCradAdd.phoneNum}</li>
                        <li  style="width:12%;"><fmt:formatDate value='${bankCradAdd.createTime}' pattern='yyyy-MM-dd HH:mm:ss'/></li>
                        <li  style="width:5%;">${bankCradAdd.status== 0 ? "<font color='#FF0000'>停用</font>":"可用" }</li>
                        <li  style="width:5%;"> <c:if test="${bankCradAdd.status==1}">
                            <a href="${ctx}/bankCradAdd/updateStatus?id=${bankCradAdd.id}&status=0"
                               onclick="return confirm('确认要停用该银行卡吗？', this.href)">停用</a>
                        </c:if>
                            <c:if test="${bankCradAdd.status==0}">
                                <a href="${ctx}/bankCradAdd/updateStatus?id=${bankCradAdd.id}&status=1"
                                   onclick="return confirm('确认要启用该银行卡吗？', this.href)">启用</a>
                            </c:if></li>
                    </ul>
                </c:forEach>


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
