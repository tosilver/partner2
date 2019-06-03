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
<%--    <div id="content" class="col-md-12">
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
                <h1><strong>新增</strong> 银行卡</h1>
                <div class="controls">
                    <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                    <a href="#" class="remove"><i class="fa fa-times"></i></a>
                </div>
            </div>
            <!-- /tile header -->

            <!-- tile body -->
            <div class="tile-body">

                <form class="form-horizontal" role="form" action="${ctx}/bankCradAdd/save" method="post" parsley-validate id="numbervalidations">

                <div class="form-group">
                    <label for="input02" class="col-sm-4 control-label">账户类型</label>
                    <div class="col-sm-8">
                        <select class="chosen-select chosen-transparent form-control" id="input02" name="accountType">
                            <option value="0">银行卡</option>
                            <option value="1">支付宝</option>
                            <option value="2">微信</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="input03" class="col-sm-4 control-label">银行名称</label>
                    <div class="col-sm-8">

                        <input type="text" class="form-control" id="input03" name="bankName" parsley-trigger="change" parsley-required="true" parsley-minlength="6"
                        parsley-validation-minlength="1"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="input04" class="col-sm-4 control-label">银行卡号</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="input04" name="cardNo" parsley-trigger="change" parsley-required="true" parsley-minlength="12"
                        parsley-validation-minlength="1">
                    </div>
                </div>

                    <div class="form-group">
                        <label for="input05" class="col-sm-4 control-label">银行卡编号</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="input05" name="bankMark" parsley-trigger="change" parsley-required="true" parsley-minlength="3"
                                   parsley-validation-minlength="1">
                        </div>
                    </div>

                <div class="form-group">
                    <label for="input06" class="col-sm-4 control-label">真实姓名</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="input06" name="customerName" parsley-trigger="change" parsley-required="true" parsley-minlength="2"
                        parsley-validation-minlength="1">
                    </div>
                </div>

                <div class="form-group">
                    <label for="input07" class="col-sm-4 control-label">联系电话</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="input07" name="phoneNum" parsley-trigger="change" parsley-required="true" parsley-minlength="11"
                        parsley-validation-minlength="1">
                    </div>
                </div>

                <div class="form-group form-footer">
                    <div class="col-sm-offset-4 col-sm-8">
                        <button type="submit" class="btn btn-primary">提交</button>
                        <button type="reset" class="btn btn-default" onclick="history.go(-1)">返回</button>
                    </div>
                </div>

            </form>

            </div>
            <!-- /tile body -->
            </section>
        <!-- /tile -->
        </div>
    </div>--%>
    <!--新增银行卡-->
    <div class="primary">
            <h1>新增会员</h1>
                  <form action="${ctx}/admin/create" method="post" class="col_form">
                      <div class="form_div">
                          <label>用户名</label>
                          <input type="text" class="add" name="username"/>
                      </div>
                      <div class="form_div">
                          <label>密码</label>
                          <input type="text" name="password" class="add"/>
                      </div>
                      <div class="form_div">
                          <label>联系电话</label>
                          <input type="text" name="phone" class="add"/>
                      </div>
                      <div class="form_div"><button type="submit">提交</button><button type="button" id="select" onclick="javascript:history.back(1);">返回</button></div>
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

<script src="${pageContext.request.contextPath}/assets/js/vendor/parsley/parsley.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/minimal.min.js"></script>

<script>

    $(function () {

        //chosen select input
        $(".chosen-select").chosen({disable_search_threshold: 10});

    })

</script>

</body>
</html>