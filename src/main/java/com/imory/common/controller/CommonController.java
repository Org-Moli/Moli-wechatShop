package com.imory.common.controller;

import org.springframework.stereotype.Controller;
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
@RequestMapping("/common")
public class CommonController {

    @RequestMapping("/index")
    public String index()
    {
        return "/index";
    }
}
