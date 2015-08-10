package com.v4java.workflow.vo;

import java.io.Serializable;

public class LoginMsg implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3995344207857357107L;

	private boolean flag ;
	
	private String msg;
	
	private Integer failCount;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getFailCount() {
		return failCount;
	}

	public void setFailCount(Integer failCount) {
		this.failCount = failCount;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
	
}
