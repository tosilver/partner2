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
    <%--<div id="content" class="col-md-12">
        <!-- page header -->
        <div class="pageheader">

            <h2><i class="fa fa-tachometer"></i> Dashboard
                <span>// Place subtitle here...</span></h2>
        </div>
        <!-- /page header -->

        <div class="main">
            <!-- tile -->
            <section class="tile color transparent-black">

                <!-- tile header -->
                <div class="tile-header">
                    <h1><strong>代理</strong> ${empty agency.id?'新增':'修改'}</h1>
                    <div class="controls">
                        <a href="#" class="refresh"><i class="fa fa-refresh"></i></a>
                        <a href="#" class="remove"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <!-- /tile header -->

                <!-- tile body -->
                <div class="tile-body">

                    <form class="form-horizontal" role="form" action="${ctx}/Agency/save" method="post" enctype="multipart/form-data">

                        <div class="form-group transparent-editor">
                            <label class="col-sm-4 control-label">一级代理</label>
                            <div class="col-sm-8">
                                <div class="form-control" name="greatGrandfatherId">${empty agency.id? greatGrandfatherId:agency.greatGrandfatherId}</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-4 control-label">一级代理贡献</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="greatGrandfatherContribution" value="${agency.greatGrandfatherContribution}">
                            </div>
                        </div>
                        <div class="form-group transparent-editor">
                            <label class="col-sm-4 control-label">二级代理</label>
                            <div class="col-sm-8">
                                <div class="form-control" name="grandfatherId">${empty agency.id? grandfatherId:agency.grandfatherId}</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-4 control-label">二级代理贡献</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="grandfatherContribution" value="${agency.grandfatherContribution}">
                            </div>
                        </div>
                        <div class="form-group transparent-editor">
                            <label class="col-sm-4 control-label">三级代理</label>
                            <div class="col-sm-8">
                                <div class="form-control" name="superiorId">${empty agency.id?superiorId:agency.superiorId}</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-4 control-label">三级代理贡献</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="superiorContribution" value="${agency.superiorContribution}">
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
        </div>--%>


    <div class="primary">
        <h1>代理${empty agency.id?'新增':'修改'}</h1>
        <form action="${ctx}/Agency/save" method="post" class="col_form">
            <div class="form_div">
                <label>代理名称</label>
                <input type="text" class="add" name="company" value="${agency.company}">
            </div>
            <br/>
            <div class="form_div">
                <label>会员名称</label>
                <select name="adminId">
                    <option value=" ">选择会员:手机号码</option>
                    <c:forEach items="#{adminList}" var="admin">
                        <option value="${admin.id}">${admin.username}:${admin.phone}</option>
                    </c:forEach>
                </select>
            </div>
            <br/>
            <div class="form_div">
                <label>一级代理</label>
                <input type="hidden" name="greatGrandfatherId" value="${greatGrandfather.id}"/>
                <input type="text" class="add" value="${empty agency.id? greatGrandfather.company:agency.greatGrandfatherId}" readonly="readonly"/>
                (空白时代表此级无代理,不需理会)
            </div>
            <br/>
            <div class="form_div">
                <label>一级代理费率</label>
                <input type="text" class="add" name="greatGrandfatherContribution" value="${agency.greatGrandfatherContribution}"/>
            </div>
            <br/>
            <div class="form_div">
                <label>二级代理</label>
                <input type="hidden" name="grandfatherId" value="${grandfather.id}"/>
                <input type="text" class="add" value="${empty agency.id? grandfather.company:agency.grandfatherId}" readonly="readonly"/>
                (空白时代表此级无代理,不需理会)
            </div>
            <br/>
            <div class="form_div">
                <label>二级代理费率</label>
                <input type="text" class="add" name="grandfatherContribution" value="${agency.grandfatherContribution}"/>
            </div>
            <br/>
            <div class="form_div">
                <label>三级代理</label>
                <input type="hidden" name="superiorId" value="${superior.id}"/>
                <input type="text" class="add"  value="${empty agency.id?superior.company:agency.superiorId}" readonly="readonly"/>
                (空白时代表此级无代理,不需理会)
            </div>
            <br/>
            <div class="form_div">
                <label>三级代理费率</label>
                <input type="text" class="add" name="superiorContribution" value="${agency.superiorContribution}"/>
            </div>
            <br/>
            <div class="form_div">
                <button type="submit">提交</button>
                <button disabled="disabled"  >返回</button>
            </div>
        </form>
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
