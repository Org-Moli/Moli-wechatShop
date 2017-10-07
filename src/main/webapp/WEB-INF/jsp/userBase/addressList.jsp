<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>收货地址</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
    <link rel="stylesheet" href="/css/weui.min.css">
    <link rel="stylesheet" href="/css/jquery-weui.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body ontouchstart>
<!--主体-->
<!--<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">地址管理</div>
</header>-->
<div class="weui-content">
    <div class="weui-panel address-box">
        <c:forEach items="${deliveryAddressList}" var="address">
        <div class="weui-panel__bd">
            <div class="weui-media-box weui-media-box_text address-list-box">
                <h4 class="weui-media-box__title"><span>${address.realname}</span><span>${address.telphone}</span></h4>
                <p class="weui-media-box__desc address-txt" style="color:#333;line-height: 20px;">
                    ${address.city}${address.area}${address.street}</p>
            </div>
            <div style="position: relative;border-top: 1px solid #e4e4e4;height: 34px;">
                <c:if test="${address.is_default_address}">
                <span class="default-add">默认地址</span>
                </c:if>
                <a href="address_edit.html" class="address-edit">
                    <img src="/img/bianji-icon.png"/>编辑</a>
            </div>
        </div>
        </c:forEach>
    </div>
    <div class="weui-btn-area" style="margin: 0;position: fixed;width: 100%;bottom: 0;">
        <a class="weui-btn weui-btn_primary" href="address_edit.html" id="showTooltips">添加收货地址</a>
    </div>
</div>

<script src="/scripts/jquery-2.1.4.js"></script>
<script src="/scripts/fastclick.js"></script>
<script type="text/javascript" src="/scripts/jquery.Spinner.js"></script>
<script src="/scripts/jquery-weui.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>
