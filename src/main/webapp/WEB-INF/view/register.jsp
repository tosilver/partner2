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
    <script type="text/javascript" src="${ctx}/assets/js/jquery.js"></script>

    <script type="text/javascript">
        function checkname(){
            var f=false;
            //javascript所有的变量都是以var定义的
            //javascript的变量属于弱类型
            //获取用户输入的用户名
            var name = document.getElementById("username").value;
            //去除字符串两端空格
            name=name.trim();
            //判断是否为空
            if(name==""){
                document.getElementById("username_span").innerHTML="用户名不能为空";
            }else if(name.length<5||name.length>16){
                document.getElementById("username_span").innerHTML="用户名的长度为5-16位";
            }else{
                document.getElementById("username_span").innerHTML="";
                //校验用户名是否存在
                //使用ajax异步校验用户名
                $.ajax({
                    url:"/register/findBrandByName",
                    type:"get",
                    data:{"username":name},//json数据格式的用户名从jsp传递给controller
                    dataType:"json",
                    async:false,//让ajax执行代码顺序同步
                    success:function(data){
                        if(data.msg=="false"){
                            document.getElementById("username_span").innerHTML="<span style='color:red'>用户名已经存在</span>";
                        }else{
                            document.getElementById("username_span").innerHTML="<span style='color:red'>用户名可用</span>";
                            f=true;
                        }
                    }
                });

            }
            return f;
        }
        function checkname(){
            var f=false;
            //javascript所有的变量都是以var定义的
            //javascript的变量属于弱类型
            //获取用户输入的用户名
            var code = document.getElementById("invitationCode").value;
            //去除字符串两端空格
            code=code.trim();
            //判断是否为空
            if(code==""){
                document.getElementById("codeInfo").innerHTML="验证不能为空";
            }else if(name.length<5||name.length>16){
                document.getElementById("codeInfo").innerHTML="验证码的长度为6位";
            }else{
                document.getElementById("codeInfo").innerHTML="";
                //校验用户名是否存在
                //使用ajax异步校验用户名
                $.ajax({
                    url:"/register/findByCode",
                    type:"get",
                    data:{"invitationCode":code},//json数据格式的用户名从jsp传递给controller
                    dataType:"json",
                    async:false,//让ajax执行代码顺序同步
                    success:function(data){
                        if(data.msg=="false"){
                            document.getElementById("codeInfo").innerHTML="<span style='color:red'>验证码不存在</span>";
                        }else{
                            document.getElementById("codeInfo").innerHTML="<span style='color:red'>验证码可用</span>";
                            f=true;
                        }
                    }
                });

            }
            return f;
        }
    </script>

</head>
<body>
<div class="container w3layouts agileits">
    <div class="login w3layouts agileits">
        <h2>注 册</h2>
        <form action="/register" method="post">
            <input type="text" Name="username" id="username"  placeholder="请输入用户名" required onblur="checkname()">
            <span id="username_span"></span>
            <input type="password" Name="password" placeholder="请输入密码" required="">
            <input type="text" Name="invitationCode" id="invitationCode" placeholder="请输入邀请码" required onblur="checkcode()">
            <span id="codeInfo"></span>
            <input type="submit" value="注册" class="lin001">
            <input  value="返回" class="lin001">
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
