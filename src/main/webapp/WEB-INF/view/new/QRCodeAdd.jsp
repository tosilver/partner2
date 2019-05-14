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
                    <h1><strong>二维码</strong>上传</h1>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <!-- /tile header -->

                <!-- tile body -->
                <div class="tile-body">

                    <form class="form-horizontal" role="form" action="${ctx}/qrcode/save" method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="input02" class="col-sm-4 control-label">二维码类型</label>
                            <div class="col-sm-8">
                                <select class="chosen-select chosen-transparent form-control" id="input02" name="type">
                                    <option value="0">支付宝</option>
                                    <option value="1">微信</option>
                                    <option value="2">聚合码</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="fullname" class="col-sm-4 control-label">二维码名称</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="fullname" name="name">
                                <span style="color: black"><strong>命名规则:姓名(类型+金额)</strong> <br>示例:"张三(支付宝+100)"</span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="fullname" class="col-sm-4 control-label">二维码收款金额</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="fullname1" name="money">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="fullname" class="col-sm-4 control-label">上传二维码链接</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="fullname2" name="qrcodeData">
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
    </div>
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

<script src="${pageContext.request.contextPath}/assets/js/vendor/skycons/skycons.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/summernote/summernote.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/chosen/chosen.jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/owl-carousel/owl.carousel.min.js"></script>

<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/vendor/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/jquery.fileupload-ui.js"></script>
<!-- The main application script -->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-file-upload/fileupload-main.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/minimal.min.js"></script>


</body>
</html>
