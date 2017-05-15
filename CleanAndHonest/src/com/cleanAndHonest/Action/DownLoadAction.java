package com.cleanAndHonest.Action;


import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import com.cleanAndHonest.Action.base.BaseAction;

public class DownLoadAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fileName;
	private String dir;

	public InputStream getInputStream(){
		return serContext.getResourceAsStream( dir + "/"+fileName);
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return "downloadSuccess";
	}
	
	public String getFileName() {
		String name = "";
		try{
			name = new String(fileName.getBytes("GBK"),"ISO-8859-1");
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		return name;
	}

	public void setFileName(String fileName) {
		try{
			this.fileName = new String(fileName.getBytes("ISO-8859-1"),"GBK");
		}catch (UnsupportedEncodingException e) {
			// TODO: handle exception
		}
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}	
}
