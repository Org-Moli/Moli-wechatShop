package com.imory.shop.controller;

import com.imory.base.ResultBean;
import com.imory.utils.UnirestUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
@RequestMapping("/shop")
public class ShopCartAjaxController {

    @RequestMapping(value = "/deleteCart", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    String deleteCart(Integer id)
    {
        JSONObject jsonObject = new JSONObject();

        ResultBean resultBean = (ResultBean) UnirestUtils
                .postObjectResponse(("/shop/deleteCart?id=" + id ), ResultBean.class);
        if (resultBean.getSuccess())
        {
            jsonObject.put("success", true);
        } else
        {
            jsonObject.put("success", false);
        }
        return jsonObject.toString();
    }

    @RequestMapping(value = "/updateCart", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    String updateCart(Integer id, Integer num)
    {
        JSONObject jsonObject = new JSONObject();

        ResultBean resultBean = (ResultBean) UnirestUtils
                .postObjectResponse(("/shop/updateCart?id=" + id + "&num=" + num), ResultBean.class);
        if (resultBean.getSuccess())
        {
            jsonObject.put("success", true);
        } else
        {
            jsonObject.put("success", false);
        }
        return jsonObject.toString();
    }
}
