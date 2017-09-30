<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>安e购</title>
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
<!--顶部搜索-->
<header class='weui-header'>
    <div class="weui-search-bar" id="searchBar">
        <form class="weui-search-bar__form">
            <div class="weui-search-bar__box">
                <i class="weui-icon-search"></i>
                <input type="search" class="weui-search-bar__input" id="searchInput" placeholder="搜索您想要的商品" required>
                <a href="javascript:" class="weui-icon-clear" id="searchClear"></a>
            </div>
            <label class="weui-search-bar__label" id="searchText"
                   style="transform-origin: 0px 0px 0px; opacity: 1; transform: scale(1, 1);">
                <i class="weui-icon-search"></i>
                <span>搜索您想要的商品</span>
            </label>
        </form>
        <a href="javascript:" class="weui-search-bar__cancel-btn" id="searchCancel">取消</a>
    </div>
</header>
<!--主体-->
<div class='weui-content' style="width:100%;overflow-x: hidden;">
    <!--顶部轮播-->
    <div class="swiper-container swiper-banner">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><a href="pro_info.html"><img src="/img/upload/ban1.png"/></a></div>
            <div class="swiper-slide"><a href="pro_list.html"><img src="/img/upload/ban1.png"/></a></div>
            <div class="swiper-slide"><a href="pro_info.html"><img src="/img/upload/ban1.png"/></a></div>
            <div class="swiper-slide"><a href="pro_list.html"><img src="/img/upload/ban1.png"/></a></div>
        </div>
        <div class="swiper-pagination"></div>
    </div>
    <!--图标分类-->
    <div class="weui-flex wy-iconlist-box">
        <div class="weui-flex__item"><a href="pro_list.html" class="wy-links-iconlist">
            <div class="img"><img src="/img/icon-link1.png"></div>
            <p>进口红酒</p></a></div>
        <div class="weui-flex__item"><a href="pro_list.html" class="wy-links-iconlist">
            <div class="img"><img src="/img/icon-link2.png"></div>
            <p>手工家纺</p></a></div>
        <div class="weui-flex__item"><a href="pro_list.html" class="wy-links-iconlist">
            <div class="img"><img src="/img/icon-link3.png"></div>
            <p>精品服饰</p></a></div>
        <div class="weui-flex__item"><a href="javascript:;" onclick="toast('努力完善中...')" class="wy-links-iconlist">
            <div class="img"><img src="/img/icon-link4.png"></div>
            <p>积分商城</p></a></div>
    </div>
    <!--新闻切换-->
    <%--<div class="wy-ind-news">
        <i class="news-icon-laba"></i>
        <div class="swiper-container swiper-news">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><a href="news_info.html">客官，购买商品前请先点击了解....</a></div>
                <div class="swiper-slide"><a href="news_info.html">3345346点击了解....</a></div>
                <div class="swiper-slide"><a href="news_info.html">客65476点击了解....</a></div>

            </div>
            <div class="swiper-pagination"></div>
        </div>
        <a href="news_list.html" class="newsmore"><i class="news-icon-more"></i></a>
    </div>--%>
    <!--热门推荐-->
    <div class="wy-Module">
        <div class="wy-Module-tit"><!--<span >精选推荐</span>--><img src="/img/remen.png"/></div>
        <div class="wy-Module-con">
            <div class="swiper-container swiper-jingxuan" style="padding-top:34px;padding-left: 10px;">
                <div class="swiper-wrapper" id="rmProductDiv">
                    <script type="text/x-jquery-tmpl" id="rmProductTmpl">
                    <div class="swiper-slide">
                        <a href="/product/productDetail.do?productId=#[$data.product_id]">
                            <img src="#[$data.picture_url]"/>
                            <p>#[$data.product_name]</p>
                            <p>¥#[$data.price]</p>
                        </a>
                    </div>
                    </script>
                </div>
                <!-- <div class="swiper-pagination jingxuan-pagination"></div>-->
            </div>
        </div>
    </div>
    <!--新品上线-->
    <div class="wy-Module">
        <div class="wy-Module-tit"><!--<span>红酒推荐</span>--><img src="/img/xinpin.png"/></div>
        <div class="wy-Module-con">
            <div class="swiper-container swiper-jiushui" style="padding-top:34px;padding-left: 10px;">
                <div class="swiper-wrapper" id="xpProductDiv">
                    <script type="text/x-jquery-tmpl" id="xpProductTmpl">
                    <div class="swiper-slide">
                        <a href="/product/productDetail.do?productId=#[$data.product_id]">
                            <img src="#[$data.picture_url]"/>
                            <p>#[$data.product_name]</p>
                            <p>¥#[$data.price]</p>
                        </a>
                    </div>
                    </script>
                </div>
                <!-- <div class="swiper-pagination jingxuan-pagination"></div>-->
            </div>
        </div>
    </div>
    <!--猜你喜欢-->
    <%--<div class="wy-Module">
        <div class="wy-Module-tit" ><!--<span >精选推荐</span>--><img src="/img/caini.png" /></div>
        <div class="wy-Module-con">
            <div class="swiper-container swiper-jingxuan" style="padding-top:34px;padding-left: 10px;">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="pro_info.html">
                            <img src="/img/upload/jingxuan5.jpg"/>
                            <p>大牌精致时尚</p>
                            <p>¥299</p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="pro_info.html">
                            <img src="/img/upload/jingxuan5.jpg"/>
                            <p>大牌精致时尚</p>
                            <p>¥299</p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="pro_info.html">
                            <img src="/img/upload/jingxuan5.jpg"/>
                            <p>大牌精致时尚</p>
                            <p>¥299</p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="pro_info.html">
                            <img src="/img/upload/jingxuan5.jpg"/>
                            <p>大牌精致时尚</p>
                            <p>¥299</p>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="pro_info.html">
                            <img src="/img/upload/jingxuan5.jpg"/>
                            <p>大牌精致时尚</p>
                            <p>¥299</p>
                        </a>
                    </div>
                </div>
                <!-- <div class="swiper-pagination jingxuan-pagination"></div>-->
            </div>
        </div>
    </div>--%>
    <!--猜你喜欢-->
    <!--<div class="wy-Module">
      <div class="wy-Module-tit-line"><span>猜你喜欢</span></div>
      <div class="wy-Module-con">
        <ul class="wy-pro-list clear">
          <li>
            <a href="pro_info.html">
              <div class="proimg"><img src="/img/upload/pro1.jpg"></div>
              <div class="protxt">
                <div class="name">洋河蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食白酒2瓶装包邮</div>
                <div class="wy-pro-pri">¥<span>296.00</span></div>
              </div>
            </a>
          </li>
          <li>
            <a href="pro_info.html">
              <div class="proimg"><img src="/img/upload/pro2.jpg"></div>
              <div class="protxt">
                <div class="name">洋河蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食白酒2瓶装包邮</div>
                <div class="wy-pro-pri">¥<span>296.00</span></div>
              </div>
            </a>
          </li>
          <li>
            <a href="pro_info.html">
              <div class="proimg"><img src="/img/upload/pro3.jpg"></div>
              <div class="protxt">
                <div class="name">洋河蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食白酒2瓶装包邮</div>
                <div class="wy-pro-pri">¥<span>296.00</span></div>
              </div>
            </a>
          </li>
          <li>
            <a href="pro_info.html">
              <div class="proimg"><img src="/img/upload/pro4.jpg"></div>
              <div class="protxt">
                <div class="name">洋河蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食白酒2瓶装包邮</div>
                <div class="wy-pro-pri">¥<span>296.00</span></div>
              </div>
            </a>
          </li>
          <li>
            <a href="pro_info.html">
              <div class="proimg"><img src="/img/upload/pro5.jpg"></div>
              <div class="protxt">
                <div class="name">洋河蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食白酒2瓶装包邮</div>
                <div class="wy-pro-pri">¥<span>296.00</span></div>
              </div>
            </a>
          </li>
          <li>
            <a href="pro_info.html">
              <div class="proimg"><img src="/img/upload/pro1.jpg"></div>
              <div class="protxt">
                <div class="name">洋河蓝色瓶装经典Q7浓香型白酒500ml52度高端纯粮食白酒2瓶装包邮</div>
                <div class="wy-pro-pri">¥<span>296.00</span></div>
              </div>
            </a>
          </li>
        </ul>
        <div class="morelinks"><a href="pro_list.html">查看更多 >></a></div>
      </div>
    </div>-->
