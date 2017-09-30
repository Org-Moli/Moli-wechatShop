package com.imory.common.controller;

import com.imory.base.ResultBean;
import com.imory.utils.UnirestUtils;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * <p>名称</p>
 * <p/>
 * <p>wikiURL</p>
 *
 * @author zb.jiang
 * @version 1.0
 * @Date 2017/9/30
 */
@RestController
@RequestMapping("/commonAjax")
public class CommonAjaxController {

    @RequestMapping(value = "/sendSmsCaptcha", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    String sendSmsCaptcha(String mobile, String sign)
    {
        JSONObject jsonObject = new JSONObject();

        ResultBean resultBean = (ResultBean) UnirestUtils
                .postObjectResponse("/phoneCaptcha/sendCaptCha?mobile=" + mobile + "&sing=" + sign, ResultBean.class);
        if (resultBean.getSuccess())
        {
            jsonObject.put("success", true);
            Map phoneCaptchaMap = (Map) resultBean.getResultMap().get("phoneCaptcha");
            jsonObject.put("id", phoneCaptchaMap.get("id"));
        } else
        {
            jsonObject.put("errMsg", resultBean.getResultMsg());
            jsonObject.put("success", false);
        }
        return jsonObject.toString();
    }
}
