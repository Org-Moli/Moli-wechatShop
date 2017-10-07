<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>购物车</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="Write an awesome description for your new site here. You can edit this line in _config.yml. It will appear in your document head meta (for Google search results) and in your feed.xml site description.
">
    <link rel="stylesheet" href="/css/weui.min.css">
    <link rel="stylesheet" href="/css/jquery-weui.css">
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .weui-tabbar, .cart-foot-check-item {
            background: #fff;
        }

        .promotion-foot-menu-label {
            text-align: center;
        }

        .weui-media-box__desc > span {
            color: #999;
            float: none;
        }

        .wy-pro-pri span {
            font-size: 16px;
        }

        .wy-pro-pri small {
            font-size: 11px;
        }
    </style>
</head>
<body ontouchstart>
<!--主体-->
<!--<header class="wy-header">
  <div class="wy-header-icon-back"><span></span></div>
  <div class="wy-header-title">购物车</div>
</header>-->
<div class="weui-content">
    <c:forEach items="${shopPingCartList}" var="shop" varStatus="st">
        <div class="weui-panel weui-panel_access">
            <!--<div class="weui-panel__hd"><span>江苏蓝之蓝旗舰店</span></div>-->
            <div class="weui-panel__bd" id="panel_pd${st.count}">
                <input type="hidden" id="price_${st.count}" value="${shop.price}"/>
                <input type="hidden" id="product_id_${st.count}" value="${shop.id}"/>
                <div class="weui-media-box_appmsg pd-10">
                    <div class="weui-media-box__hd check-w weui-cells_checkbox">
                        <label class="weui-check__label" for="cart-pto${st.count}">
                            <div class="weui-cell__hd cat-check">
                                <input type="checkbox" class="weui-check" name="cartpro" id="cart-pto${st.count}"
                                       onclick="settleMoney();">
                                <i class="weui-icon-checked"></i>
                            </div>
                        </label>
                    </div>
                    <div class="weui-media-box__hd">
                        <a href="pro_info.html"><img class="weui-media-box__thumb" src="${shop.picture_url}" alt=""></a>
                    </div>
                    <div class="weui-media-box__bd">
                        <h1 class="weui-media-box__desc" style="overflow:visible;display: block;">
                            <a href="pro_info.html" class="ord-pro-link">${shop.product_name}</a>
                            <a href="javascript:;" index="${st.count}" class="wy-dele"></a></h1>
                        <p class="weui-media-box__desc">规格：<span>红色</span>，<span>23</span></p>
                        <div class="clear mg-t-10">
                            <div class="wy-pro-pri fl">
                                <span class="num font-15"><fmt:formatNumber value="${shop.price}"
                                                                            type="currency"/></span>&nbsp;&nbsp;
                                <small style="text-decoration: line-through;color:#666;"><fmt:formatNumber
                                        value="${shop.market_price}" type="currency"/></small>
                            </div>
                            <div class="pro-amount fr">
                                <div class="Spinner" amount="1" defaultNum="${shop.number}" cartId="${shop.id}"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<form action="/order/toOrder.do" id="orderForm" method="post">
    <input name="ids" id="cartIds" type="hidden"/>
</form>
<!--底部导航-->
<div class="foot-black"></div>
<div class="weui-tabbar wy-foot-menu">
    <div class="npd cart-foot-check-item weui-cells_checkbox allselect">
        <label class="weui-cell allsec-well weui-check__label" for="all">
            <div class="weui-cell__hd">
                <input type="checkbox" class="weui-check" name="all-sec" id="all">
                <i class="weui-icon-checked"></i>
            </div>
            <div class="weui-cell__bd">
                <p class="font-14">全选</p>
            </div>
        </label>
    </div>
    <div class="weui-tabbar__item  npd">
        <p class="cart-total-txt">合计：<i></i><em class="num font-16" id="zong1">¥0.00</em></p>
    </div>
    <a href="javascript:toOrder();" class="red-color npd w-90 t-c">
        <p class="promotion-foot-menu-label">去结算</p>
    </a>
</div>

<script src="/scripts/jquery-2.1.4.js"></script>
<script src="/scripts/fastclick.js"></script>
<script type="text/javascript" src="/scripts/jquery.Spinner.js"></script>
<script src="/scripts/jquery-weui.js"></script>
<script src="/scripts/common.js"></script>
<script src="/scripts/layer.js"></script>
<!---全选按钮-->

<script type="text/javascript">
    var initFlag = true;
    $(document).ready(function () {
        $(".Spinner").Spinner({value: 1, len: 3, max: 999});
        FastClick.attach(document.body);

        $(".allselect").click(function () {
            if ($(this).find("input[name=all-sec]").prop("checked")) {
                $("input[name=cartpro]").each(function () {
                    $(this).prop("checked", true);
                });
            }
            else {
                $("input[name=cartpro]").each(function () {
                    if ($(this).prop("checked")) {
                        $(this).prop("checked", false);
                    } else {
                        //$(this).prop("checked", true);
                    }
                });
            }
            settleMoney();
        });
    });

    function saveOrderInfo(id,num) {
        $.ajax({
            url: "/shop/updateCart.do",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            type: "POST",
            dataType: "json",
            traditional: true,
            data: {
                id:id,
                num:num
            },
            success: function (result) {
                if (result.success) {
                    $("#panel_pd" + index).remove();
                }
            }
        });
    }

    function toOrder() {
        var idsArr = [];
        $("input[name='cartpro']:checked").each(function () {
            var _index = $(this).attr("id").replace("cart-pto", "");
            var _ids = $("#product_id_" + _index).val();
            idsArr.push(_ids);
        });
        if(idsArr.length == 0)
        {
            layer.open({content: "请选择需要结算的商品", skin: 'msg', time: 2});
            return;
        }
        $("#cartIds").val(idsArr.toString());
        $("#orderForm").submit();
    }
    
    function settleMoney() {
        var _totalMoney = 0.00;
        var _selectLen = $("input[name='cartpro']:checked").length;
        if (_selectLen == 0) {
        }
        else {
            $("input[name='cartpro']:checked").each(function () {
                var _index = $(this).attr("id").replace("cart-pto", "");
                var _price = $("#price_" + _index).val();
                console.log("_price:" + _price);
                var _num = $("#panel_pd" + _index).find(".Spinner").attr("amount");
                _totalMoney += _price * _num;
            });
        }
        $("#zong1").text("¥" + number_format(_totalMoney, 2));
    }

    function deleteCart(id,index) {
        $.ajax({
            url: "/shop/deleteCart.do",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            type: "POST",
            dataType: "json",
            traditional: true,
            data: {
                id: id
            },
            success: function (result) {
                if (result.success) {
                    $("#panel_pd" + index).remove();
                }
            }
        });
    }

    $(document).on("click", ".wy-dele", function (e) {
        var _currentIndex = $($(e)[0].currentTarget).attr("index");
        $.modal({
            title: '<img src="/img/jinggao.png"/>',
            text: "是否删除该商品",
            buttons: [
                {
                    text: "是,不要了", className: "default", onClick: function () {
                    var _id = $("#product_id_" + _currentIndex).val();
                    deleteCart(_id,_currentIndex);
                    settleMoney();
                }
                },
                {
                    text: "否,点错了", onClick: function () {
                    console.log(2)
                }
                }
            ]
        });
    });

</script>

</body>
</html>
