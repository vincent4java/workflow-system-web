package com.v4java.workflow.action.system;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.v4java.enumerate.MD5Utils;
import com.v4java.utils.DateUtil;
import com.v4java.workflow.constant.AdminConst;
import com.v4java.workflow.pojo.Xf9System;
import com.v4java.workflow.query.system.Xf9SystemQuery;
import com.v4java.workflow.redis.util.JedisUtil;
import com.v4java.workflow.service.system.IXf9SystemService;
import com.v4java.workflow.vo.BTables;
import com.v4java.workflow.vo.UpdateStatus;
import com.v4java.workflow.vo.system.Xf9SystemVO;

@Controller
@Scope("prototype")
@RequestMapping("/xf9System")
public class Xf9SystemAction {
	
	
	private static final Logger LOGGER = Logger.getLogger(Xf9SystemAction.class);
	
	@Autowired
	private IXf9SystemService xf9SystemService; 
	

	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public @ResponseBody int register(@RequestBody Xf9System xf9System){
		xf9System.setUserPwd(MD5Utils.md5SaltMd5(xf9System.getUserPwd(), xf9System.getUserCode()));
		int n = -1;
		try {
			 n =xf9SystemService.insertXf9System(xf9System);
			 if (n==1) {
				JedisUtil.getInstance().hset("system:"+xf9System.getUserCode(), "ObJson", JSON.toJSONString(xf9System));
			}
		} catch (Exception e) {
			LOGGER.error("注册系统失败"+xf9System.getName(), e);
		}
		return n;
		
	}
	
	
	@RequestMapping(value = "/findXf9System",method = RequestMethod.GET)
	public String findXf9System(){
		return "page/xf9system/index";
		
	}
	
	@RequestMapping(value = "/findXf9SystemJson",method = RequestMethod.POST)
	public @ResponseBody BTables<Xf9SystemVO> findXf9SystemJson(@RequestBody Xf9SystemQuery xf9SystemQuery){
		BTables<Xf9SystemVO> bTables = new BTables<Xf9SystemVO>();
		List<Xf9SystemVO> xf9SystemVos = null;
		try {
			xf9SystemVos  = xf9SystemService.findXf9Systems(xf9SystemQuery);
			int total = xf9SystemService.findXf9SystemCount(xf9SystemQuery);
			StringBuffer op = null;
			for (Xf9SystemVO xf9SystemVO : xf9SystemVos) {
				xf9SystemVO.setStatusName(AdminConst.STATUS_NAME[xf9SystemVO.getStatus()]);
				xf9SystemVO.setCreateTimeName(DateUtil.datetimeToStr(xf9SystemVO.getCreateTime()));
				xf9SystemVO.setUpdateTimeName(DateUtil.datetimeToStr(xf9SystemVO.getUpdateTime()));
				op = new StringBuffer();
				//冻结/解冻 按钮
				op.append("<button name=\"updateStatus\"");
				//data-id
				op.append("data-name=\"status\" data-id=\"");
				op.append(xf9SystemVO.getId());
				op.append("\" ");
				//data-val
				op.append("data-status=\"");
				op.append(AdminConst.OP_STATUS[xf9SystemVO.getStatus()]);
				op.append("\" ");
				op.append("type=\"button\" op-url=\"/xf9System/updateXf9SystemStatus.do\" class=\"btn btn-warning btn-flat\">");
				op.append(AdminConst.OP_STATUS_NAME[xf9SystemVO.getStatus()]);
				op.append("</button>");
/*				op.append("<a href=\"/jobsUser/findJobsUser/"+xf9SystemVO.getId()+".do\""+" class=\"btn btn-warning btn-flat\">修改");
				op.append("</a>");*/
				xf9SystemVO.setOperation(op.toString());
				op = null;
			}
			bTables.setRows(xf9SystemVos);
			bTables.setTotal(total);
		} catch (Exception e) {
			LOGGER.error("查询系统错误", e);
		}
		return bTables;
	}
	
	
	/**
	 * 更改系统状态
	 * @return
	 */
	@RequestMapping(value = "/updateXf9SystemStatus",method = RequestMethod.POST)
	public @ResponseBody UpdateStatus updateXf9SystemStatus(@RequestBody Xf9System xf9System){
		UpdateStatus updateStatus = new UpdateStatus();
		try {
			int n  = xf9SystemService.updateXf9SystemStatus(xf9System);
			updateStatus.setIsSuccess(n);
			updateStatus.setMsg("更改系统状态失败");
			if (n==1) {
				int x =xf9System.getStatus();
				updateStatus.setTarget("status");
				updateStatus.setStatus(x);
				updateStatus.setStatusName(AdminConst.STATUS_NAME[x]);
				updateStatus.setOpStatus(AdminConst.OP_STATUS[x]);
				updateStatus.setOpStatusName(AdminConst.OP_STATUS_NAME[x]);
				updateStatus.setMsg("更改系统状态成功");
			}
			updateStatus.setIsSuccess(n);
		} catch (Exception e) {
			LOGGER.error("更改系统状态", e);
		}
		
		return updateStatus;
	}
	
}

