package com.angeltqs.crm.mvc.hander;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestHander {
	@RequestMapping("/test")
	public String test(ModelMap map) {
	    map.put("thText", "设置文本内容");
	    map.put("thUText", "设置文本内容");
	    map.put("thValue", "设置当前元素的value值");
	    map.put("thEach", Arrays.asList("列表", "遍历列表"));
	    map.put("thIf", "msg is not null");
	    
	    return "test";
	}
}