</div>

<%@include file="/WEB-INF/jsp/include/footer.jsp"%>
<script src="/scripts/jquery-2.1.4.js"></script>
<script src="/scripts/fastclick.js"></script>
<script src="/scripts/jquery-weui.js"></script>
<script src="/scripts/swiper.min.js"></script>
<script src="/scripts/jquery.tmpl.min.js"></script>
<script>

    $(document).ready(function () {
        FastClick.attach(document.body);
        loadRmProduct();
        loadXpProduct();
    });

    function loadRmProduct() {
        $.post("/productAjax/listProduct.do",{indexType:1,startPos:0,maxRows:12},function(result) {
            if (result.success) {
                var productList = result.productList;
                if(productList != undefined && productList.length > 0)
                {
                    $("#rmProductTmpl").tmpl(productList).appendTo("#rmProductDiv");
                    $(".swiper-jingxuan").swiper({
                        pagination: '.swiper-pagination',
                        loop: false,
                        /*paginationType:'fraction',*/
                        slidesPerView: 3,
                        paginationClickable: false,
                        spaceBetween: 10
                    });
                }
            }
        });
    }

    function loadXpProduct() {
        $.post("/productAjax/listProduct.do",{indexType:2,startPos:0,maxRows:12},function(result) {
            if (result.success) {
                var productList = result.productList;
                if(productList != undefined && productList.length > 0)
                {
                    $("#xpProductTmpl").tmpl(productList).appendTo("#xpProductDiv");
                    $(".swiper-jiushui").swiper({
                        pagination: '.swiper-pagination',
                        /*paginationType:'fraction',*/
                        loop: false,
                        slidesPerView: 3,
                        slidesPerColumn: 2,
                        paginationClickable: false,
                        spaceBetween: 10
                    });
                }
            }
        });
    }

    $(".swiper-banner").swiper({
        loop: true,
        paginationType: 'bullets',
        paginationClickable: false,
        autoplay: 3000
    });
    $(".swiper-news").swiper({
        loop: true,
        direction: 'vertical',
        paginationHide: true,
        autoplay: 3000
    });

    function toast(cont) {
        $(".fixed-tishi").html(cont).show();
        setTimeout(function () {
            $(".fixed-tishi").hide();
        }, 1000);
    }
</script>
</body>
</html>
