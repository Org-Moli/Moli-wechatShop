package com.imory.product.controller;

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
 * @Date 2017/9/30
 */
@Controller
@RequestMapping("/productAjax")
public class ProductInfoAjaxController {

    @RequestMapping(value = "/listProduct", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    String listProduct(Integer indexType, Integer startPos, Integer maxRows)
    {
        JSONObject jsonObject = new JSONObject();

        ResultBean resultBean = (ResultBean) UnirestUtils
                .postObjectResponse("/product/listProduct?startPos=" + startPos + "&maxRows=" + maxRows + (indexType != null ? "&indexType=" + indexType : ""), ResultBean.class);
        if (resultBean.getSuccess())
        {
            jsonObject.put("success", true);
            jsonObject.put("productList", resultBean.getResultMap().get("productList"));
        } else
        {
            jsonObject.put("success", false);
        }
        return jsonObject.toString();
    }

}
