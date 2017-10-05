<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登陆</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
    <link rel="stylesheet" href="/css/weui.min.css">
    <link rel="stylesheet" href="/css/jquery-weui.css">
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .lg-title {
            height: 140px;
        }

        .lg-title > img {
            width: 80px;
            margin-top: 25px;
        }

        .login-form form p {
            font-size: 14px;
            color: #333;
            margin: 10px 0 25px;
        }

        .login-form form p a {
            color: #333;
        }

        .login-form form p a:nth-of-type(2) {
            color: #FE4870;
            float: right;
        }

        .login-form form p a:nth-of-type(3) {
            float: right;
        }
    </style>
</head>
<body ontouchstart
      style="background:url(/img/login-background.png) no-repeat #f5f5f5;background-size: 100% 36%;height:100vh;">
<!--主体-->
<div class="login-box">
    <div class="lg-title"><img src="/img/login-header.png"/></div>
    <div class="login-form">
        <form action="#">
            <p><%--<a href="login2.html">账号密码登录</a><a href="javascript:;">短信快捷登录</a>--%></p>
            <div class="login-user-name common-div" onclick="$('#username').focus();" id="usernameDiv">
            	<span class="eamil-icon common-icon">
                	<img src="/img/login-user.png"/>
                </span>
                <input type="text" name="username" id="username" value="" placeholder="请输入手机号"/>
            </div>
            <div class="login-user-pasw common-div" onclick="$('#captcha').focus();" id="captchaDiv">
            	<span class="pasw-icon common-icon">
                	<img src="/img/login-yanzhengma.png"/>
                </span>
                <input type="hidden" id="captchaId" name="captchaId"/>
                <input type="text" name="captcha" id="captcha" value="" placeholder="请输入验证码"/>
                <button type="button" id="sendCaptcha" onclick="sendMobileCaptcha();">获取验证码</button>
            </div>
            <a href="javascript:submitForm();" class="login-btn common-div">登录</a>
            <!--<a href="javascript:;" class="login-oth-btn common-div">微信登陆</a>-->
            <!-- <a href="javascript:;" class="login-oth-btn common-div">QQ登陆</a>-->
            <%--<p><a href="psd_chage.html">忘记密码?</a><a></a><a href="regist.html">免费注册</a></p>--%>
        </form>
    </div>
    <div class="forgets">
        <p>————&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;快速登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;————</p>
        <a href="javascript:;"><img src="/img/login-weixin.png"/></a>
    </div>
</div>
<script src="/scripts/jquery-2.1.4.js"></script>
<script src="/scripts/fastclick.js"></script>
<script src="/scripts/layer.js"></script>
<script type="text/javascript" src="/scripts/jquery.Spinner.js"></script>
<script src="/scripts/jquery-weui.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });

    function submitForm() {
        var userName = $("#username").val();
        if($.trim(userName).length == 0)
        {
            layer.open({
                content: '请输入正确的手机号'
                , skin: 'msg'
                , time: 1, //2秒后自动关闭
                success: function () {
                    $("#usernameDiv").click();
                }
            });
            return;
        }
        var captcha = $("#captcha").val();
        if($.trim(captcha).length == 0)
        {
            layer.open({
                content: '请输入验证码'
                , skin: 'msg'
                , time: 1, //2秒后自动关闭
                success: function () {
                    $("#captchaDiv").click();
                }
            });
            return;
        }
        $.ajax({
            url: "/userBaseAjax/logon.do",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            type: "POST",
            dataType: "json",
            traditional: true,
            data: {
                mobile: userName,
                yzmCode:captcha,
                captchaId:$("#captchaId").val()
            },
            success: function (result) {
                if(result.success)
                {
                    layer.open({
                        content: '登录成功'
                        , skin: 'msg'
                        , time: 2, //1秒后自动关闭
                        success: function () {
                            if(result.origUrl != undefined && result.origUrl.length > 0)
                            {
                                location.href = result.origUrl;
                            }
                            else
                            {
                                location.href = '/common/index.do';
                            }
                        }
                    });
                }
                else
                {
                    layer.open({content: result.errMsg, skin: 'msg', time: 1});
                }
            }
        });
    }

    function setCookies(logonId) {
        var Days = 60;
        var exp = new Date();
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = "_USER_COOKIE_ID_=" + logonId + ";expires=" + exp.toGMTString();
    }

    function sendMobileCaptcha() {
        var username = $("#username").val();
        var match = /^((\(\d{3}\))|(\d{3}\-))?13\d{9}|14[57]\d{8}|15\d{9}|17\d{9}|18\d{9}$/;
        if (username.length != 11 || !username.match(match)) {
            layer.open({
                content: '请输入正确的手机号'
                , skin: 'msg'
                , time: 2, //2秒后自动关闭
                success: function () {
                    $("#usernameDiv").click();
                }
            });
            return;
        }
        $.ajax({
            url: "/commonAjax/sendSmsCaptcha.do",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            type: "POST",
            dataType: "json",
            traditional: true,
            data: {
                mobile: username
            },
            success: function (result) {
                if (result.success) {
                    layer.open({
                        content: '登录成功'
                        , skin: 'msg'
                        , time: 1, //1秒后自动关闭
                        success: function () {
                            $("#captchaDiv").click();
                        }
                    });
                    $("#captchaId").val(result["id"]);

                    $("#sendCaptcha").attr("onclick", "");
                    $("#sendCaptcha").html("60秒后重发");
                    var i = 59;
                    var intervalid = setInterval(function () {
                        if (i == 0) {
                            $("#sendCaptcha").html("重新发送");
                            $("#sendCaptcha").attr("onclick", "sendMobileCaptcha();");
                            clearInterval(intervalid);
                        } else {
                            $("#sendCaptcha").html(String(i) + "秒后重发");
                            i--;
                        }
                    }, 1000);
                } else {
                    layer.open({content: result.errMsg, skin: 'msg', time: 1});
                }
            },
            error: function (data) {
                console.log("调用[sendSmsCaptcha]发生异常：" + data.responseText);
            }
        });
    }
</script>
</body>
</html>
