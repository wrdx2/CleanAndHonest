package com.cleanAndHonest.Action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

import javax.imageio.ImageIO;

import sun.misc.BASE64Encoder;

import com.cleanAndHonest.Action.base.BaseAction;
import com.cleanAndHonest.Util.newCheckCode;
import com.cleanAndHonest.Util.Json;

public class changeCheck extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//private HttpServletRequest request ;
	private String chcode;
	private newCheckCode checkCode = new newCheckCode();
	
	public String execute() throws Exception{
		Json json = new Json();
		
		BufferedImage img = checkCode.createCode();
		chcode=checkCode.getValcode();
		//Map<String,Object> session = ActionContext.getContext().getSession();
		//session.put("valcode",chcode);
		//request.setAttribute("valcode2", chcode);
		//System.out.println(code.getValcode());
		ByteArrayOutputStream outputStream = null;
		outputStream = new ByteArrayOutputStream();
	    ImageIO.write(img, "gif", outputStream);
		BASE64Encoder encoder = new BASE64Encoder();
		String src = encoder.encode(outputStream.toByteArray());
		
		json.setSuccess(true);
		json.setObj(src);
		json.setMsg(chcode);
		
        WriteJson(json);
		return null;
	}
	
	public void setCheckCode(newCheckCode checkCode) {
		this.checkCode = checkCode;
	}

	public String getChcode() {
		return chcode;
	}
	public void setChcode(String chcode) {
		this.chcode = chcode;
	}
	
}