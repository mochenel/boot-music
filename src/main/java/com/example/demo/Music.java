package com.example.demo;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Music implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 74458L;
	
	private String categoryName;
	private List<MultipartFile> songs;

	
	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<MultipartFile> getSongs() {
		return songs;
	}

	public void setSongs(List<MultipartFile> songs) {
		this.songs = songs;
	}
	
	
	

	
}
