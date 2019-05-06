<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<html>
<head>
    <title>宝芝琳</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8" />

    <link rel="icon" type="image/ico" href="http://tattek.com/minimal/assets/images/favicon.ico" />
    <!-- Bootstrap -->
    <link href="${ctxAssets}/css/vendor/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctxAssets}/css/vendor/bootstrap-checkbox.css">

    <link href="${ctxAssets}/css/minimal.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bg-1">


<!-- Wrap all page content here -->
<div id="wrap">
    <!-- Make page fluid -->
    <div class="row">
        <!-- Page content -->
        <div id="content" class="col-md-12 full-page login">


            <div class="inside-block">
                <img src="${ctxAssets}/images/logo-big.png" alt class="logo">
                <h1><strong>Welcome</strong> TO </h1>
                <h1>宝 芝 琳</h1>

                <form id="form-signin" class="form-signin" action="login" method="post" target="_parent" >
                    <fieldset>
                    <section>
                        <div class="input-group">
                            <input type="text" class="form-control" name="username" value="${username}" placeholder="Username">
                            <div class="input-group-addon"><i class="fa fa-user"></i></div>
                        </div>
                        <div class="input-group">
                            <input type="password" class="form-control" name="password" placeholder="Password">
                            <div class="input-group-addon"><i class="fa fa-key"></i></div>
                        </div>
                    </section>
                    <section class="log-in">
                        <button  type="submit" class="btn btn-greensea">登录</button>
                    </section>
                    </fieldset>
                    <div class="input-group">
                        <div class="input-group-addon" style="text-align: center;color: red">${message}</div>
                    </div>
                </form>
            </div>


        </div>
        <!-- /Page content -->
    </div>
</div>
<!-- Wrap all page content end -->
</body>
</html>