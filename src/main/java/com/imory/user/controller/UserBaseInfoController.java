package com.imory.user.controller;

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

}
