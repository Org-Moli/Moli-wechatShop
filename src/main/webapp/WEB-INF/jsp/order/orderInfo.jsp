<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单详情</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
    <link rel="stylesheet" href="/css/weui.min.css">
    <link rel="stylesheet" href="/css/jquery-weui.css">
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .weui-media-box__desc > span {
            color: #333;
            float: none;
        }
    </style>
</head>
<body ontouchstart>
<!--主体-->
<!--<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">订单详情</div>
</header>-->
<div class="weui-content">
    <div class="wy-media-box weui-media-box_text address-select">
        <div class="weui-media-box_appmsg">
            <div class="weui-media-box__hd proinfo-txt-l" style="width:20px;"><span class="promotion-label-tit"><img
                    src="images/icon_nav_city.png"/></span></div>
            <div class="weui-media-box__bd">
                <a href="/userBase/addressList.do" class="weui-cell_access" style="line-height: 30px;">
                    <c:choose>
                        <c:when test="${not empty deliveryAddress}">
                        <!--有收货地址-->
                        <h4 class="address-name"><span>收货人:${deliveryAddress.realname}</span><span style="float: right;">${deliveryAddress.telphone}</span></h4>
                        <div class="address-txt">收货地址:${deliveryAddress.city}${deliveryAddress.area}${deliveryAddress.street}</div>
                        </c:when>
                        <c:otherwise>
                        <!--无收货地址-->
                        添加新的收货地址
                        </c:otherwise>
                    </c:choose>
                </a>
            </div>
            <div class="weui-media-box__hd proinfo-txt-l" style="width:16px;">
                <div class="weui-cell_access"><span class="weui-cell__ft"></span></div>
            </div>
        </div>
    </div>
    <div class="wy-media-box weui-media-box_text">
        <div class="weui-media-box__bd">
            <c:set var="totalMoney" value="0"></c:set>
            <c:forEach items="${shopPingCartList}" var="shop">
            <div class="weui-media-box_appmsg ord-pro-list">
                <div class="weui-media-box__hd">
                    <a href="pro_info.html"><img class="weui-media-box__thumb" src="${shop.picture_url}" alt=""></a>
                </div>
                <div class="weui-media-box__bd">
                    <h1 class="weui-media-box__desc"><a href="pro_info.html" class="ord-pro-link">${shop.product_name}</a>
                    </h1>
                    <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
                    <div class="clear mg-t-10">
                        <div class="wy-pro-pri fl"><em class="num font-15"><fmt:formatNumber value="${shop.price}"
                                                                                             type="currency"/></em></div>
                        <div class="pro-amount fr">
                            <div id="spinner-amount" class="Spinner">数量x${shop.number}</div>
                        </div>
                    </div>
                </div>
            </div>
            <c:set var="totalMoney" value="${totalMoney + shop.price * shop.number}"></c:set>
            </c:forEach>
        </div>
    </div>
    <div class="weui-panel">
        <div class="weui-panel__bd">
            <div class="weui-media-box weui-media-box_small-appmsg">
                <div class="weui-cells">
                    <%--<a class="weui-cell weui-cell_access" href="coupon.html" style="margin-bottom: 10px;">
                        <div class="weui-cell__bd weui-cell_primary">
                            <p class="font-14"><span class="mg-r-10">优惠券</span><span class="fr">无可用</span></p>
                        </div>
                        <span class="weui-cell__ft"></span>
                    </a>--%>
                    <div class="weui-cell weui-cell_access" href="javascript:;">
                        <div class="weui-cell__bd weui-cell_primary">
                            <p class="font-14"><span class="mg-r-10">商品金额</span><span class="fr"><fmt:formatNumber value="${totalMoney}"
                                                                                                                   type="currency"/></span></p>
                        </div>
                    </div>
                    <%--<a class="weui-cell weui-cell_access" href="javascript:;">
                        <div class="weui-cell__bd weui-cell_primary">
                            <p class="font-14"><span class="mg-r-10">减免</span><span class="fr">￥0.00</span></p>
                        </div>
                    </a>--%>
                    <a class="weui-cell weui-cell_access" href="coupon.html">
                        <div class="weui-cell__bd weui-cell_primary">
                            <p class="font-14"><span class="mg-r-10">运费</span><span class="fr">￥5.00</span></p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="wy-media-box weui-media-box_text"
         style="width:100%;position: fixed;bottom: 0;height: 45px;padding:0 0 0 10px;margin:0;">
        <div class="mg10-0 t-c">实付金额：<span class="wy-pro-pri mg-tb-5"><fmt:formatNumber value="${totalMoney + 5}"
                                                                                        type="currency"/></span></div>
        <div class="mg10-0"><a href="shopcart.html" class="weui-btn weui-btn_primary">提交订单</a></div>
    </div>
</div>
<script src="/scripts/jquery-2.1.4.js"></script>
<script src="/scripts/fastclick.js"></script>
<script type="text/javascript" src="/scripts/jquery.Spinner.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
<script type="text/javascript">
    /*$(function(){
     $(".Spinner").Spinner({value:1, len:3, max:999});
     });*/
</script>
<script src="/scripts/jquery-weui.js"></script>


</body>
</html>
