package com.imory.product.controller;

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
 * @Date 2017/9/30
 */
@Controller
@RequestMapping("/product")
public class ProductInfoController {

    @RequestMapping("/productDetail")
    public String productDetail(Integer productId, Model model)
    {
        ResultBean resultBean = (ResultBean) UnirestUtils
                .postObjectResponse("/product/productDetail?productId=" + productId, ResultBean.class);
        if (resultBean.getSuccess())
        {
            model.addAttribute("product", resultBean.getResultMap().get("product"));
        }
        return null;
    }

}
