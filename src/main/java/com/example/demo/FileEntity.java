package com.example.demo;

import org.springframework.stereotype.Component;

@Component
public class FileEntity {
	
	private int fileId;
	private String fileName;
	private String fileType;
	private double fileSize;
	private String path;
	private String getCategoryName;
	private int userId;
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public double getFileSize() {
		return fileSize;
	}
	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}

	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public String getGetCategoryName() {
		return getCategoryName;
	}
	public void setGetCategoryName(String getCategoryName) {
		this.getCategoryName = getCategoryName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
	
}
