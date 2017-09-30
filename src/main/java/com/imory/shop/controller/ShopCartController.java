package com.imory.shop.controller;

import com.imory.annotation.SessionCheck;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>名称</p>
 * <p/>
 * <p>wikiURL</p>
 *
 * @author zb.jiang
 * @version 1.0
 * @Date 2017/9/30
 */
@Controller
@RequestMapping("/shop")
public class ShopCartController {

    @RequestMapping("/cartDetail")
    @SessionCheck
    public String cartDetail()
    {
        return "/shop/shopcart";
    }

}
