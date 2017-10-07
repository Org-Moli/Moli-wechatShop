package com.imory.user.controller;

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
 * @Date 2017/9/29
 */
@Controller
@RequestMapping("/userBase")
public class UserBaseInfoController {

    @RequestMapping("/login")
    public String login(Model model)
    {
        return null;
    }

    @RequestMapping("/addressList")
    @SessionCheck
    public String addressList(HttpSession session, Model model)
    {
        UserBase userBase = (UserBase) session.getAttribute(UserBase.USER_SESSION_ID);

        ResultBean addressBean = (ResultBean) UnirestUtils
                .postObjectResponse("/delivery/listUserDeliveryAddress.do?userId=" + userBase.getUser_id(), ResultBean.class);
        if (addressBean.getSuccess())
        {
            model.addAttribute("deliveryAddressList", addressBean.getResultMap().get("deliveryAddressList"));
        }
        return null;
    }

}
