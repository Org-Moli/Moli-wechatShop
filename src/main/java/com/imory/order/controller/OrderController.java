package com.imory.order.controller;

import com.imory.annotation.SessionCheck;
import com.imory.base.ResultBean;
import com.imory.user.bean.UserBase;
import com.imory.utils.UnirestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

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
    public String toOrder(String ids, HttpSession session, Model model)
    {
        UserBase userBase = (UserBase) session.getAttribute(UserBase.USER_SESSION_ID);
        ResultBean resultBean = (ResultBean) UnirestUtils
                .postObjectResponse("/shop/orderCart?ids=" + ids, ResultBean.class);
        if (resultBean.getSuccess())
        {
            model.addAttribute("shopPingCartList", resultBean.getResultMap().get("shopPingCartList"));
        }

        ResultBean addressBean = (ResultBean) UnirestUtils
                .postObjectResponse("/delivery/listUserDeliveryAddress.do?userId=" + userBase.getUser_id() + "&defaultFlag=true", ResultBean.class);
        if (addressBean.getSuccess())
        {
            List deliveryAddressList = (List) addressBean.getResultMap().get("deliveryAddressList");
            model.addAttribute("deliveryAddress", deliveryAddressList.get(0));
        }
        return "/order/orderInfo";
    }
}
