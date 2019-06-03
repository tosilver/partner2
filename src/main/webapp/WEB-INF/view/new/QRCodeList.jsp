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
        <!-- /page header -->

        <!-- content main container -->
        <div class="main">
            <!-- tile -->
            <section class="tile color transparent-white">
                <input type="hidden" name="pageIndex" value="${page.pageIndex}"/>
                <input type="hidden" name="pageSize" value="${page.pageSize}"/>

                <!-- tile header -->
                <!-- /tile header -->
                <!-- tile body -->
                <div class="tile-body no-vpadding">
                    <h2>二维码管理</h2>
                    <div class="account">
                        <p class="account_p">选择收款账号</p>
                        <a><i></i></a>
                        <span class="account_span"><shiro:principal/></span>
                        <span class="account_span01">(共:${page.totalCount}个二维码)</span>
                    </div>
                    <div>

                    </div>


                    <button type="button" class="btn btn-primary btn-lg margin-bottom-20"
                            onclick="window.location='${ctx}/qrcode/add' "style="width: 195px;background-color: #0f9d58">新增二维码
                    </button>


                    <form id="searchForm" action="${ctx}/qrcode/list" method="get">

                        <input type="hidden" name="pageIndex" value="${page.pageIndex}"/>
                        <input type="hidden" name="pageSize" value="${page.pageSize}"/>

                        <span class="code">二维码类型：</span>
                        <select class="form-control" name="codeType">
                            <option value="">请选择类型</option>
                            <option value="0" <c:if test="${0 eq page.params.codeType}">selected</c:if>>支付宝</option>
                            <option value="1" <c:if test="${1 eq page.params.codeType}">selected</c:if>>微信</option>
                            <option value="2" <c:if test="${2 eq page.params.codeType}">selected</c:if>>聚合码</option>
                        </select>

                        <button type="submit" class="btn btn-primary btn-lg margin-bottom-10" style="width: 65px">
                            <font color="#f0f8ff">搜索</font>
                        </button>
                    </form>



                    <form class="form-horizontal">

                        <%--<input type="hidden" name="pageIndex" value="${page.pageIndex}"/>
                        <input type="hidden" name="pageSize" value="${page.pageSize}"/>--%>

                        <table class="table <%--table-custom table-sortable--%>" style="width: 96%;margin: 0 auto;border: 1px solid silver;">
                            <thead>
                            <tr>
                                <th class="th th01">序号</th>
                                <th class="th th01">名称</th>
                                <th class="th th01">二维码类型</th>
                                <th class="th th01">状态</th>
                                <th class="th th01">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.list}" var="qrcode" varStatus="status">
                                <tr>
                                    <td class="th" style="vertical-align: inherit;">${status.index + 1}</td>
                                    <td class="th" style="vertical-align: inherit;">${qrcode.name}</td>
                                    <td class="th" style="vertical-align: inherit;">
                                        <c:if test="${qrcode.codeType == 0}">支付宝</c:if>
                                        <c:if test="${qrcode.codeType == 1}">微信</c:if>
                                        <c:if test="${qrcode.codeType == 2}"><span style="color:red">聚合码</span></c:if>
                                    </td>
                                    <td class="th" style="vertical-align: inherit;">${qrcode.status== 0 ? "<font color='#FF0000'>停用</font>":"可用" }</td>
                                    <td class="th" style="vertical-align: inherit;">
                                        <c:if test="${qrcode.status==1}">
                                            <button>
                                                <a href="${ctx}/qrcode/updateStatus?id=${qrcode.id}&status=0"
                                                   onclick="return confirm('确认要停用该收款码吗？', this.href)">
                                                    停用
                                                </a>
                                            </button>

                                        </c:if>

                                        <c:if test="${qrcode.status==0}">
                                            <button>
                                                <a href="${ctx}/qrcode/updateStatus?id=${qrcode.id}&status=1"
                                                   onclick="return confirm('确认要启用该收款码吗？', this.href)">启用</a>
                                            </button>
                                        </c:if>
                                        <c:if test="${qrcode.status==0}">
                                            <button>
                                                <a href="${ctx}/qrcode/form?id=${qrcode.id}">修改</a>
                                            </button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </form>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <%@ include file="../include/pagination.jsp" %>
                </div>
                <!-- /tile body -->
            </section>
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


<script>
    function aaa() {
        var codeType = document.getElementsByName("codeType")[0];
        console.log(codeType,codeType.value)

    }
</script>
<script>
    $(function () {
        $('#queding').click(function () {
            // console.log(document.getElementById("consumeId").value)
            // console.log(document.getElementById("moneys").value)
            $.ajax({
                type: "get",
                url: "${ctx}/consume/updateStatus",
                data: {
                    id: document.getElementById("consumeId").value,
                    status: 2,
                    amount: document.getElementById("moneys").value
                },
                // dataType: "json",
                success: function (data) {
                    console.log(data)
                    window.location.reload();
                    // location.reload([bForceGet])
                }
            });
        });



    });
</script>

</body>
</html>
