package com.cleanAndHonest.servlet;

import java.io.FileInputStream;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.cleanAndHonest.Util.Constants;

public class InitServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		
		String path;
		FileInputStream fis;
		
		try{
			//读取conf.properties文件
			path = InitServlet.class.getResource("/").getPath();
			fis = new FileInputStream(path + "conf.properties");
			Properties properties = new Properties();
			properties.load(fis);
			fis.close();
			
			//覆盖Constants中相关的属性值
			String pdf2swf = properties.getProperty("pdf2swf");
			String openoffice = properties.getProperty("openoffice");
			if (pdf2swf != null) {
				Constants.PDF2SWF = pdf2swf;
			}
			if (openoffice != null) {
				Constants.OPENOFFICE = openoffice;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
