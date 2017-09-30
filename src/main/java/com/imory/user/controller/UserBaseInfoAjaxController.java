package com.imory.user.controller;

import com.imory.user.bean.UserBase;
import com.imory.utils.UnirestUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
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
 * @Date 2017/9/29
 */
@Controller
@RequestMapping("/userBaseAjax")
public class UserBaseInfoAjaxController {

    @Value("#{runtimeProperties['serviceUrl']}")
    private String serviceUrl;

    @RequestMapping(value = "/logon", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    String logon(String mobile, String yzmCode, Integer captchaId)
    {
        JSONObject jsonObject = new JSONObject();

        UserBase userBase = (UserBase) UnirestUtils
                .postObjectResponse(serviceUrl + "/userBase/login", UserBase.class);
        if (userBase.getSuccess())
        {
            jsonObject.put("success", true);
        } else
        {
            jsonObject.put("success", false);
        }
        return jsonObject.toString();
    }
}
