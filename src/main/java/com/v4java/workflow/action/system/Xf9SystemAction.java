package com.v4java.workflow.action.system;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.v4java.enumerate.MD5Utils;
import com.v4java.workflow.pojo.Xf9System;
import com.v4java.workflow.redis.util.JedisUtil;
import com.v4java.workflow.service.system.IXf9SystemService;


@Controller
@Scope("prototype")
@RequestMapping("/xf9System")
public class Xf9SystemAction {
	
	
	private static final Logger LOGGER = Logger.getLogger(Xf9SystemAction.class);
	
	@Autowired
	private IXf9SystemService xf9SystemService; 
	

	@RequestMapping(value = "/register/{name}/{userCode}/{userName}/{userPwd}/{systemCode}",method = RequestMethod.GET)
	public @ResponseBody int register(@PathVariable String name,@PathVariable String userCode,@PathVariable String userName,@PathVariable String userPwd,@PathVariable String systemCode){
		Xf9System system = new Xf9System();
		system.setDescription("haha");
		system.setName(name);
		system.setStatus(0);
		system.setUserCode(userCode);
		system.setUserName(userName);
		system.setSystemCode(systemCode);
		system.setUserPwd(MD5Utils.md5SaltMd5(userPwd, userCode));
		int n = -1;
		try {
			 n =xf9SystemService.insertXf9System(system);
			 if (n==1) {
				JedisUtil.getInstance().hset("system:"+systemCode, "ObJson", JSON.toJSONString(system));
			}
		} catch (Exception e) {
			LOGGER.error("注册系统失败"+name, e);
		}
		return n;
		
	}
}
