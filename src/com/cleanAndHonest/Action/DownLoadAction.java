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
	private String name;

	public InputStream getInStream(){
		System.out.println("下载的文件：" + fileName.trim());
		return serContext.getResourceAsStream(fileName.trim());
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		try {
			name = new String(name.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "downloadSuccess";
	}
	
	/*public String getFileName() {
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
	}*/

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	
}
