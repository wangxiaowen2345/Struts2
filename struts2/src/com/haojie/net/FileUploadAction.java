package com.haojie.net;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import com.haojie.extend.AllFunction;
import com.haojie.impl.PicImpl;
import com.haojie.pojo.Pic;

public class FileUploadAction extends AllFunction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3783278212837508484L;
	private static final int BUFFER_SIZE = 16 * 1024;
	private List<File> myFile = new ArrayList<File>();
	private List<String> contentType = new ArrayList<String>();
	private List<String> fileName = new ArrayList<String>(); // 文件名
	private List<String> imageFileName = new ArrayList<String>();
	private String caption;
	private String function;
	private String value1;
	private String caridnum;
	private String id;
	private String value2;

	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				System.out.println("正在执行图片上传中的copy（）。。。。");
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static String getExtention(String fileName) {
		System.out.println("正在执行图片上传中的getExtention。。。。");
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	@Override
	public String execute() {
		System.out.println("正在执行图片上传中的execute。。。。");
		String carid = getCaridnum();
		System.out.println(carid);
		String id = getId();
		if (id != null)
			DeletePic(Integer.valueOf(id).intValue());
		if (myFile.isEmpty())
			return INPUT;
		else {
			for (int i = 0; i < myFile.size(); i++) {
				imageFileName.add(carid + "+" + new Date().getTime()
						+ getExtention(this.getMyFileFileName().get(i)));
				File imageFile = new File(ServletActionContext
						.getServletContext() // 得到图片保存的位置(根据root来得到图片保存的路径在tomcat下的该工程里)

						.getRealPath("UploadImages")
						+ "/" + imageFileName.get(i));
				String path = ServletActionContext.getServletContext()
						.getRealPath("UploadImages")
						+ "/" + imageFileName.get(i);
				copy(myFile.get(i), imageFile); // 把图片写入到上面设置的路径里
				System.out.println(carid);
				AddPic(path, carid);
			}
			return INPUT;
		}
	}

	/**
	 * 添加图片
	 * 
	 * @return
	 */
	public String AddPic(String path, String carid) {
		long startTime = System.currentTimeMillis();

		String rs = "";
		PicImpl oi = new PicImpl();
		Pic p = new Pic();
		if (path != null) {
			p.setPath(path);
			p.setCarid(carid);
			oi.AddPic(p);
			rs = "success";
		}

		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("添加图片耗时：" + Float.toString(seconds) + " 秒");
		return rs;
	}

	public List<Pic> PicByCar(String carid) {
		long startTime = System.currentTimeMillis();
		PicImpl oi = new PicImpl();
		List<Pic> rs = oi.SelectByCar(carid);
		for (int i = 0; i < rs.size(); i++) {
			int num = rs.get(i).getPath().lastIndexOf("/");

			String temp = rs.get(i).getPath().substring(num);
			rs.get(i).setPath(temp);
		}
		long endTime = System.currentTimeMillis();
		float seconds = (endTime - startTime) / 1000F;
		System.out.println("查询carid = " + carid + " 总耗时："
				+ Float.toString(seconds) + " 秒");

		return rs;
	}

	@Test
	public void aa() {
		System.out.println(PicByCar("1").size());
	}

	public List<File> getMyFile() {
		return myFile;
	}

	public void setMyFile(List<File> myFile) {
		this.myFile = myFile;
	}

	public List<String> getContentType() {
		return contentType;
	}

	public void setContentType(List<String> contentType) {
		this.contentType = contentType;
	}

	public List<String> getMyFileFileName() {
		return fileName;
	}

	public void setMyFileFileName(List<String> fileName) {
		this.fileName = fileName;
	}

	public List<String> getFileName() {
		return fileName;
	}

	public void setFileName(List<String> fileName) {
		this.fileName = fileName;
	}

	public List<String> getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(List<String> imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public static int getBufferSize() {
		return BUFFER_SIZE;
	}

	public void setValue1(String value1) {
		this.value1 = value1;
	}

	public String getValue1() {
		return value1;
	}

	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setCaridnum(String caridnum) {
		this.caridnum = caridnum;
	}

	public String getCaridnum() {
		return caridnum;
	}

}
