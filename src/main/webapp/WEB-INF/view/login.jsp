<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link rel="stylesheet" href="${ctx}/assets/proxy/css/registration.css" type="text/css" media="all">


</head>
<body>
<div class="container w3layouts agileits">
    <div class="login w3layouts agileits">
        <h2>登 录</h2>
        <form action="login" method="post">
            <input type="text" Name="username" placeholder="用户名" required="">
            <input type="password" Name="password" placeholder="密码" required="">
            <input type="submit" value="登 录" class="lin001">
            <input onclick="window.location.href='${ctx}/register'" value="注 册" class="lin001">
        </form>
        <%--<ul class="tick w3layouts agileits">
            <li>
                <input type="checkbox" id="brand1" value="">
                <label for="brand1"><span></span>记住我</label>
            </li>
        </ul>
        <div class="send-button w3layouts agileits">
            <form>
                <div class="password" style="opacity: 0;">
                    <a href="#">记住密码?</a>
                    <a href="#">修改密码？</a>
                </div>
            </form>
        </div>--%>

        <%--<div class="social-icons w3layouts agileits">
            <p>- 其他方式登录 -</p>
            <ul>
                <li class="qq"><a href="#">
                    <span class="icons w3layouts agileits"></span>
                    <span class="text w3layouts agileits">QQ</span></a></li>
                <li class="weixin w3ls"><a href="#">
                    <span class="icons w3layouts"></span>
                    <span class="text w3layouts agileits">微信</span></a></li>
                <li class="weibo aits"><a href="#">
                    <span class="icons agileits"></span>
                    <span class="text w3layouts agileits">微博</span></a></li>
                <div class="clear"> </div>
            </ul>
        </div>--%>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
</div>
</body>
</html>
