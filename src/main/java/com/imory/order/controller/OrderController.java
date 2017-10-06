package com.imory.order.controller;

import com.imory.annotation.SessionCheck;
import com.imory.base.ResultBean;
import com.imory.utils.UnirestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>名称</p>
 * <p/>
 * <p>wikiURL</p>
 *
 * @author zb.jiang
 * @version 1.0
 * @Date 2017/10/5
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @RequestMapping("/toOrder")
    @SessionCheck
    public String toOrder(String ids, Model model)
    {
        ResultBean resultBean = (ResultBean) UnirestUtils
                .postObjectResponse("/shop/orderCart?ids=" + ids, ResultBean.class);
        if (resultBean.getSuccess())
        {
            model.addAttribute("shopPingCartList", resultBean.getResultMap().get("shopPingCartList"));
        }
        return "/order/orderInfo";
    }
}
