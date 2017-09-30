package com.imory.user.controller;

import com.imory.base.ResultBean;
import com.imory.user.bean.UserBase;
import com.imory.utils.UnirestUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

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

    @RequestMapping(value = "/logon", produces = {"application/json;charset=UTF-8"})
    public @ResponseBody
    String logon(String mobile, String yzmCode, Integer captchaId, HttpSession session)
    {
        JSONObject jsonObject = new JSONObject();

        String origUrl = (String) session.getAttribute(UserBase.ORIG_URI);

        ResultBean resultBean = (ResultBean) UnirestUtils
                .postObjectResponse("/userBase/login?mobile=" + mobile + "&yzmCode=" + yzmCode + "&captchaId=" + captchaId, ResultBean.class);
        if (resultBean.getSuccess())
        {
            jsonObject.put("success", true);
            jsonObject.put("origUrl", origUrl);
            if (StringUtils.isNotBlank(origUrl))
            {
                session.setAttribute(UserBase.ORIG_URI, "");
            }
            Map userBaseMap = (Map) resultBean.getResultMap().get("userBase");

            UserBase userBase = new UserBase();
            userBase.setUser_id((Integer) userBaseMap.get("user_id"));
            userBase.setMobile((String) userBaseMap.get("mobile"));
            userBase.setStatus((Integer) userBaseMap.get("status"));
            userBase.setUser_name((String) userBaseMap.get("user_name"));
            session.setAttribute(UserBase.USER_SESSION_ID, userBase);
        } else
        {
            jsonObject.put("success", false);
            jsonObject.put("errMsg", resultBean.getResultMsg());
        }
        return jsonObject.toString();
    }
}
