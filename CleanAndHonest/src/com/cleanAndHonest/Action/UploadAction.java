package com.cleanAndHonest.Action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import com.cleanAndHonest.Action.base.BaseAction;

public class UploadAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File upload;
	private String uploadContentType;
	private String name;
	private String uploadFileName;
	private String attPath;

	private String result;

	public String Upload() throws Exception {

		File file = null;
		if (upload.length() > 600 * 1024) {
			result = "文件大小不合适";
			return "Size";
		}
		
		InputStream IS = new FileInputStream(upload);
		String uploadPath = serContext.getRealPath("attach/"+ attPath + "/") ;

		System.out.println("文件上传地址：" + uploadPath);
		/*try {
			file = new File(uploadPath);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("文件创建失败");
		}*/
	
		file = new File(uploadPath);
		
		if (!file.exists()) {
			file.mkdirs();
		}
		
		File toFile = new File(uploadPath, this.getUploadFileName());
		OutputStream os = new FileOutputStream(toFile);
		byte[] buffer = new byte[1024];
		int length = 0;
		while ((length = IS.read(buffer)) > 0) {
			os.write(buffer, 0, length);
		}
		IS.close();
		os.close();
		result = "上传成功";
		return "Upsuccess";
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getAttPath() {
		return attPath;
	}

	public void setAttPath(String attPath) {
		this.attPath = attPath;
	}
	
}
