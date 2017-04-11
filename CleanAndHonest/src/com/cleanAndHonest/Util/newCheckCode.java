package com.cleanAndHonest.Util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class newCheckCode {
	// 产生由4位数字构成的验证码
	private int length = 4;
	private String valcode = "";
	/*private ActionContext ac = ActionContext.getContext();*/
	
	/**
	 * 获取生成的验证码
	 * @return 四位验证码
	 */
	public String getValcode() {
		return valcode;
	}

	/*String srcImagePath = "C:\\Java\\Tomcat7.0\\webapps\\CleanAndHonest\\images\\pic05.gif";*/

	public newCheckCode(){
		// TODO Auto-generated constructor stub
		super();
	}
	
	/**
	 * 创建验证码图片
	 * @return
	 * @throws IOException
	 */
	public BufferedImage createCode() throws IOException{
		Random rd = new Random();
		String vc = "";
		
		for (int i = 0; i < length; i++)
			vc += rd.nextInt(10);
		
		valcode=vc;
		
		// 产生图片
		int width = 109;
		int height = 30;
		BufferedImage img = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		
		// 获取一个Graphics
		Graphics g = img.getGraphics();

		// 填充背景色
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);

		// 填充干扰线50
		for (int i = 0; i < 50; i++) {
			g.setColor(new Color(rd.nextInt(255), rd.nextInt(255),
					rd.nextInt(255)));
			g.drawLine(rd.nextInt(width), rd.nextInt(height),
					rd.nextInt(width), rd.nextInt(height));
		}

		// 绘制边框
		g.setColor(Color.GRAY);
		g.drawRect(0, 0, width - 1, height - 1);

		// 绘制验证码
		Font[] fonts = { new Font("隶书", Font.BOLD, (int) (Math.random()*8+18)),
				new Font("楷体", Font.BOLD, (int) (Math.random()*8+18)), new Font("宋体", Font.BOLD, (int) (Math.random()*8+18)),
				new Font("幼圆", Font.BOLD, (int) (Math.random()*8+18)) };
		for (int i = 0; i < length; i++) {
			g.setColor(new Color(rd.nextInt(150), rd.nextInt(150), rd
					.nextInt(150)));
			g.setFont(fonts[rd.nextInt(fonts.length)]);
			g.drawString(valcode.charAt(i) + "", width / valcode.length() * i
					+ 2,(int) (Math.random()*8+18));
		}
		/*HttpServletResponse response = ServletActionContext.getResponse();
		OutputStream out = response.getOutputStream();
		// 输出图像
		g.dispose();
		ImageIO.write(img, "gif", out);
		out.close();*/
		
		return img;
	}
}