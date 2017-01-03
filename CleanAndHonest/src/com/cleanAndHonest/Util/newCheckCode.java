package com.cleanAndHonest.Util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

public class newCheckCode {
	// 产生由4位数字构成的验证码
	private int length = 4;
	private String valcode = "";
	/*private ActionContext ac = ActionContext.getContext();*/
	
	public String getValcode() {
		return valcode;
	}

	String srcImagePath = "C:\\Java\\Tomcat 7.0\\webapps\\CleanAndHonest\\images\\pic05.gif";

	public newCheckCode(){
		// TODO Auto-generated constructor stub
		super();
	}
	
	public void createCode() throws IOException{
		Random rd = new Random();
		String vc = "";
		
		for (int i = 0; i < length; i++)
			vc += rd.nextInt(10);
		
		valcode=vc;

		/*// 把产生的验证码存入到Session中
		Map<String, Object> session = ac.getSession();
		session.put("valcode", valcode);*/

		// 产生图片
		int width = 109;
		int height = 30;
		BufferedImage img = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		
		/*//读入图片文件     
        File file = new File(srcImagePath);
        // 构造Image对象
        BufferedImage img = ImageIO.read(file);
        int width = img.getWidth();
        int height = img.getHeight();*/
        
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

		// 输出图像
		g.dispose();
		ImageIO.write(img, "gif", new File(srcImagePath));
	}
}